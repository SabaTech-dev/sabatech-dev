## ADDED Requirements

### Requirement: Architecture Visualization
The /orquestacion page SHALL display an interactive or static visualization of the multi-agent architecture showing Alfred (CEO) → 5 specialists (coder, security, research, devops, qa-tester) with connections.

#### Scenario: Architecture diagram display
- **WHEN** a visitor navigates to /orquestacion
- **THEN** the page shows a diagram with agent nodes, role labels, and connection lines representing the orchestration topology

### Requirement: Technology Stack Section
The /orquestacion page SHALL list the actual technology stack used: OpenClaw, OpenProse, Hindsight, Mission Control, Engram with brief descriptions and links.

#### Scenario: Stack display
- **WHEN** a visitor views the stack section
- **THEN** each technology is shown with: name, 1-line description, icon, and link to documentation

### Requirement: Live Metrics Dashboard
The /orquestacion page SHALL display real or representative metrics: agents active, tasks completed, uptime, response time.

#### Scenario: Metrics display
- **WHEN** a visitor views the metrics section
- **THEN** the page shows animated counters with: "6 Agents Active", "24/7 Operation", "99.9% Uptime", "<30s Response"

### Requirement: Service Pricing Integration
The /orquestacion page SHALL show orchestration-specific pricing tiers: Setup Básico, Configuración Avanzada, Managed Service — aligned with the approved pricing from the rebranding analysis.

#### Scenario: Pricing tiers display
- **WHEN** a visitor views the pricing section on /orquestacion
- **THEN** 3 service tiers are displayed with: name, price, features list, and CTA button

### Requirement: Case Study Placeholder
The /orquestacion page SHALL include a "Case Studies" section with placeholder cards for future client stories.

#### Scenario: Case studies section
- **WHEN** a visitor views the case studies section
- **THEN** 2-3 placeholder cards show with "Coming Soon" badge, industry label, and description template
