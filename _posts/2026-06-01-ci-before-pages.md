---
layout: Soonex.PostLayout
title: CI before Pages
date: 2026-06-01 12:00:00 +0000
permalink: /blog/ci-before-pages/
description: Keep CI green before Pages deploys. Axe on the home document is the gate; the countdown stays aimed at 1 September.
tags:
  - Launch
  - Notes
sitemap:
  priority: 0.7
  changefreq: monthly
---

We do not ship a broken landing. Keep **CI green** before Pages deploys so a bad push never reaches the public CDN. Axe on the home document is the gate.

## Before you push

Stop `mix soonex.server` if port 4999 is bound. Then `MIX_ENV=test mix test`.

### Checklist

- [x] Mix, Tailwind, and esbuild in the project
- [x] No `package.json`
- [ ] Your mailbox wired to the waitlist fields

### Quick table

| Check | Command | Note |
| --- | --- | --- |
| Axe | `mix test` | Home document |
| Build | `mix tableau.build` | Static `_site/` |
| Serve | `mix soonex.server` | Local preview |

> [!TIP]
> Keep CI green before Pages deploys so broken pushes never reach the public CDN.

```elixir
defmodule Soonex.Shipping do
  def ready?, do: true
end
```

The countdown target in this demo is 1 September. Change it in the root layout when you have a real date[^ship].

[^ship]: Days, hours, minutes, and seconds stay on one row. The header timer appears after the hero.
