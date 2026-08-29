---
layout: Soonex.PostLayout
title: Four rooms on near-white paper
date: 2026-04-08 09:00:00 +0000
permalink: /blog/four-rooms/
description: neo, uno, duo, and leo live in config. Type, radius, and brand change the room. Paper stays near-white.
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

## What each room is for

neo is a product studio. uno is calm ops. duo is an editorial atelier. leo is a signal poster. Paper stays near-white in every room.

### Review table

| Theme | Room | Corner | Type |
| --- | --- | --- | --- |
| neo | Product studio | Open | Outfit |
| uno | Calm ops | Tight | Sora |
| duo | Editorial atelier | Soft | Playfair |
| leo | Signal poster | Square | IBM Plex |

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
