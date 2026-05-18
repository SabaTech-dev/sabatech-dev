## ADDED Requirements

### Requirement: Blog Content Collection
The system SHALL use Astro Content Collections with MDX support for blog posts stored in `src/content/blog/`.

#### Scenario: Blog post rendering
- **WHEN** a visitor navigates to /blog
- **THEN** the page lists all published blog posts with title, date, excerpt, author, and reading time

### Requirement: Blog Post Page
Each blog post SHALL have its own page at `/blog/<slug>` with full content, author info, and social sharing buttons.

#### Scenario: Individual post view
- **WHEN** a visitor clicks a blog post
- **THEN** the post page renders with: title, date, author (Joker or Alfred), estimated reading time, content, and share links

### Requirement: Initial Blog Post
The system SHALL include at least 1 published blog post: "Announcing SabaTech — Agentic QA Automation for the AI Era".

#### Scenario: Announcement post
- **WHEN** a visitor views the blog
- **THEN** the first post is the announcement with: mission, team introduction, service overview, and CTA to try QA Framework

### Requirement: Blog RSS Feed
The system SHALL provide an RSS feed at `/blog/rss.xml` for blog subscription.

#### Scenario: RSS feed access
- **WHEN** a RSS reader fetches /blog/rss.xml
- **THEN** a valid RSS 2.0 feed is returned with the latest 20 posts

### Requirement: Blog SEO
Each blog post SHALL have unique OpenGraph meta tags, Twitter card, canonical URL, and structured data (BlogPosting JSON-LD).

#### Scenario: Social sharing of blog post
- **WHEN** a visitor shares a blog post on social media
- **THEN** the preview card shows the post title, excerpt, featured image, and SabaTech branding
