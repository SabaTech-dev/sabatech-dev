# Deployment Guide — sabatech.dev

## Overview

SabaTech website is a static site built with **Astro 6.x** + **Tailwind CSS 4.x**, deployed on **Cloudflare Pages**.

- **Repository**: `SabaTech-dev/sabatech-dev`
- **Production URL**: [sabatech.dev](https://sabatech.dev)
- **Build command**: `npm run build`
- **Output directory**: `dist/`
- **Node version**: >= 22.12.0

## Cloudflare Pages Setup

### Initial Configuration

1. Connect GitHub repo `SabaTech-dev/sabatech-dev` to Cloudflare Pages
2. Set build configuration:
   - **Framework preset**: None
   - **Build command**: `npm run build`
   - **Build output directory**: `dist`
   - **Node.js version**: `22`
3. Environment variables: None required (static site)

### Automatic Deployments

- Push to `main` → automatic production deploy
- Preview deployments for all PRs

## DNS Configuration

### Main Domain

| Record  | Type  | Value                        |
|---------|-------|------------------------------|
| `@`     | CNAME | `sabatech-dev.pages.dev`     |
| `www`   | CNAME | `sabatech-dev.pages.dev`     |

### Subdomain Routing

Each subdomain points to an independent service:

| Subdomain                    | Target         | Service               |
|------------------------------|----------------|-----------------------|
| `sabatech.dev`               | Cloudflare Pages | Marketing site (this repo) |
| `qa.sabatech.dev`            | Coolify        | QA Framework SaaS     |
| `security.sabatech.dev`      | Future         | Security audit tooling |
| `orchestration.sabatech.dev` | Future         | Mission Control demo  |

#### Subdomain DNS Records

```
qa.sabatech.dev           CNAME   <coolify-instance-ip>
security.sabatech.dev     CNAME   <tbd>
orchestration.sabatech.dev CNAME  <tbd>
```

## HTTPS Configuration

- Cloudflare provides automatic SSL/TLS certificates
- Force HTTPS redirect is enabled in Cloudflare dashboard
- SSL mode: Full (Strict)

## Build Verification

Run locally before pushing:

```bash
npm run build
```

Expected output:
- `13+ page(s) built`
- No errors
- `dist/` directory contains static HTML

## Rollback Procedure

1. Go to Cloudflare Pages dashboard → Deployments
2. Find the last known good deployment
3. Click "Rollback to this deployment"
4. Alternatively: `git revert <commit>` and push to main

## Performance Targets

- Lighthouse Performance: > 90
- Lighthouse Accessibility: > 95
- Lighthouse Best Practices: > 95
- Lighthouse SEO: > 95

## Troubleshooting

### Build Fails

- Check Node version (must be >= 22.12.0)
- Run `npm run build` locally to reproduce
- Check for import path errors

### Pages Not Updating

- Verify build completed in Cloudflare dashboard
- Check for CDN cache (purge if needed)
- Verify correct branch is deployed

### Fonts Not Loading

- Google Fonts are loaded via `<link>` tags
- CSP allows `fonts.googleapis.com` and `fonts.gstatic.com`
- If blocked, fonts fall back to system-ui
