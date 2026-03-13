# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Brochure website for 1889 Coffee House, a family-owned veteran-run coffee shop at 1800 Prospect Ave, Helena, MT 59601. Named for Montana's statehood date (November 8, 1889).

The site is not yet built. The `docs/` directory contains the source-of-truth materials:
- `docs/1889-brand-guide.md` — colors, typography, voice/tone, layout principles, business details
- `docs/1889-landing-copy.md` — approved landing page copy (7 sections + footer)
- `docs/hugo-site-converter.md` — full architecture spec and phased build process

## Target Architecture

```
Internet → Outer Caddy (HTTPS/TLS on host) → Docker Container (HTTP)
                                                ├── Inner Caddy (static files + /api/* reverse proxy)
                                                └── Go API (contact form on localhost:8080)
```

Single Docker container bundles: Hugo static output + Go binary (contact form) + Caddy web server.

### Project Structure (when built)

```
hugo.toml                    # All business data lives here as [params]
assets/css/main.css          # Single CSS file, no frameworks, CSS custom properties
content/                     # Minimal front matter; structure lives in layouts
data/                        # YAML files for repeating data (services, team, etc.)
layouts/                     # Hugo templates (baseof, partials, section layouts)
static/images/               # Site images
api/main.go                  # Go API, stdlib only, zero external deps
Caddyfile                    # Inner Caddy config
Dockerfile                   # Three-stage: hugo build → go build → caddy runtime
docker-compose.yml
docker-entrypoint.sh
.github/workflows/deploy.yml
```

## Development Commands

```bash
# Hugo dev server
hugo server -D

# Go API (from api/ directory)
cd api && go run main.go

# Docker build and run
docker compose up --build

# Hugo build for production
hugo --gc --minify
```

Environment variables for the Go API: `API_PORT` (default 8080), `ALLOWED_ORIGIN` (default http://localhost:1313), `TURNSTILE_SECRET` (optional for local dev), `POSTMARK_TOKEN`, `FROM_EMAIL`, `TO_EMAIL`.

## Brand & Design Conventions

### Colors (from existing Wix theme)

| Role | Hex | Usage |
|---|---|---|
| Espresso | `#2d1910` | Headlines, one dark bg section only |
| Dark roast | `#512c1d` | Subheadings, body text on light bg |
| Medium roast | `#7d6055` | Buttons, links, eyebrows on white |
| Cream | `#d3bbb2` | Dividers, card borders, subtle bg |
| Pale gold | `#f9e3bb` | Secondary section backgrounds |
| Honey | `#edaf3b` | Eyebrows on dark bg, highlights |
| Montana sky | `#0088cb` | ONE use only — origin/statehood eyebrow |
| White | `#ffffff` | Dominant background |

Background hierarchy: white (most sections) → pale gold (section breaks) → cream (dividers) → espresso (one section only).

### Typography

- **Eyebrow:** Sacramento (cursive, ~28-32px) — one lowercase word + period per section
- **Headlines:** Clarendon W01 Medium (slab serif)
- **Body:** Enriqueta (serif, 17-18px, line-height 1.7)
- **UI labels:** DIN Next W01 Light (sans-serif, 10-13px)
- **Buttons/tags:** Avenir LT W01 85 Heavy (sans-serif, 13px, all-caps)

### Eyebrow system

Every section opens with a Sacramento cursive word, then a Clarendon headline. Eyebrow color varies by background: medium roast on white, dark roast on pale gold, honey on espresso, Montana sky on origin section (once only).

### Voice

Warm, unhurried, community-first. Specific over generic ("eggs cracked in-house" not "fresh ingredients"). Avoid chain coffee language ("handcrafted," "artisanal," "premium experience").

## Key Architectural Principles

1. **Config over code** — All business data in `hugo.toml` `[params]` and `data/*.yaml`, never hardcoded in templates
2. **Single CSS file** — CSS custom properties for theming, Hugo Pipes for minification, no frameworks
3. **Accessibility first** — Skip links, ARIA attributes, focus-visible outlines, prefers-reduced-motion, semantic HTML
4. **Zero JS dependencies** — Vanilla JavaScript only, inline in templates
5. **Go API has no external deps** — stdlib only
6. **Security** — Honeypot + Cloudflare Turnstile on forms, CORS validation
7. **Privacy-respecting analytics** — Plausible, not Google Analytics

## Build Process

Follow the phased process in `docs/hugo-site-converter.md`. Complete Phase 1 (analysis/audit) before writing any code. Present findings for review before proceeding.
