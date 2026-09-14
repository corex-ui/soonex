---
layout: Soonex.PostLayout
title: Voices after the skins
date: 2026-08-02 11:00:00 +0000
permalink: /blog/temporibus-autem/
description: Testimonials are a grid you can scan. Skins restyle the cards. The quotes stay placeholders you replace.
image: /images/covers/overlay.jpg
image_alt: Soft abstract color field in warm paper tones
tags:
  - Voices
  - Notes
sitemap:
  priority: 0.6
  changefreq: monthly
---

Social proof on launch pages often arrives as an auto-advancing carousel—pretty in a keynote, fragile on mobile, and easy to ignore. Soonex uses a **three-column quote grid** on the home page instead. Visitors scan all three voices in one glance; skins restyle the cards without a second template.

## Grid over carousel

Carousels hide content behind interaction and motion. A grid respects reduced-motion preferences and works when JavaScript is slow or blocked. Duo can go editorial with serif pull quotes; leo can strip radius and lean on rules; neo keeps cards flat and quiet—all from the same HEEx in `Soonex.HomePage.Voices`.

The journal link below the grid sends readers to longer-form posts. Home shows three voices; `/blog` paginates the rest.

## What to replace

The demo ships placeholder names, roles, and portraits under `extra/images/photos/`. Keep the structure; swap the substance.

1. **Portraits** — use real customers, team members, or licensed stock at consistent aspect ratio.
2. **Quotes** — mention outcomes, not adjectives. “We shipped in a week” beats “Beautiful template.”
3. **Roles** — job title and company, or “Early access” if you lack logo permission yet.

> If a theme switch is invisible, the template failed. The same applies to testimonials—if quotes could belong to any SaaS, rewrite them.

### Content guidelines

- One sentence per quote when possible; two if you need a concrete metric.
- Avoid superlatives without evidence.
- Match tone to the active skin: leo can be punchy; duo can be reflective.

> [!WARNING]
> Do not add a second carousel for the journal. The home grid is three cards; `/blog` paginates the rest.

## Skin-specific presentation

| Skin | Card treatment |
| --- | --- |
| neo | Minimal border, small avatar |
| uno | Rounded surface cards, italic quote |
| duo | Serif quote body, wider gutters |
| leo | Square avatars, uppercase roles |

Markup stays identical—only `[data-theme]` CSS changes spacing, type, and borders.

## Accessibility

Avatars include `alt` text derived from names in the demo. When you replace photos, write alt that identifies the speaker, not “headshot.” Quotes are plain paragraphs, not images of text, so they reflow at large type sizes from the accessibility panel.

## Connecting to real customers

When you have permission to publish testimonials:

1. Collect quote, name, role, and optional logo in writing.
2. Update the `voice_items/0` list in `Soonex.HomePage.Voices`.
3. Add a journal post with the full case study and link from the grid if needed.

Use **bold**, *italic*, and `inline code` in journal case studies when you cite product details—same Markdown pipeline as this post.

## What we left out

No star ratings, no Twitter embeds, no video testimonials. Those add third-party weight and consent complexity. Add them in your fork if your market expects them—and disclose them on the privacy page.

![Soonex Open Graph placeholder](/images/og.svg)

Replace the placeholders before you send traffic. Social proof only works when it sounds like your product—not like a theme demo.
