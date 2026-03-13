---
name: light-airy-cafe
description: >
  Design and build light, airy website layouts for cafes, coffee roasters, salons,
  bakeries, and similar hospitality/lifestyle brands. Use this skill when the client
  is a food/beverage/lifestyle small business and wants a clean, warm, approachable
  web presence. Derived from analysis of Crêpeaffaire, Starbucks, Montana Coffee
  Traders, and City Brew Coffee.
---

# Light & Airy Cafe / Lifestyle Brand UI Skill

This skill encodes the visual language, layout patterns, copy conventions, and
component library used by well-executed cafe, coffee roaster, salon, and lifestyle
brand websites. It is intentionally **prescriptive** — these clients benefit from
a proven aesthetic rather than experimentation.

The defining quality of this style: **restraint everywhere except the photography**.
Everything else — layout, type, color, decoration — steps aside so food, drink,
and people can be the visual stars.

---

## Core Aesthetic Principles

**1. White space is the grid.**
Sections breathe. Items are not cramped together. Padding is generous. When in
doubt, add more vertical space, not less.

**2. Photography (or illustration) carries all color.**
The UI chrome — nav, backgrounds, footers, type — is neutral. Cream, white,
off-white, warm light gray. Brand color enters the UI only as subtle accents
(logo, one CTA button color, icon tints). Never use brand color as a background
for full sections.

**3. No decorative chrome.**
No drop shadows as decoration. No card borders for their own sake. No gradients
as backgrounds. No geometric shapes, patterns, or textures used ornamentally.
If you are reaching for a decorative element, stop and ask: does a better photo
or more whitespace solve this instead?

**4. One idea per section. One action per section.**
Every section of a page communicates exactly one thing and offers exactly one
link or button. Never two competing CTAs in the same visual block.

**5. Warm, brief, human copy.**
Headlines are conversational, not ad-speak. Body copy is short — 1–2 sentences
maximum per section. Ingredient lists and product details are terse. Voice can
range from earnest-and-earthy (MCT) to warm-and-polished (Starbucks) to
playful-and-punny (City Brew) — but always approachable, never corporate.

**6. Mobile-first, single-column at heart.**
Even on desktop, the core reading experience is a single vertical column. Grids
and 2-up layouts are used selectively for product carousels and image-link pairs,
never for primary content.

---

## Typography

**Display / Headlines:**
Pair a characterful serif or soft humanist sans for headlines with a clean,
readable body face. Good pairings for this aesthetic:
- `Playfair Display` + `Lato` — classic cafe warmth
- `Cormorant Garamond` + `Source Sans 3` — refined, editorial
- `DM Serif Display` + `DM Sans` — modern, slightly upscale
- `Libre Baskerville` + `Nunito` — approachable, neighborhood feel

Avoid: Inter, Roboto, Arial, and system fonts. They signal tech, not hospitality.

**Type Scale (Tailwind reference):**
```
Display headline:   text-4xl md:text-5xl lg:text-6xl  font-display font-normal
Section headline:   text-2xl md:text-3xl               font-display font-normal
Item/card title:    text-lg md:text-xl                 font-display or font-sans
Body copy:          text-base                          font-sans font-normal
Microcopy/notes:    text-sm                            font-sans text-neutral-500
Tasting notes:      text-sm tracking-wide uppercase    font-sans text-neutral-400
```

**Letter spacing:** Headlines benefit from slight negative tracking (`tracking-tight`).
Tasting notes, category labels, and nav items often benefit from slight positive
tracking (`tracking-wide`) in small caps or uppercase.

---

## Color System

Build palettes with a neutral base and one warm accent:

```css
/* Example: warm cream base */
--color-bg:        #FAFAF8;   /* near-white, slightly warm */
--color-surface:   #F5F3EE;   /* cards, alt sections */
--color-border:    #E8E4DC;   /* subtle dividers */
--color-text:      #1C1917;   /* stone-950 equivalent */
--color-muted:     #78716C;   /* stone-500 equivalent */
--color-accent:    #C2410C;   /* brand — one color only, used sparingly */
--color-accent-lt: #FFF7ED;   /* tinted background for accent callouts */
```

**Tailwind config shorthand** (stone palette is your friend):
- Background: `bg-stone-50` or `bg-white`
- Alt sections: `bg-stone-100`
- Text: `text-stone-900`
- Muted text: `text-stone-500`
- Borders: `border-stone-200`
- Accent: one custom color from the brand guide

**Never use:** Cool grays (slate, zinc) for backgrounds. They read as tech/SaaS.
Stone and warm neutrals only.

---

## Layout Patterns

### Page Structure (Homepage / Landing)

```
┌─────────────────────────────┐
│  [Announcement bar]         │  optional — promo or shipping offer
├─────────────────────────────┤
│  [Nav]                      │  minimal, logo center or left
├─────────────────────────────┤
│  [Full-bleed hero]          │  image + headline + single CTA
├─────────────────────────────┤
│  [Feature section]          │  image left/right + headline + body + CTA
├─────────────────────────────┤
│  [Product carousel/grid]    │  optional for e-commerce
├─────────────────────────────┤
│  [2-up image links]         │  two equal image blocks as nav shortcuts
├─────────────────────────────┤
│  [Feature section]          │  repeat as needed
├─────────────────────────────┤
│  [Social proof / marquee]   │  optional — awards, press, certifications
├─────────────────────────────┤
│  [Footer]                   │  warm, comprehensive, physical presence
└─────────────────────────────┘
```

### Page Structure (Menu / Product List)

```
┌─────────────────────────────┐
│  [Nav]                      │
├─────────────────────────────┤
│  [Page hero]                │  category name or page title, full-width image
├─────────────────────────────┤
│  [Sticky category nav]      │  horizontal scroll, anchor links to sections
├─────────────────────────────┤
│  [Section: category]        │  section image banner + item list
│    item name                │
│    [expand: ingredients]    │  progressive disclosure
│    item name                │
│    [expand: ingredients]    │
│    "Add-ons" callout        │  plain text, not a grid
├─────────────────────────────┤
│  [Section: next category]   │  repeat
└─────────────────────────────┘
```

---

## Component Reference

### Navigation

```html
<!-- Minimal nav: logo center, links left, utility right -->
<nav class="w-full bg-white border-b border-stone-200">
  <div class="max-w-6xl mx-auto px-6 h-16 flex items-center justify-between">

    <!-- Primary links: 3–5 items max -->
    <div class="hidden md:flex items-center gap-8">
      <a href="/menu" class="text-sm tracking-wide uppercase text-stone-600 hover:text-stone-900 transition-colors">Menu</a>
      <a href="/locations" class="text-sm tracking-wide uppercase text-stone-600 hover:text-stone-900 transition-colors">Locations</a>
      <a href="/about" class="text-sm tracking-wide uppercase text-stone-600 hover:text-stone-900 transition-colors">About</a>
    </div>

    <!-- Logo: always center or left, never buried -->
    <a href="/" class="font-display text-xl text-stone-900">Brand Name</a>

    <!-- Utility: 1–2 actions max -->
    <div class="flex items-center gap-4">
      <a href="/order" class="hidden md:inline-flex text-sm bg-stone-900 text-white px-4 py-2 hover:bg-stone-700 transition-colors">Order Online</a>
    </div>

  </div>
</nav>
```

**Rules:**
- Max 5 primary nav links. Use dropdowns only when necessary (multi-location, e-commerce categories).
- One utility CTA button in nav — the single most important action.
- No hamburger menus on desktop. Mobile: simple slide-in drawer, not a full-screen takeover.
- Nav background: white or very light. Never a dark nav unless the entire site is dark-themed.

---

### Announcement Bar

```html
<!-- Above nav, for promos, seasonal alerts, or shipping offers -->
<div class="w-full bg-stone-900 text-white text-center py-2 px-4">
  <p class="text-sm">Free shipping on orders over $60 — <a href="/shop" class="underline underline-offset-2">Shop now</a></p>
</div>
```

Use only when there is a genuine time-sensitive or high-value message. Not permanent chrome.

---

### Full-Bleed Hero

```html
<!-- Hero: image fills viewport width, headline overlays or sits below -->
<section class="relative w-full">

  <!-- Option A: Text overlay on image -->
  <div class="relative h-[70vh] min-h-[480px] overflow-hidden">
    <img src="hero.jpg" alt="..." class="absolute inset-0 w-full h-full object-cover" />
    <div class="absolute inset-0 bg-black/20" />  <!-- subtle scrim only if needed for legibility -->
    <div class="absolute inset-0 flex flex-col items-center justify-center text-center text-white px-6">
      <h1 class="font-display text-5xl md:text-7xl font-normal mb-4">Spring starts now</h1>
      <a href="/menu" class="text-sm tracking-widest uppercase border border-white px-6 py-3 hover:bg-white hover:text-stone-900 transition-colors">See the menu</a>
    </div>
  </div>

  <!-- Option B: Image above, text below (cleaner, safer) -->
  <div class="h-[60vh] min-h-[400px] overflow-hidden">
    <img src="hero.jpg" alt="..." class="w-full h-full object-cover" />
  </div>
  <div class="max-w-2xl mx-auto text-center px-6 py-16">
    <h1 class="font-display text-4xl md:text-5xl font-normal mb-4 text-stone-900">It's a great day for coffee</h1>
    <a href="/order" class="inline-block text-sm tracking-wide uppercase bg-stone-900 text-white px-8 py-3 hover:bg-stone-700 transition-colors">Start an order</a>
  </div>

</section>
```

**Rules:**
- One headline. One CTA. No subheadline needed.
- Overlay scrims: 10–25% black max. Never dark enough to obscure the image.
- Hero height: 60–75vh. Never 100vh (content below the fold matters).

---

### Feature Section (Image + Text)

```html
<!-- Alternating image/text sections — the workhorse of this layout -->
<section class="max-w-6xl mx-auto px-6 py-20">
  <div class="grid md:grid-cols-2 gap-12 lg:gap-20 items-center">

    <div class="order-2 md:order-1">
      <h2 class="font-display text-3xl md:text-4xl font-normal text-stone-900 mb-4">Made for matcha fans</h2>
      <p class="text-stone-600 leading-relaxed mb-8">New drinkware in every shade of fresh-whisked green. Find your perfect vessel.</p>
      <a href="/shop" class="text-sm tracking-wide uppercase text-stone-900 border-b border-stone-900 pb-0.5 hover:text-stone-600 hover:border-stone-600 transition-colors">Shop drinkware</a>
    </div>

    <div class="order-1 md:order-2 aspect-square overflow-hidden">
      <img src="matcha.jpg" alt="..." class="w-full h-full object-cover" />
    </div>

  </div>
</section>
```

**Rules:**
- Alternate image left/right across multiple sections for rhythm.
- Text block: headline + 1–2 sentence body + single text-link CTA (underline style, not button).
- Image: square or portrait aspect ratio. Never landscape-cropped in this position.

---

### 2-Up Image Link Blocks

```html
<!-- Two equal image blocks as navigation shortcuts -->
<section class="grid grid-cols-2 gap-1 md:gap-2">

  <a href="/locations" class="group relative aspect-[4/3] overflow-hidden">
    <img src="roastery.jpg" alt="The Roastery" class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500" />
    <div class="absolute inset-0 bg-black/30 group-hover:bg-black/40 transition-colors" />
    <div class="absolute inset-0 flex flex-col items-center justify-center text-white text-center">
      <span class="font-display text-2xl md:text-3xl font-normal">The Roastery</span>
      <span class="text-sm tracking-widest uppercase mt-2 opacity-80">Visit us</span>
    </div>
  </a>

  <a href="/shop" class="group relative aspect-[4/3] overflow-hidden">
    <img src="shop.jpg" alt="Shop Coffee" class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-500" />
    <div class="absolute inset-0 bg-black/30 group-hover:bg-black/40 transition-colors" />
    <div class="absolute inset-0 flex flex-col items-center justify-center text-white text-center">
      <span class="font-display text-2xl md:text-3xl font-normal">Shop Coffee</span>
      <span class="text-sm tracking-widest uppercase mt-2 opacity-80">Order online</span>
    </div>
  </a>

</section>
```

**Rules:**
- No gap (or 1px gap) between blocks. The seam is deliberate, not an accident.
- Hover: subtle scale + slightly darker scrim. No border, no box-shadow.
- Label: display font, brief, 2–3 words max.

---

### Product Card (E-commerce / Menu Item)

```html
<!-- Circular image variant (coffee roaster style) -->
<a href="/products/montana-blend" class="group flex flex-col items-center text-center gap-3">
  <div class="w-40 h-40 rounded-full overflow-hidden bg-stone-100">
    <img src="montana-blend.png" alt="Montana Blend" class="w-full h-full object-cover group-hover:scale-105 transition-transform duration-300" />
  </div>
  <div>
    <h3 class="font-display text-lg text-stone-900">Montana Blend</h3>
    <p class="text-sm text-stone-500">From $17.60</p>
  </div>
</a>

<!-- Rectangular image variant (cafe / food menu style) -->
<div class="flex items-start gap-4 py-5 border-b border-stone-100">
  <div class="w-20 h-20 flex-shrink-0 overflow-hidden">
    <img src="crepe.jpg" alt="Classic Nutella" class="w-full h-full object-cover" />
  </div>
  <div class="flex-1 min-w-0">
    <h3 class="font-display text-lg text-stone-900">Classic Nutella®</h3>
    <p class="text-sm text-stone-500 mt-0.5">Nutella</p>
  </div>
  <span class="text-sm text-stone-700 flex-shrink-0">£7.50</span>
</div>
```

---

### Menu Item with Progressive Disclosure (Accordion)

```html
<!-- Alpine.js accordion — ingredients hidden by default -->
<div class="py-5 border-b border-stone-100" x-data="{ open: false }">
  <div class="flex items-center justify-between gap-4">

    <div class="flex-1">
      <h3 class="font-display text-lg text-stone-900">Love You Lotus</h3>
    </div>

    <div class="flex items-center gap-4 flex-shrink-0">
      <span class="text-sm text-stone-700">£9.50</span>
      <button
        @click="open = !open"
        class="text-xs tracking-wide uppercase text-stone-500 hover:text-stone-900 transition-colors flex items-center gap-1"
        :aria-expanded="open"
      >
        <span x-text="open ? 'Close' : 'Ingredients'"></span>
        <span x-text="open ? '−' : '+'"></span>
      </button>
    </div>

  </div>

  <div x-show="open" x-transition:enter="transition ease-out duration-200" x-transition:enter-start="opacity-0 -translate-y-1" x-transition:enter-end="opacity-100 translate-y-0" class="mt-3">
    <ul class="text-sm text-stone-500 space-y-1 pl-0 list-none">
      <li>Lotus Biscuit</li>
      <li>Lotus Spread</li>
      <li>Whipped cream</li>
      <li>Ice Cream</li>
    </ul>
  </div>
</div>
```

---

### Sticky Category Nav (Menu Pages)

```html
<!-- Horizontal scrolling anchor nav — sticks below main nav on scroll -->
<nav class="sticky top-0 z-10 bg-white border-b border-stone-200 overflow-x-auto">
  <div class="flex items-center gap-0 min-w-max px-6">
    <a href="#sweet"   class="px-5 py-4 text-sm tracking-wide uppercase text-stone-600 hover:text-stone-900 border-b-2 border-transparent hover:border-stone-900 transition-colors whitespace-nowrap">Sweet</a>
    <a href="#savoury" class="px-5 py-4 text-sm tracking-wide uppercase text-stone-600 hover:text-stone-900 border-b-2 border-transparent hover:border-stone-900 transition-colors whitespace-nowrap">Savoury</a>
    <a href="#coffee"  class="px-5 py-4 text-sm tracking-wide uppercase text-stone-600 hover:text-stone-900 border-b-2 border-transparent hover:border-stone-900 transition-colors whitespace-nowrap">Coffee</a>
    <a href="#drinks"  class="px-5 py-4 text-sm tracking-wide uppercase text-stone-600 hover:text-stone-900 border-b-2 border-transparent hover:border-stone-900 transition-colors whitespace-nowrap">Drinks</a>
  </div>
</nav>
```

Active state highlighting can be driven by an Intersection Observer or Alpine.js
scroll watcher. Keep it subtle — border-bottom highlight only, no filled tab style.

---

### Tasting Note Microcopy

```html
<!-- Pipe-separated tasting notes — coffee, specialty food -->
<p class="text-xs tracking-widest uppercase text-stone-400">
  Honey Crisp Apple&nbsp;&nbsp;|&nbsp;&nbsp;Milk Chocolate&nbsp;&nbsp;|&nbsp;&nbsp;Caramel
</p>
```

Three notes maximum. Separated by `|` with extra spacing. Always lowercase or
all-caps — never mixed case. Placed directly under the product name, before price.

---

### Section Divider / Category Banner

```html
<!-- Full-width image used as a visual separator between menu sections -->
<div class="w-full h-48 md:h-64 overflow-hidden my-8">
  <img src="sweet-banner.jpg" alt="Sweet crêpes" class="w-full h-full object-cover object-center" />
</div>
```

No text overlay needed. The section heading sits below in normal flow. The image
is purely atmospheric.

---

### Scrolling Marquee (Social Proof)

```html
<!-- Repeating horizontal scroll for certifications, press, values -->
<div class="w-full overflow-hidden bg-stone-900 py-4">
  <div class="flex animate-marquee whitespace-nowrap">
    <!-- Repeat content block 3–4x for seamless loop -->
    <span class="inline-flex items-center gap-8 px-8 text-white text-sm tracking-widest uppercase">
      <span>Certified Organic</span>
      <span aria-hidden="true">·</span>
      <span>1% for the Planet Member</span>
      <span aria-hidden="true">·</span>
      <span>Montana Roasted</span>
      <span aria-hidden="true">·</span>
    </span>
    <!-- repeat... -->
  </div>
</div>

<!-- Tailwind config addition needed: -->
<!-- animation: { marquee: 'marquee 20s linear infinite' } -->
<!-- keyframes: { marquee: { '0%': { transform: 'translateX(0)' }, '100%': { transform: 'translateX(-50%)' } } } -->
```

Use sparingly — one per page maximum, at a natural transition point.

---

### Footer

```html
<!-- Warm, comprehensive footer — physical presence matters -->
<footer class="bg-stone-900 text-stone-300">

  <!-- Optional: top CTA strip -->
  <div class="border-b border-stone-700 px-6 py-10 text-center">
    <p class="font-display text-2xl text-white mb-3">Join our mailing list</p>
    <p class="text-sm text-stone-400 mb-6">News, new coffees, and updates from Montana.</p>
    <form class="flex gap-2 max-w-sm mx-auto">
      <input type="email" placeholder="your@email.com" class="flex-1 bg-stone-800 border border-stone-700 px-4 py-2 text-sm text-white placeholder-stone-500 focus:outline-none focus:border-stone-500" />
      <button type="submit" class="bg-white text-stone-900 px-5 py-2 text-sm hover:bg-stone-100 transition-colors">Subscribe</button>
    </form>
  </div>

  <!-- Main footer grid -->
  <div class="max-w-6xl mx-auto px-6 py-12 grid grid-cols-2 md:grid-cols-4 gap-8">

    <div class="col-span-2 md:col-span-1">
      <!-- Logo + address — anchors brand in a real place -->
      <p class="font-display text-white text-lg mb-3">Brand Name</p>
      <address class="text-sm text-stone-400 not-italic leading-relaxed">
        123 Main Street<br>
        Whitefish, MT 59937<br>
        (406) 555-0100
      </address>
    </div>

    <div>
      <h3 class="text-xs tracking-widest uppercase text-stone-500 mb-4">Shop</h3>
      <ul class="space-y-2 text-sm">
        <li><a href="/menu" class="hover:text-white transition-colors">Menu</a></li>
        <li><a href="/shop" class="hover:text-white transition-colors">Coffee</a></li>
        <li><a href="/gift-cards" class="hover:text-white transition-colors">Gift Cards</a></li>
      </ul>
    </div>

    <div>
      <h3 class="text-xs tracking-widest uppercase text-stone-500 mb-4">Visit</h3>
      <ul class="space-y-2 text-sm">
        <li><a href="/locations" class="hover:text-white transition-colors">Locations</a></li>
        <li><a href="/events" class="hover:text-white transition-colors">Events</a></li>
      </ul>
    </div>

    <div>
      <!-- "The Other Stuff" — warmth in the small things -->
      <h3 class="text-xs tracking-widest uppercase text-stone-500 mb-4">The Other Stuff</h3>
      <ul class="space-y-2 text-sm">
        <li><a href="/about" class="hover:text-white transition-colors">About Us</a></li>
        <li><a href="/wholesale" class="hover:text-white transition-colors">Wholesale</a></li>
        <li><a href="/careers" class="hover:text-white transition-colors">Careers</a></li>
        <li><a href="/contact" class="hover:text-white transition-colors">Contact</a></li>
      </ul>
    </div>

  </div>

  <!-- Bottom bar -->
  <div class="border-t border-stone-800 px-6 py-5 flex flex-col md:flex-row items-center justify-between gap-3 text-xs text-stone-500">
    <span>© 2026 Brand Name. All rights reserved.</span>
    <div class="flex gap-4">
      <a href="/privacy" class="hover:text-stone-300 transition-colors">Privacy Policy</a>
      <a href="/terms" class="hover:text-stone-300 transition-colors">Terms of Use</a>
    </div>
  </div>

</footer>
```

**Footer rules:**
- Dark background (stone-900 or brand dark) — creates clear page termination.
- Physical address included for brick-and-mortar clients. Always.
- Column heading: `text-xs tracking-widest uppercase text-muted` — never bold.
- One personality moment allowed: a warm column heading like "The Other Stuff" or
  "Stay in Touch" instead of just "Links".

---

## Copy Patterns

### Headlines
```
Good:  "Spring starts now"
Good:  "Born and roasted here"
Good:  "Made especially for matcha fans"
Bad:   "Discover our exceptional seasonal beverage offerings"
Bad:   "Welcome to [Brand Name]"
```

### Section Body Copy
```
Good:  "From beans roasted right in our hometown, Billings."  (one sentence)
Good:  "Our newest single origins span from Africa to Central America."
Bad:   "We are committed to sourcing the finest quality coffee beans from
        sustainable farms around the world to deliver an exceptional experience."
```

### CTA Text
```
Good:  "See the spring menu"  /  "Shop coffee"  /  "Find a store"
Good:  "Start an order"       /  "Order online" /  "Visit us"
Bad:   "Click here"           /  "Learn more"   /  "Submit"
```

### Tasting Notes
```
Good:  "Honey Crisp Apple  |  Milk Chocolate  |  Caramel"
Good:  "Strawberry  |  Sweet Lime  |  Almond"
Rule:  3 notes max. Concrete nouns. No adjectives in the note itself.
```

---

## What NOT to Do

- **No card grids for primary content.** Cards work for product carousels; they
  feel clinical for story-driven sections.
- **No hero carousels with 5+ slides.** Two slides max if you must rotate. Prefer
  a single static hero.
- **No stock photography of coffee cups on wooden tables.** Use real brand photography
  or illustration. Generic stock breaks the authenticity immediately.
- **No full-width dark sections mid-page** (except the footer). Dark sections
  interrupt the airy feeling and feel heavy. One exception: a marquee strip.
- **No pricing in tiny gray text.** If you show prices, show them confidently at
  the same weight as the item name.
- **No modal pop-ups on page load** (except email capture after 30+ seconds of
  engagement, which is acceptable).
- **No star ratings or review counts on menu/product cards.** This aesthetic does
  not cite social proof at the item level. It trusts the photography and copy.

---

## Implementation Notes (Go / htmx / Alpine.js / Tailwind)

- **Sticky category nav** active state: use an Alpine.js `IntersectionObserver`
  component to watch section headings and update the active anchor link.
- **Accordion (progressive disclosure)**: Alpine.js `x-data="{ open: false }"` +
  `x-show` + `x-transition`. No JS framework needed.
- **Marquee animation**: Tailwind `animate-[marquee_20s_linear_infinite]` with
  a custom keyframe, or a simple CSS class in your base stylesheet.
- **Circular product images**: `rounded-full overflow-hidden` in Tailwind.
  Ensure the source images are square-cropped; do not rely on CSS to fix bad crops.
- **Image performance**: Always use `loading="lazy"` on below-fold images.
  For the hero, use `loading="eager"` and provide a proper `srcset`.
- **Font loading**: Load display and body fonts via `<link rel="preconnect">`
  and `font-display: swap` to prevent layout shift.
- **htmx patterns**: Category filter navigation on menu pages works well as an
  htmx `hx-get` + `hx-target` swap — fetch filtered content without full reload,
  preserving scroll position.