# SabaTech.dev - Sitio Oficial

Agencia de tecnología especializada en desarrollo de software, seguridad informática y orquestación de agentes de IA.

## 🚀 Stack Tecnológico

- **Framework:** [Astro](https://astro.build/) (Static Site Generator)
- **Hosting:** [Cloudflare Pages](https://pages.cloudflare.com/)
- **DNS:** Cloudflare
- **Versión:** 0.0.1 (MVP)

## 📂 Estructura del Sitio

```
/                   - Homepage
/about             - Sobre Nosotros
/security          - Servicios de Seguridad
/orquestacion      - Orquestación de Agentes IA
/qa-framework      - QA-FRAMEWORK (Plataforma SaaS)
/team              - Nuestro Equipo
/contact           - Contacto
/blog              - Blog de Tecnología
```

## 🎨 Branding

- **Color principal (fondo):** `#0F172A` (midnight blue)
- **Color acento:** `#06B6D4` (saba teal)
- **Color secundario:** `#84CC16` (AI lime)
- **Tipografía:** Inter (sans/display), JetBrains Mono (mono)
- **Nombre profesional:** SabaTech
- **Gaming/Personal:** Joker

## 🛠️ Comandos de Desarrollo

| Comando | Acción |
|---------|--------|
| `npm install` | Instala dependencias |
| `npm run dev` | Servidor local en `localhost:4321` |
| `npm run build` | Build para producción |
| `npm run preview` | Previsualizar build localmente |

## 📦 Deployment

### Automático
Cada push a la rama `main` en GitHub desencadena un deploy automático en Cloudflare Pages.

### Manual
Ver documentación en `CLOUDFLARE_PAGES_SETUP.md` para configuración inicial.

## 🔧 Configuración

### DNS Records (Cloudflare)
- **Nameservers:** `marjory.ns.cloudflare.com`, `ganz.ns.cloudflare.com`
- **SSL:** Full (Strict)
- **Proxy:** ☑️ Proxied (orange cloud icon)

### Build Settings (Cloudflare Pages)
- **Framework preset:** Astro
- **Build command:** `npm run build`
- **Build output directory:** `dist`

## 📄 Licencia

© 2026 SabaTech. Todos los derechos reservados.

---

**Mantenido por:** DevOps Agent
**Última actualización:** 2026-06-14

## ♿ Accesibilidad (WCAG AA)

El sitio cumple con WCAG 2.2 AA en todas las rutas:

- Contraste mínimo 4.5:1 en todo texto sobre fondos oscuros
- aria-label en todos los links/botones con solo iconos
- aria-hidden en todos los SVGs decorativos (114+ elementos)
- Orden de headings secuencial (h1→h2→h3, sin saltos)
- Skip-to-content link para navegación por teclado
- focus-visible en todos los elementos interactivos
- role="img" + aria-label en SVGs informativos (charts, diagramas)

## ⚡ Rendimiento

- Font preload con patrón non-blocking (media=print → swap)
- Cache-Control headers inmutables para assets con hash (1 año)
- Preconnect a Google Fonts (fonts.googleapis.com, fonts.gstatic.com)
- CSP con preload-src para recursos críticos

Ver `AUDIT-REPORT.md` para el reporte completo de Unlighthouse.
