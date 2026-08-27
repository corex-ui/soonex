---
layout: Soonex.PostLayout
title: Four themes without forking Corex CSS
date: 2026-04-08 09:00:00 +0000
permalink: /blog/excepteur-sint-occaecat/
description: neo, uno, duo, and leo live in config. Template Options switches them on this device so they read as four products.
image: /images/photos/studio.jpg
image_alt: A calm studio interior with a low sofa, plants, and a large window
tags:
  - Design
  - Studio
sitemap:
  priority: 0.6
  changefreq: monthly
---

Theme, brand, and accent live in config. The floating **Template Options** panel switches neo, uno, duo, and leo on this device. Host CSS does not copy component recipes.

## What each theme is for

neo is a cool gallery. uno is mint and tight. duo is salon cream with round corners. leo is kraft paper and a hard edge.

### Review table

| Theme | Paper | Corner | Type |
| --- | --- | --- | --- |
| neo | Gallery | Soft | Outfit |
| uno | Mint | Tight | Sora |
| duo | Salon | Round | Playfair |
| leo | Kraft | None | IBM Plex |

### Studio checklist

- [x] Seeds and light/dark colors in overlays
- [x] Radius and fonts per theme
- [ ] Your photography in the frames

> [!TIP]
> There is no `ui-input` utility in Corex. Soonex treats triggers and field hosts as the control language via `--ctl-radius`, `--ctl-space`, `--ctl-size`, and `--ctl-text`.

```elixir
# Theme overlays must not set *_scale, duration, or opacity.
config :corex_design, default_theme: :neo
```
