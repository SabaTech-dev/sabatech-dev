## Why

SabaTech tiene 3 repos/web fragmentados (sabatech-dev en Astro, saba-agentic-orchestration en Next.js, y contenido del rebranding en docs) que necesitan unificarse en una sola web profesional bajo `sabatech.dev`. La identidad visual (paleta Midnight Blue + Saba Teal + AI Lime) y el tagline "Agentic QA Automation & Security for the AI Era" ya están aprobados. El logo SVG está listo. Es momento de consolidar, enriquecer contenido y deployar.

## What Changes

- **Logo y favicon**: Integrar logo SVG (`docs/rebranding-logo.svg`) como favicon, header logo, y footer logo
- **Tagline actualizado**: "Agentic QA Automation & Security for the AI Era" en toda la web
- **Pricing integrado**: Añadir página `/pricing` con tiers QA Framework SaaS (Free/Starter/Pro/Enterprise) + Servicios consulting
- **Contenido enriquecido en /orquestacion**: Migrar contenido del repo Next.js `saba-agentic-orchestration` (architecture demos, pricing tiers, stack section) a la página existente en Astro
- **Contenido real en /team**: Actualizar con información real del equipo híbrido (Joker + Alfred + 5 agentes)
- **Blog preparado**: Estructura de blog con al menos 1 post inicial (announcement o thought leadership)
- **Contact form funcional**: Verificar que FormSubmit funciona o integrar alternativa
- **SEO y meta tags**: OpenGraph, Twitter cards, sitemap, robots.txt
- **Deploy a sabatech.dev**: Configurar Cloudflare Pages o Vercel con dominio propio
- **Subdominios preparados**: Documentación para security.sabatech.dev, orchestration.sabatech.dev, qa.sabatech.dev (apuntan a demos/SaaS)

## Capabilities

### New Capabilities
- `logo-integration`: Logo SVG en header, footer, favicon con variantes (icon-only, horizontal, stacked)
- `pricing-page`: Página de pricing con QA Framework tiers + consulting services + early-adopter program
- `enriched-orquestacion`: Contenido migrado de saba-agentic-orchestration con architecture demos, stack info, y pricing
- `blog-structure`: Sistema de blog con MDX o Astro content collections, al menos 1 post
- `seo-meta`: OpenGraph, Twitter cards, canonical URLs, sitemap.xml, robots.txt
- `deploy-config`: Configuración de deploy para sabatech.dev con subdominios

### Modified Capabilities

## Impact

- **Repo**: `SabaTech-dev/sabatech-dev` (Astro + Tailwind)
- **Repo a archivar**: `~/proyectos/saba-agentic-orchestration` (Next.js) → contenido migrado, repo eliminado
- **Dependencies**: Astro 5.x, Tailwind 4.x, @astrojs/sitemap, potentially @astrojs/mdx
- **DNS**: Cloudflare (ya configurado según CLOUDFLARE_PAGES_SETUP.md)
- **Deploy target**: Cloudflare Pages o Vercel
- **External services**: FormSubmit (contact form), Stripe (QA Framework billing), Vercel/Cloudflare (hosting)
