## ADDED Requirements

### Requirement: Production Domain
The site SHALL be accessible at `sabatech.dev` with HTTPS enforced.

#### Scenario: HTTPS redirect
- **WHEN** a visitor accesses http://sabatech.dev
- **THEN** the request is redirected to https://sabatech.dev with 301 status

### Requirement: Cloudflare Pages Deployment
The site SHALL be deployed via Cloudflare Pages connected to the `SabaTech-dev/sabatech-dev` GitHub repository.

#### Scenario: Automatic deployment on push
- **WHEN** a commit is pushed to the main branch of sabatech-dev
- **THEN** Cloudflare Pages automatically builds and deploys the site within 3 minutes

### Requirement: Subdomain Documentation
The deploy config SHALL include documentation for subdomain routing: security.sabatech.dev, orchestration.sabatech.dev, qa.sabatech.dev pointing to respective demos/SaaS.

#### Scenario: Subdomain routing docs
- **WHEN** a developer reads DEPLOY.md
- **THEN** the file documents how to configure CNAME records for subdomains pointing to the appropriate services (Coolify, Vercel, or Cloudflare Pages routes)

### Requirement: Build Optimization
The site build SHALL produce optimized output with minified CSS, lazy-loaded images, and preloaded critical assets. Lighthouse score SHALL be >90 for Performance.

#### Scenario: Lighthouse audit
- **WHEN** a Lighthouse audit runs on sabatech.dev
- **THEN** Performance score is >90, Accessibility >95, Best Practices >95, SEO >95
