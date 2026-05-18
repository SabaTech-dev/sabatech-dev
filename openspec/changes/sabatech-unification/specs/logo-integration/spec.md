## ADDED Requirements

### Requirement: Logo SVG in Header
The system SHALL display the SabaTech logo SVG in the site header on all pages, consisting of the "S" shield icon followed by "SabaTech" wordmark with teal gradient on "Tech".

#### Scenario: Header logo on desktop
- **WHEN** a visitor views any page on desktop viewport
- **THEN** the header displays the full horizontal logo (icon + wordmark) linking to the homepage

#### Scenario: Header logo on mobile
- **WHEN** a visitor views any page on mobile viewport (< 768px)
- **THEN** the header displays the icon-only version of the logo (shield "S") linking to the homepage

### Requirement: Favicon and App Icons
The system SHALL provide favicon.ico, apple-touch-icon, and SVG favicon using the SabaTech shield icon.

#### Scenario: Browser tab icon
- **WHEN** a visitor opens any page on the site
- **THEN** the browser tab displays the SabaTech shield icon as favicon

### Requirement: Footer Logo
The system SHALL display the stacked variant of the logo (icon above wordmark) in the site footer.

#### Scenario: Footer logo display
- **WHEN** a visitor scrolls to the footer on any page
- **THEN** the footer shows the stacked logo variant with the tagline "Agentic QA Automation & Security for the AI Era" below

### Requirement: Open Graph Logo
The system SHALL include the full horizontal logo as the default Open Graph image for social sharing.

#### Scenario: Social media share
- **WHEN** a visitor shares any page on social media
- **THEN** the preview card shows the SabaTech logo with branded background
