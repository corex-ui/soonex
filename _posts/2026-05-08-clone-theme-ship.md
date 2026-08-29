---
layout: Soonex.PostLayout
title: Clone, theme, and ship
date: 2026-05-08 12:00:00 +0000
permalink: /blog/clone-theme-ship/
description: Clone the launch template, switch neo/uno/duo/leo in config, and rebuild the Markdown log.
image: /images/covers/overlay.jpg
image_alt: Soft abstract color field in warm paper tones
tags:
  - Themes
  - Template
sitemap:
  priority: 0.9
  changefreq: monthly
---

Soonex is an **open-source launch template** from Corex. Fork it, theme it in config, keep the log and countdown, and launch with accessible controls.

## Start here

### Clone

#### Then mix setup

The repo already has Mix, Tailwind, and esbuild. There is no npm install step. Use **bold**, *italic*, ***combined***, `inline code`, and ~~strikethrough~~ in the same paragraph when you need emphasis variety.

### Links and autolink

Markdown link: [Hexdocs Corex](https://hexdocs.pm/corex). Bare URL with autolink: https://hexdocs.pm/mdex/MDEx.html.

---

## Lists and tasks

### Unordered

- Clone `https://github.com/corex-ui/soonex.git`
  - Run `mix setup`
  - Run `mix soonex.server`
- Swap stills and the lockup
- Point the countdown at your date

### Ordered

1. Theme overlays in `config/config.exs`
2. Log posts under `_posts/`
3. Waitlist fields wired to your list

### Task list

- [x] Waitlist toast on submit
- [ ] Real mailbox backend
- [ ] Your launch photography

---

## Table

| Band | Job | Note |
| --- | --- | --- |
| Product | What you fork | Tabs + clone strip |
| Rooms | Four themes | Type, radius, brand |
| Log | Shipping notes | Client pager |
| Waitlist | Canonical form | Toast on submit |

| Feature | Status | Note |
| --- | :---: | --- |
| Tables | Ready | `extension: [table: true]` |
| Task lists | Ready | GitHub-style checkboxes |
| Alerts | Ready | NOTE / TIP / WARNING |
| Footnotes | Ready | Collected at document end |

---

## Blockquote

> Fork once. Theme in config. The controls stay upstream.

> Host CSS retunes layout. It does not copy Corex recipes or set overlay scale, duration, or opacity.

---

## Images

Default Open Graph asset:

![Soonex Open Graph](/images/og.svg)

---

## GitHub-style alerts

> [!NOTE]
> The waitlist demo does not collect addresses. Submit still shows the launch toast.

> [!TIP]
> Template Options switches neo, uno, duo, and leo on this device without a rebuild.

> [!IMPORTANT]
> Do not fork Corex CSS. Theme overlays must not set `*_scale`, duration, or opacity.

> [!WARNING]
> `mix soonex.server` fails if port 4999 is already bound. Stop the occupant first.

> [!CAUTION]
> Log pagination is a Corex client event. There is no LiveView `handle_event`.

---

## Footnotes

The log index paginates with the Corex pager on the client[^alpha]. Reduced motion lives in Accessibility[^beta].

[^alpha]: Host script listens for `pagination-page-changed` and hides the other SSR entries.
[^beta]: Scroll reveal stops under `data-motion=reduce`.

---

## Code

Fenced Elixir:

```elixir
defmodule Soonex.HomePage do
  @moduledoc "Waitlist landing for the Corex template."

  def launch_day do
    ~D[2026-09-01]
  end
end
```

Fenced bash:

```bash
mix deps.get
mix setup
mix assets.build
mix tableau.build
```

Fenced JavaScript:

```javascript
el.addEventListener("pagination-page-changed", (e) => {
  const { page, page_size } = e.detail
  // show SSR entries for that 1-based slice
})
```

Inline: run `mix soonex.server` then open `http://localhost:4999`.

---

## Horizontal rule and HTML

Trusted raw HTML with `render: [unsafe: true]`:

<details>
<summary>Keyboard shortcuts in docs</summary>
<p>Press <kbd>Ctrl</kbd>+<kbd>K</kbd> style shortcuts when documenting keyboards. The template does not bind that chord.</p>
</details>

---

> **Tip:** After `mix tableau.build`, open the permalink under `_site/` to confirm tables, alerts, images, and footnotes shipped as expected.
