# Changelog

Todos los cambios notables de este proyecto se documentarán en este archivo.

El formato está basado en [Keep a Changelog](https://keepachangelog.com/es-ES/1.1.0/),
y este proyecto adhiere a [Semantic Versioning](https://semver.org/lang/es/spec/v2.0.0.html).

## [Unreleased] - 2026-06-14

### Accessibility (WCAG 2.2 AA)

- **aria-label** añadido a todos los links de redes sociales icon-only (GitHub, Twitter, LinkedIn, Email)
- **aria-hidden="true"** añadido a 114 SVGs decorativos en todas las páginas
- **role="img" + aria-label** añadido a 2 SVGs informativos (training loss chart, agent topology diagram)
- **Contraste corregido**: `text-slate-500` (#64748B, ~3.9:1) → `text-slate-400` (#94A3B8, ~7.5:1) en todo el sitio
- **Contraste corregido**: `text-slate-600` (#475569, ~2.6:1) → `text-slate-400` (#94A3B8, ~7.5:1) en footer y blog
- **Heading order**: footer `h4` → `h3` (Services, Company) para fix h2→h4 skip en 14 rutas
- **Heading order**: contact.astro `h3` → `h2` (Email, X/Twitter) para fix h1→h3 skip
- **Heading order**: orquestacion redirect page con `h1` sr-only
- **Skip-to-content link** para navegación por teclado/screen readers
- **focus-visible rings** en todos los links y botones del header y footer
- **underline hover** en links del footer (no dependen solo de color)
- **autocomplete** y **aria-required** en inputs del formulario de contacto
- **role=status aria-live=polite** para feedback del formulario
- **nav aria-label** y **footer role=contentinfo** para landmarks semánticos
- **theme-color** y **color-scheme** meta tags

### Performance

- **Font preload**: patrón non-blocking con `media="print" onload="this.media='all'"` + `<noscript>` fallback
- **Cache-Control headers**: creados `public/_headers` (Cloudflare Pages) y `vercel.json` (Vercel)
  - Assets con hash: `max-age=31536000, immutable` (1 año)
  - Imágenes: `max-age=2592000` (30 días)
  - CSS/JS: `max-age=604800` (7 días)
  - HTML: `max-age=300, must-revalidate` (5 min)
- **Security headers**: X-Content-Type-Options nosniff, X-Frame-Options DENY, Referrer-Policy, Permissions-Policy
- **CSP actualizada**: añadido `preload-src` para compatibilidad con font preloading

### Best Practices

- **ContactForm**: interceptado submit con fetch/AJAX (API espera JSON, no form-encoded)
- **ContactForm**: loading state, error handling, reset en éxito
- **CSP preload-src** añadido para permitir preload de recursos de fonts

## [0.0.1] - 2026-05-07

### Initial Release

- Sitio Astro + Tailwind CSS v4
- 14 páginas: home, about, security, qa-framework, saba-agent-os, pricing, team, blog, contact
- Páginas legales: privacy, terms, cookies
- i18n client-side (EN/ES)
- Portfolio page para Jose (/jose)
- Saba-LLM-Auto-Train benchmark page
- API endpoint para contacto (/api/contact)
