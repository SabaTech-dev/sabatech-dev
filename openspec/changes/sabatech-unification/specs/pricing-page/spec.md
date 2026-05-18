## ADDED Requirements

### Requirement: QA Framework SaaS Pricing Tiers
The system SHALL display 4 pricing tiers for QA Framework: Free (€0), Starter (€29/dev/month), Pro (€59/dev/month), Enterprise (Custom).

#### Scenario: Free tier display
- **WHEN** a visitor views the pricing page
- **THEN** the Free tier card shows: 1 repo, 5 tests/month, basic SAST, CI gating, community support

#### Scenario: Starter tier display
- **WHEN** a visitor views the pricing page
- **THEN** the Starter tier card shows: 10 repos, unlimited tests, SAST + SCA, CI/CD integration, Slack alerts, €29/dev/month with annual discount option

#### Scenario: Pro tier highlighted
- **WHEN** a visitor views the pricing page
- **THEN** the Pro tier card is visually highlighted as "Most Popular" with: unlimited repos, secrets detection, custom rules, advanced reporting, AI triage, €59/dev/month

#### Scenario: Enterprise tier
- **WHEN** a visitor views the pricing page
- **THEN** the Enterprise tier card shows: DAST, on-prem option, SSO, dedicated support, SLA, "Contact Sales" CTA

### Requirement: Consulting Services Pricing
The system SHALL display consulting service cards with: Security Assessment (€500), Pilot 90 Days (€999), Managed Security (€497/dev/year).

#### Scenario: Consulting services section
- **WHEN** a visitor scrolls past the SaaS tiers
- **THEN** a "Professional Services" section displays 3 service cards with pricing, duration, and included features

### Requirement: Early Adopter Program Banner
The system SHALL display a banner promoting the Founding Partners program with 50% discount for first 10 clients.

#### Scenario: Early adopter banner
- **WHEN** a visitor views the pricing page
- **THEN** a prominent banner shows "Founding Partners Program — 50% off for the first 10 clients. Limited spots."

### Requirement: Pricing Calculator
The system SHALL include an interactive pricing calculator that computes monthly/annual cost based on team size and plan selection.

#### Scenario: Calculator interaction
- **WHEN** a visitor enters team size and selects a plan
- **THEN** the calculator displays monthly cost, annual cost (with 20% discount), and comparison with competitors

### Requirement: Annual Discount Toggle
The system SHALL allow toggling between monthly and annual billing, showing 20% savings for annual commitment.

#### Scenario: Toggle to annual
- **WHEN** a visitor toggles the billing period to annual
- **THEN** all prices update to show annual rates with savings highlighted
