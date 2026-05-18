## Context

SabaTech's web presence is fragmented: an Astro site (`sabatech-dev`) with 3 service pages, a standalone Next.js landing (`saba-agentic-orchestration`), and rebranding docs. The Astro site already has the approved design system (tokens.css, Tailwind config with Midnight Blue/Saba Teal/AI Lime palette). We need to consolidate everything into one repo, enrich content, and deploy to sabatech.dev.

Current stack: Astro 5.x + Tailwind 4.x, deployed on Cloudflare Pages (DNS already configured per CLOUDFLARE_PAGES_SETUP.md).

## Goals / Non-Goals

**Goals:**
- Unified web at sabatech.dev with all services under one roof
- Professional, production-ready site with real content
- SEO-optimized with sitemap, OG tags, structured data
- Blog ready for content marketing
- OpenSpec-driven development with handoff to OpenCode for implementation

**Non-Goals:**
- Replacing the existing design system (already approved and in place)
- Building the actual QA Framework SaaS frontend (that lives on qa.sabatech.dev subdomain)
- Complex CMS integration (MDX files in repo are sufficient for now)
- Internationalization (English primary, Spanish CTA only)

## Decisions

### 1. Astro Content Collections for Blog
**Choice:** Astro built-in Content Collections with MDX
**Alternatives considered:** Astro + standalone blog CMS (Ghost, Notion), plain markdown files
**Rationale:** Content Collections provide type-safe frontmatter validation, automatic slug generation, and zero external dependencies. MDX enables interactive components in posts.

### 2. Logo as Inline SVG Components
**Choice:** Astro components wrapping the SVG with variant props (icon-only, horizontal, stacked)
**Alternatives considered:** SVG in public/ referenced via <img>, PNG exports
**Rationale:** Inline SVG allows CSS styling, theme adaptation (dark/light), and animation. No extra HTTP request. Component props handle responsive variants cleanly.

### 3. Pricing Page as Client-side Interactive
**Choice:** Astro page with a small vanilla JS <script> for calculator toggle (monthly/annual)
**Alternatives considered:** React/Preact island, full static (no calculator)
**Rationale:** The calculator is a simple toggle + multiplication — no framework needed. Astro's <script> handles this with zero JS bundle overhead for the rest of the page.

### 4. Deploy Target: Cloudflare Pages
**Choice:** Continue with Cloudflare Pages (already configured)
**Alternatives considered:** Vercel, Netlify, self-hosted Coolify
**Rationale:** DNS is already on Cloudflare. Pages provides automatic builds on push, global CDN, and zero cold starts. Free tier is sufficient. Vercel reserved for subdomain SaaS apps.

### 5. Subdomain Strategy
**Choice:** Each subdomain points to independent services:
- `sabatech.dev` → Cloudflare Pages (this site)
- `qa.sabatech.dev` → Coolify (QA Framework SaaS)
- `security.sabatech.dev` → Future security audit tooling
- `orchestration.sabatech.dev` → Future Mission Control demo
**Rationale:** Each product may have different tech stacks and scaling needs. Subdomains keep them independent while the main site serves as portfolio/hub.

## Risks / Trade-offs

- **[Logo quality]** → The auto-generated SVG is a starting point. May need professional designer iteration later. Mitigation: SVG is easy to swap.
- **[Content freshness]** → Static content can become stale. Mitigation: Blog + OpenSpec workflow enables continuous updates.
- **[Calculator complexity]** → Simple implementation may not handle edge cases (enterprise custom pricing). Mitigation: Enterprise tier uses "Contact Sales" — no calculator needed.
- **[Cloudflare Pages build]** → Astro SSR features may need @astrojs/cloudflare adapter. Mitigation: Use static output mode (default) — no SSR needed for this site.

## Migration Plan

1. All work happens on `main` branch of `sabatech-dev` repo
2. OpenSpec specs drive task creation
3. OpenCode agent implements tasks
4. After implementation: `npm run build` verifies no errors
5. Push to GitHub triggers Cloudflare Pages auto-deploy
6. Verify deploy on sabatech.dev
7. Archive `~/proyectos/saba-agentic-orchestration` repo (content already migrated)

## Open Questions

- Blog authoring workflow: MDX commits vs. future CMS integration? (Recommend: MDX for now, add CMS when blog scales)
- Logo iterations: Should we generate multiple logo variants via AI image tools? (Recommend: Ship current SVG, iterate based on feedback)
