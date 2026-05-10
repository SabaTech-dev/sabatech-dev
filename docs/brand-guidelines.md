# SabaTech Brand Guidelines

## Logo

### Primary Logo
**File:** `public/brand/logo.svg`
**Usage:** Landing page, website header, marketing materials

### Icon Only
**File:** `public/brand/logo-icon.svg`
**Usage:** App icons, social media avatars, small spaces

### Wordmark Only
**File:** `public/brand/logo-wordmark.svg`
**Usage:** When text is preferred, minimal contexts

### Favicon
**File:** `public/favicon.svg`
**Usage:** Browser tabs, bookmarks

### Logo Usage Rules
- **Minimum size:** 24px height for icon-only, 32px for full logo
- **Aspect ratio:** Always maintain original proportions
- **Color variations:**
  - Default: Black (#0a0a0a) + Red (#e63946)
  - White (on dark backgrounds): White (#ffffff) + Red (#e63946)
  - Grayscale: Black (#0a0a0a) + Dark Gray (#404040)
- **White space:** Maintain minimum 1x logo height around all sides
- **Do not:** Stretch, distort, rotate, or add effects
- **Do not:** Change colors (except approved variations above)
- **Do not:** Add additional elements or text

## Colors

### Primary Colors

| Name | Hex | RGB | Usage |
|------|-----|-----|-------|
| Primary Black | `#0a0a0a` | rgb(10, 10, 10) | Logo, headings, primary UI elements |
| Primary Red | `#e63946` | rgb(230, 57, 70) | Accents, CTAs, highlights |

### Secondary Colors

| Name | Hex | RGB | Usage |
|------|-----|-----|-------|
| Primary Red Hover | `#c62828` | rgb(198, 40, 40) | CTAs on hover, active states |
| Primary Red Light | `rgba(230, 57, 70, 0.1)` | — | Background accents, subtle highlights |
| White | `#ffffff` | rgb(255, 255, 255) | Text on dark backgrounds, backgrounds |

### Neutral Colors

| Name | Hex | Usage |
|------|-----|-------|
| Gray 900 | `#0a0a0a` | Primary black |
| Gray 800 | `#1a1a1a` | Dark backgrounds |
| Gray 700 | `#2a2a2a` | Borders, dividers |
| Gray 600 | `#404040` | Muted text |
| Gray 400 | `#808080` | Disabled states |
| Gray 200 | `#c0c0c0` | Light borders |
| Gray 50 | `#f5f5f5` | Light backgrounds |

## Typography

### Font Families

| Font Family | Usage |
|-------------|--------|
| **Inter** | Primary font for body text, UI elements, and headings |
| **Space Grotesk** | Display font for large headlines (optional, future use) |
| **DM Mono** | Monospace font for code and technical content (optional) |

### Font Loading
```html
<!-- Google Fonts - Inter -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
```

### Type Scale

| Usage | Font Size | Weight | Line Height |
|--------|------------|---------|-------------|
| Hero Heading | 48-72px (text-5xl to text-7xl) | Bold (700-800) | Tight (1.0-1.1) |
| Section Heading | 30-48px (text-3xl to text-5xl) | Bold (700) | Tight (1.1-1.2) |
| Subheading | 20-24px (text-xl to text-2xl) | Semibold (600) | Snug (1.25-1.3) |
| Body | 16-18px (text-base to text-lg) | Regular (400) | Normal (1.5-1.6) |
| Small | 14px (text-sm) | Regular (400) | Normal (1.5) |
| Caption | 12px (text-xs) | Medium (500) | Tight (1.25) |

### Typography Rules
- **Headings:** Use Bold (700) for primary, Semibold (600) for secondary
- **Body text:** Regular (400) with increased line height for readability
- **Captions:** Medium (500) to improve readability at small sizes
- **Color contrast:** Always maintain WCAG AA contrast ratios (4.5:1 for text)

## Spacing

Use the 4px scale (Tailwind default):
- `space-1`: 4px
- `space-2`: 8px
- `space-3`: 12px
- `space-4`: 16px
- `space-6`: 24px
- `space-8`: 32px
- `space-12`: 48px
- `space-16`: 64px

## Border Radius

| Size | Value | Usage |
|------|-------|-------|
| sm | 4px | Small buttons, badges |
| md | 6px | Cards, inputs |
| lg | 8px | Large buttons |
| xl | 12px | Featured cards |
| full | 9999px | Pills, full rounded |

## Component Styling

### Buttons
- **Primary:** Black background, white text, red accent on hover
- **Secondary:** Gray background, white text, darker gray on hover
- **Outline:** Transparent background, border, fill on hover
- **Ghost:** Transparent background, gray text, dark background on hover

### Cards
- **Default:** Dark gray border, black background
- **Elevated:** Shadow on hover
- **Featured:** Red border, enhanced shadow

## Voice & Tone

### Brand Voice
- **Professional:** Expert, knowledgeable, credible
- **Direct:** Clear, concise, actionable
- **Technical:** Precise, detailed, evidence-based
- **Security-focused:** Cautious, thorough, comprehensive

### Writing Guidelines
- Use active voice ("We audit your agents" vs "Your agents are audited")
- Be specific ("OWASP ASI compliance" vs "Security standards")
- Avoid jargon where possible, or explain it
- Include data and evidence when possible
- Keep it scannable with clear headings and lists

---

*Last Updated: 2026-05-08*
