# DNS Records para Cloudflare Pages - Sabatech.dev

## DNS Records Requeridos por Cloudflare Pages

Cuando conectes el dominio `sabatech.dev` a Cloudflare Pages, se crearán automáticamente los siguientes records.

### Records Automáticos (creados por Cloudflare Pages)

#### Para el dominio principal `sabatech.dev`

```
Type: CNAME
Name: sabatech.dev (o @ en la UI de Cloudflare)
Target: <tu-proyecto-pages>.pages.dev
Proxy: ☑️ Proxied (orange cloud icon - REQUIRED)
TTL: Auto (default)
```

**Notas:**
- El `<tu-proyecto-pages>.pages.dev` se crea automáticamente cuando se configura el proyecto en Cloudflare Pages
- Debe estar "Proxied" (orange cloud) para que Cloudflare SSL funcione
- No agregar ningún CNAME para `www` de momento (no necesario)

### Records Adicionales (Opcional - para el futuro)

#### Si necesitas `www.sabatech.dev`

```
Type: CNAME
Name: www
Target: sabatech.dev
Proxy: ☑️ Proxied (orange cloud icon)
TTL: Auto
```

#### Subdominios personalizados (ej: `app.sabatech.dev` para aplicaciones)

```
Type: CNAME
Name: <subdominio>
Target: <tu-proyecto-pages>.pages.dev
Proxy: ☑️ Proxied (orange cloud icon)
TTL: Auto
```

## Current DNS Records (Antes de Cloudflare Pages)

### Records actuales identificados

```
Type: A
Name: sabatech.dev
Content: 64.29.17.1, 216.198.79.1
Proxy: ☑️ Proxied (orange cloud icon)
```

**Estos records se pueden eliminar después de configurar Cloudflare Pages.**

## Migration Steps (When Setting Up Cloudflare Pages)

1. **No borrar los A records actuales** hasta verificar que Cloudflare Pages funciona
2. **Configurar Cloudflare Pages** siguiendo `CLOUDFLARE_PAGES_SETUP.md`
3. **Cloudflare creará automáticamente el CNAME** para `sabatech.dev`
4. **Verificar que sabatech.dev funciona** con el nuevo setup
5. **Solo entonces borrar los A records antiguos** (64.29.17.1, 216.198.79.1)

## Rollback Plan

Si Cloudflare Pages no funciona:

1. **Eliminar el CNAME de Cloudflare Pages** (sabatech.dev → <project>.pages.dev)
2. **Restaurar los A records originales:**
   ```
   Type: A
   Name: sabatech.dev
   Content: 64.29.17.1, 216.198.79.1
   Proxy: ☑️ Proxied (orange cloud icon)
   ```
3. **Desactivar el proyecto en Cloudflare Pages** (si es necesario)

## Propagation Time

- DNS changes: típicamente 5-10 minutos (máximo 24 horas en casos raros)
- SSL certificate: Cloudflare generará automáticamente un certificado, toma 5-15 minutos
- Full propagation: verificar después de 15 minutos

## Verification Commands

### Verificar DNS resolution (desde localhost)

```bash
# Verificar que apunta a Cloudflare
dig +short sabatech.dev CNAME
# Debería devolver: <project>.pages.dev

# Verificar A record
dig +short sabatech.dev A
# Debería devolver IPs de Cloudflare (comienzan con 172.6x.x.x o similar)

# Verificar HTTP status
curl -I https://sabatech.dev
# Debería devolver 200 OK + headers de Cloudflare
```

### Verificar SSL

```bash
# Verificar certificado SSL
openssl s_client -connect sabatech.dev:443 -servername sabatech.dev </dev/null 2>/dev/null | openssl x509 -noout -dates
```

---

**Documento actualizado:** 2026-05-07
**Maintained by:** DevOps Agent
