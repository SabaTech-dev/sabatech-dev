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

- **Color principal (fondo):** `#0a0a0a` (negro)
- **Color acento:** `#e63946` (rojo)
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
**Última actualización:** 2026-05-07
