#!/usr/bin/env bash
# publish-daily-radar.sh — Convierte el Tech Radar diario en post del blog sabatech.dev
# y lo publica (commit + push → Cloudflare Pages deploy automático).
#
# Uso: publish-daily-radar.sh [YYYY-MM-DD]
# Exit codes: 0 publicado/ya existía · 1 sin reporte · 2 error de git
set -euo pipefail

REPO_DIR="/home/joker/repos/sabatech.dev"
RADAR_DIR="/home/joker/.openclaw/workspace/reports/cron/tech-radar"
DATE="${1:-$(date +%F)}"

# Resolver reporte: fecha pedida o la más reciente disponible (hasta 3 días atrás)
SRC=""
for i in 0 1 2; do
  CAND="$(date -d "$DATE - $i day" +%F 2>/dev/null || true)"
  [ -z "$CAND" ] && break
  if [ -f "$RADAR_DIR/$CAND.md" ]; then SRC="$RADAR_DIR/$CAND.md"; DATE="$CAND"; break; fi
done
if [ -z "$SRC" ]; then
  echo "NO_REPORT: sin reporte radar para $DATE ni 2 días anteriores"
  exit 1
fi
echo "SOURCE: $SRC"

SLUG="radar-tecnologico-$DATE"
DEST="$REPO_DIR/src/content/blog/$SLUG.md"
if [ -f "$DEST" ]; then
  echo "SKIP: $DEST ya existe"
  exit 0
fi

# Fecha en español
day=$(echo "$DATE" | cut -d- -f3 | sed 's/^0//')
mon=$(echo "$DATE" | cut -d- -f2)
year=$(echo "$DATE" | cut -d- -f1)
case $mon in
  01) mes="enero" ;;
  02) mes="febrero" ;;
  03) mes="marzo" ;;
  04) mes="abril" ;;
  05) mes="mayo" ;;
  06) mes="junio" ;;
  07) mes="julio" ;;
  08) mes="agosto" ;;
  09) mes="septiembre" ;;
  10) mes="octubre" ;;
  11) mes="noviembre" ;;
  12) mes="diciembre" ;;
  *) mes="$mon" ;;
esac
FECHA_ES="$day de $mes de $year"

# Título: primera línea H2 significativa tras el resumen o fallback genérico
H2="$(awk '/^## /{sub(/^## /,""); print; exit}' "$SRC")"
if [ -n "$H2" ]; then
  TITLE="Radar Tecnológico — $FECHA_ES: $H2"
else
  TITLE="Radar Tecnológico — $FECHA_ES"
fi
# Limitar longitud del título (SEO: ~65 chars visibles)
if [ ${#TITLE} -gt 100 ]; then TITLE="Radar Tecnológico — $FECHA_ES"; fi

# Cuerpo: quitar H1 original y todo lo que venga del footer interno
BODY="$(awk '
  /^# / && !visto_h1 { visto_h1=1; next }
  /^## cita-check/ { exit }
  /^📄 Reporte completo/ { exit }
  { print }
' "$SRC" | sed '/./,$!d' )"

cat > "$DEST" <<HDR
---
title: "$TITLE"
description: "Radar tecnológico diario de SabaTech: los movimientos que importan en lenguajes, IA, seguridad, infraestructura y frameworks, con fuentes verificadas. Edición del $FECHA_ES."
pubDate: "$DATE"
author: "Alfred"
tags: ["radar-tecnologico", "noticias", "ia", "seguridad", "lenguajes", "infraestructura"]
---
HDR
printf '%s\n' "$BODY" >> "$DEST"

echo "POST_WRITTEN: $DEST"

cd "$REPO_DIR"
git pull --rebase origin main >>/dev/null 2>&1 || true
git add "src/content/blog/$SLUG.md"
if git diff --cached --quiet; then
  echo "SKIP: sin cambios que commitear"
  exit 0
fi
git -c user.name="Alfred (SabaTech)" -c user.email="alfred@sabatech.dev" \
  commit -m "blog: radar tecnológico $DATE" >>/dev/null
git push origin main
echo "PUBLISHED: $SLUG → origin/main (Cloudflare Pages deployará automáticamente)"
