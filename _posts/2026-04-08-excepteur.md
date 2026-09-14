---
layout: Soonex.PostLayout
title: Four skins, one markup tree
date: 2026-04-08 09:00:00 +0000
permalink: /blog/excepteur-sint-occaecat/
description: Neo, uno, duo, and leo stop sharing one layout. Each theme has a CSS file you can delete.
image: /images/photos/studio.jpg
image_alt: A calm studio interior with a low sofa, plants, and a large window
tags:
  - Design
  - Studio
sitemap:
  priority: 0.6
  changefreq: monthly
---

Recoloring a generic landing page is not a theme. Soonex keeps one HEEx tree and lets each Corex theme restyle chrome, density, and ornament from an isolated skin file. Switching from neo to leo should feel like opening a different template—not toggling a palette.

## The split of responsibilities

**Corex config** owns design tokens: color seeds, radius, typography stacks, contrast targets, and light/dark overlays. Run `mix corex.design.build` after you change `config/config.exs`.

**Skin CSS** owns composition: nav shape, hero layout, FAQ treatment, pricing cards, and section rhythm. Each skin lives in `assets/css/skins/{theme}.css` and loads only when that theme is active via `data-theme` on the document root.

That separation means you can tune brand colors globally while letting neo stay quiet and leo stay poster-loud without conditional spaghetti in HEEx.

## What each skin is for

| Theme | Reference feel | What changes |
| --- | --- | --- |
| neo | Salient | Centered sticky nav, soft hero grid, underline accent on headlines |
| uno | Shellular | Pill-shaped header bar, rounded cards, italic accent type |
| duo | Studio | Editorial hero with photo panel, serif accents in FAQ answers |
| leo | Keynote | Zero-radius frames, uppercase chrome, stacked hero, rule-based sections |

None of these skins duplicate page modules. The home page, journal, and privacy route render the same structure; only CSS selectors under `[data-theme="…"]` differ.

## Optional skin JavaScript

Each theme can ship a tiny loader under `assets/js/skins/{theme}.js`. Loaders attach scroll-driven classes or hero parallax where motion is allowed. When `prefers-reduced-motion` is set—or when the accessibility panel disables motion—the loaders no-op. You can delete a skin’s JS file if you want a CSS-only look.

### Checklist for a new skin

- [x] Isolated CSS under `assets/css/skins`
- [x] Import in `assets/css/site.css`
- [x] Optional JS registered in `assets/js/skins.js`
- [ ] Your brand stills in the hero frame
- [ ] Copy pass so voice matches the visual tone

> [!TIP]
> Delete `assets/css/skins/leo.css` and drop `:leo` from config to remove that look entirely. No HEEx edits required.

## Tokens only in host CSS

Skins may use `color-mix` against tokens but must not introduce opacity modifiers like `bg-surface/90`. That keeps contrast predictable when users crank accessibility settings. If a section needs separation, mix surface against root or add a border token—not alpha hacks on utility classes.

## Launch date stays centralised

Every skin reads the same launch target from one module:

```elixir
defmodule Soonex.Launch do
  def year_label, do: "1 December 2026"
end
```

Hero badges, stats bands, and the header countdown all call into `Soonex.Launch`. When you change the date for your product, edit one file—not four skin stylesheets.

## Choosing a default

Pick the skin that matches how you want founders to *feel* about your product on first load:

- **neo** — credible SaaS, minimal ornament
- **uno** — friendly dev tool, rounded and approachable
- **duo** — design-led, photography-forward
- **leo** — bold announcement, conference keynote energy

Set the default theme in `config/config.exs` and document the choice in your README. Visitors can still switch themes from Template Options; the demo is meant to show range, not indecision.

If a theme switch is invisible, the skin failed. Soonex exists so that switch is obvious within the first scroll.
