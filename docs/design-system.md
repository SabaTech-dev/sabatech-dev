# SabaTech Design System

## Componentes Base

### Hero
**Path:** `src/components/Hero.astro`
**Props:**
- `badge?: string` — Badge opcional
- `headline: string` — Título principal (obligatorio)
- `subheadline?: string` — Subtítulo opcional
- `ctaText: string` — Texto del botón principal (obligatorio)
- `ctaHref: string` — Enlace del botón principal (obligatorio)
- `secondaryCtaText?: string` — Texto del botón secundario
- `secondaryCtaHref?: string` — Enlace del botón secundario
- `variant?: "default" | "gradient" | "dark"` — Variante visual

**Usage:**
```astro
<Hero
  badge="AI Security"
  headline="SabaTech"
  subheadline="Consultoría QA & Security para Agentes IA"
  ctaText="Contactar"
  ctaHref="/contact"
  variant="gradient"
/>
```

### PricingCard
**Path:** `src/components/PricingCard.astro`
**Props:**
- `title: string` — Título del plan
- `price: string` — Precio (ej: "€5,000")
- `period?: string` — Período (ej: "/mes", "/one-time")
- `description: string` — Descripción del plan
- `features: string[]` — Lista de features
- `ctaText: string` — Texto del botón
- `ctaHref: string` — Enlace del botón
- `variant?: "default" | "featured" | "secondary"` — Variante visual

**Usage:**
```astro
<PricingCard
  title="Quick Assessment"
  price="€5,000"
  period="/one-time"
  description="Auditoría rápida de seguridad para agentes IA"
  features={["OWASP ASI", "EU AI Act", "2-3 semanas"]}
  ctaText="Empezar"
  ctaHref="/contact"
  variant="default"
/>
```

### ContactForm
**Path:** `src/components/ContactForm.astro`
**Props:**
- `action?: string` — URL del endpoint (default: "/api/contact")
- `method?: "POST" | "GET"` — Método del formulario (default: "POST")

**Usage:**
```astro
<ContactForm action="/api/contact" method="POST" />
```

## Componentes Existentes

### Badge
**Path:** `src/components/Badge.astro`
**Props:**
- `variant?: "primary" | "secondary" | "outline" | "ghost"`
- `class?: string`

### Button
**Path:** `src/components/Button.astro`
**Props:**
- `variant?: "primary" | "secondary" | "outline" | "ghost"`
- `size?: "sm" | "md" | "lg" | "xl"`
- `href?: string`
- `type?: "button" | "submit" | "reset"`
- `disabled?: boolean`
- `class?: string`

### Card
**Path:** `src/components/Card.astro`
**Props:**
- `variant?: "default" | "elevated" | "flat"`
- `hover?: boolean`
- `class?: string`

### Section
**Path:** `src/components/Section.astro`
**Props:**
- `variant?: "default" | "light" | "dark" | "gradient"`
- `padding?: "none" | "sm" | "md" | "lg" | "xl"`
- `class?: string`
- `id?: string`

### Container
**Path:** `src/components/Container.astro`
Wrapper para contenido con max-width y padding.

## Tokens CSS

**Path:** `src/styles/tokens.css`

### Colors
- `--color-primary-black: #0a0a0a`
- `--color-primary-red: #e63946`
- `--color-primary-red-hover: #c62828`
- `--color-primary-red-light: rgba(230, 57, 70, 0.1)`
- `--color-white: #ffffff`

### Typography
- `--font-sans: 'Inter', system-ui, sans-serif`
- `--font-display: 'Space Grotesk', system-ui, sans-serif`
- `--font-mono: 'DM Mono', monospace`

### Spacing
- Base: 4px scale
- `--space-1` (4px) to `--space-32` (128px)

### Border Radius
- `--radius-sm` (4px) to `--radius-full` (9999px)

## Tailwind Integration

**Path:** `tailwind.config.mjs`

Las CSS variables están integradas en Tailwind como:
- `colors.primary.black` → `var(--color-primary-black)`
- `colors.primary.red` → `var(--color-primary-red)`
- `colors.primary.red-hover` → `var(--color-primary-red-hover)`
- `colors.primary.red-light` → `var(--color-primary-red-light)`
- `font-family.sans` → `Inter`
- `font-family.display` → `Space Grotesk`
- `font-family.mono` → `DM Mono`

**Usage in Tailwind:**
```astro
<div class="bg-primary-black text-primary-red font-sans">
  Contenido con branding aplicado
</div>
```

## Logo Assets

**Path:** `public/brand/`

- `logo.svg` — Logo completo (icono + wordmark)
- `logo-icon.svg` — Solo icono
- `logo-wordmark.svg` — Solo texto
- `favicon.svg` — Favicon versión compacta

**Usage:**
```astro
<img src="/brand/logo.svg" alt="SabaTech" class="h-10" />
<img src="/brand/logo-icon.svg" alt="SabaTech" class="h-8" />
```

## Responsive Breakpoints

| Breakpoint | Size | Usage |
|------------|-------|-------|
| `sm` | 640px | Small mobile |
| `md` | 768px | Tablet |
| `lg` | 1024px | Desktop |
| `xl` | 1280px | Large desktop |
| `2xl` | 1536px | Extra large |

## Best Practices

### 1. Use Component Props Always
```astro
<!-- ✅ GOOD -->
<Button variant="primary" size="lg" href="/contact">
  Contactar
</Button>

<!-- ❌ BAD -->
<a href="/contact" class="px-5 py-2.5 bg-primary-red text-white">
  Contactar
</a>
```

### 2. Semantic HTML
```astro
<!-- ✅ GOOD -->
<section class="py-16">
  <h2>Nuestros Servicios</h2>
</section>

<!-- ❌ BAD -->
<div class="py-16">
  <div class="text-2xl">Nuestros Servicios</div>
</div>
```

### 3. Accessibility
```astro
<!-- ✅ GOOD -->
<button
  type="submit"
  disabled={isSubmitting}
  aria-disabled={isSubmitting}
  class="..."
>
  {isSubmitting ? "Enviando..." : "Enviar"}
</button>

<!-- ❌ BAD -->
<div onclick="submitForm()" class="...">
  Enviar
</div>
```

### 4. Color Contrast
Always use WCAG AA compliant colors:
- Black text on white background: 21:1 (PASS)
- White text on black background: 21:1 (PASS)
- Red text on black background: 4.5:1 (PASS AA)

---

*Last Updated: 2026-05-08*
