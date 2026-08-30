---
layout: Soonex.PostLayout
title: The header timer and 1 September
date: 2026-07-14 15:00:00 +0000
permalink: /blog/header-timer/
description: The countdown lives in the header, stays on one row, and aims at 1 September until you change the date.
tags:
  - Launch
  - Notes
sitemap:
  priority: 0.6
  changefreq: monthly
---

The countdown is a **header control**, not a hero gadget. It stays hidden and inert until you pass the hero, then it sits on one row aimed at **1 September**.

## What to change

The target lives in the root layout. Swap the timestamp when you have a real date. Days, hours, minutes, and seconds stay on one row.

- Header timer appears after the hero
- Digits flip in a 2em window — do not shrink it
- Reduced motion still condenses the bar

> [!IMPORTANT]
> Change the target when you have a real date. The digits stay on one row.

The condensed header and progress bar stay as chrome when motion is reduced[^orbit].

[^orbit]: Accessibility → Motion → Reduced. The type still holds.

```bash
mix soonex.server
```
