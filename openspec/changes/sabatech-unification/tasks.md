## 1. Logo & Favicon

- [x] 1.1 Copy rebranding-logo.svg to `src/components/Logo.astro` as an Astro component with variant prop (icon-only, horizontal, stacked)
- [x] 1.2 Generate favicon.ico and apple-touch-icon.png from the shield "S" icon
- [x] 1.3 Add favicon links and SVG favicon to Layout.astro <head>
- [x] 1.4 Replace header text logo with Logo component (horizontal variant, icon-only on mobile)
- [x] 1.5 Add Logo component (stacked variant) to footer with tagline

## 2. Pricing Page

- [x] 2.1 Create `src/pages/pricing/index.astro` with 4 QA Framework tiers (Free/Starter/Pro/Enterprise)
- [x] 2.2 Add consulting services section with 3 cards (Security Assessment, Pilot 90 Days, Managed Security)
- [x] 2.3 Add Founding Partners early-adopter banner with 50% off messaging
- [x] 2.4 Implement monthly/annual toggle with vanilla JS <script> for 20% discount calculation
- [x] 2.5 Add interactive pricing calculator (team size input → cost output)
- [x] 2.6 Add navigation link to /pricing in header and footer

## 3. Enriched Orquestacion Page

- [x] 3.1 Add architecture visualization section (SVG diagram of 6 agents with connections)
- [x] 3.2 Add technology stack section with: OpenClaw, OpenProse, Hindsight, Mission Control, Engram
- [x] 3.3 Add animated metrics section: "6 Agents Active", "24/7 Operation", "99.9% Uptime", "<30s Response"
- [x] 3.4 Migrate pricing tiers from saba-agentic-orchestration: Setup Básico, Configuración Avanzada, Managed Service
- [x] 3.5 Add case studies section with "Coming Soon" placeholder cards
- [x] 3.6 Add "Process" section: how engagement works (Discovery → Setup → Operation → Continuous Improvement)

## 4. Team & About Content

- [x] 4.1 Update /team with real agent descriptions: Alfred (CEO Agent), Coder, Security, Research, DevOps, QA-Tester
- [x] 4.2 Add agent avatar SVGs or emoji-based icons for each specialist
- [x] 4.3 Update /about with real founder bio, mission, values from rebranding doc
- [x] 4.4 Add "How the Hybrid Team Works" section with workflow diagram

## 5. Blog Structure

- [x] 5.1 Install @astrojs/mdx and configure content collections in `src/content/config.ts`
- [x] 5.2 Create `src/content/blog/` directory with announcement post: "Announcing SabaTech"
- [x] 5.3 Update `src/pages/blog.astro` to list posts from content collection with date, excerpt, reading time
- [x] 5.4 Create `src/pages/blog/[slug].astro` for individual post pages with full content and share buttons
- [x] 5.5 Add RSS feed endpoint at `src/pages/blog/rss.xml.ts`
- [x] 5.6 Write initial blog post content (mission, team, services, CTA)

## 6. SEO & Meta

- [x] 6.1 Install @astrojs/sitemap and add to astro.config.mjs
- [x] 6.2 Add canonical URL <link> to Layout.astro from site URL config
- [x] 6.3 Add OG image generation or static OG image for each page type (home, service, blog, pricing)
- [x] 6.4 Add JSON-LD structured data: Organization on homepage, BlogPosting on blog posts
- [x] 6.5 Create public/robots.txt with Allow and Sitemap reference
- [x] 6.6 Update all page title and description meta tags to use approved tagline

## 7. Deploy Configuration

- [x] 7.1 Add build command and output directory to astro.config.mjs for Cloudflare Pages compatibility
- [x] 7.2 Create DEPLOY.md documenting Cloudflare Pages setup, subdomain DNS, and rollback procedure
- [x] 7.3 Verify `npm run build` succeeds with no errors
- [x] 7.4 Commit and push all changes to GitHub `SabaTech-dev/sabatech-dev` (8fb038e, main)
- [~] 7.5 ~~Verify auto-deploy on Cloudflare Pages completes~~ — **OBSOLETE: migrated from CF Pages to self-hosted (nginx + Cloudflare Tunnel)**
- [x] 7.6 Verify sabatech.dev loads with HTTPS and all pages work
- [~] 7.7 Run Lighthouse audit (desktop: P97, A88, BP100, S92 — accessibility 88 needs contrast/heading fixes)

## 8. Cleanup

- [x] 8.1 Archive `~/proyectos/saba-agentic-orchestration` repo (move to archive folder or delete)
- [x] 8.2 Remove any hardcoded placeholder content replaced by real content
- [x] 8.3 Verify all internal links work (header nav, footer links, CTAs)
- [x] 8.4 Update Kanban task — deployed at https://sabatech.dev (self-hosted, nginx + Cloudflare Tunnel)
