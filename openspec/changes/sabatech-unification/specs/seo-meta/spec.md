## ADDED Requirements

### Requirement: OpenGraph Meta Tags
Every page SHALL include og:title, og:description, og:image, og:url, og:type, and og:site_name meta tags.

#### Scenario: Homepage OG tags
- **WHEN** a social media crawler reads the homepage
- **THEN** og:title is "SabaTech — Agentic QA Automation & Security for the AI Era", og:image shows branded preview, og:url is the canonical URL

### Requirement: Twitter Card Meta Tags
Every page SHALL include twitter:card, twitter:title, twitter:description, and twitter:image meta tags with "summary_large_image" card type.

#### Scenario: Twitter share
- **WHEN** a visitor shares any page on Twitter/X
- **THEN** a large summary card is displayed with page title, description, and branded image

### Requirement: Sitemap XML
The system SHALL generate a sitemap.xml at build time including all static pages and blog posts.

#### Scenario: Sitemap generation
- **WHEN** the site is built
- **THEN** sitemap.xml is generated with entries for all pages with correct lastmod dates and priority values

### Requirement: Robots.txt
The system SHALL provide a robots.txt that allows all crawlers and references the sitemap.

#### Scenario: Crawler access
- **WHEN** a search engine bot fetches /robots.txt
- **THEN** it receives Allow: / with a Sitemap reference to the full URL

### Requirement: Canonical URLs
Every page SHALL include a `<link rel="canonical">` tag pointing to its absolute URL on sabatech.dev.

#### Scenario: Canonical URL on service page
- **WHEN** a visitor views /qa-framework
- **THEN** the canonical link is "https://sabatech.dev/qa-framework"
