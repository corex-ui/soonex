---
layout: Soonex.PostLayout
title: Accessibility on this device
date: 2026-08-02 11:00:00 +0000
permalink: /blog/accessibility-on-device/
description: Zoom, contrast, motion, cursor, focus, and link underline — Corex accessibility, stored in local storage.
image: /images/covers/overlay.jpg
image_alt: Soft abstract color field in warm paper tones
tags:
  - Notes
  - Launch
sitemap:
  priority: 0.6
  changefreq: monthly
---

The Accessibility control opens zoom, contrast, motion, cursor, focus, and link underline for this device. Choices persist in **local storage** and write data attributes on the document.

## What reduced motion does

Scroll reveal lives in host CSS. Set Motion to Reduced in Accessibility and those animations stop.

> Reset returns the defaults. The condensed header and progress bar stay as chrome.

### Order of operations

1. Open Accessibility
2. Set Motion to Reduced
3. Confirm the hero and log still read

> [!WARNING]
> Host CSS must not set overlay scale, duration, or opacity. Theme.Validator will reject those keys.

Use **bold**, *italic*, and `inline code` in the same paragraph when you document the dialog.

![Soonex Open Graph](/images/og.svg)
