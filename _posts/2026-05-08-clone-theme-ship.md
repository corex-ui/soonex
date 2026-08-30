---
layout: Soonex.PostLayout
title: Clone, look, and ship
date: 2026-05-08 12:00:00 +0000
permalink: /blog/clone-theme-ship/
description: Clone Soonex, pick a look for review, keep the waitlist and log, and aim the countdown at your date.
image: /images/covers/overlay.jpg
image_alt: Soft abstract color field in warm paper tones
tags:
  - Launch
  - Template
sitemap:
  priority: 0.9
  changefreq: monthly
---

Soonex is the **September launch** we are shipping: waitlist, public log, countdown, and four looks. Fork it, rename the brand, and keep the controls.

## Start here

### Clone

#### Then mix setup

The repo already has Mix, Tailwind, and esbuild. There is no npm install step. Use **bold**, *italic*, ***combined***, `inline code`, and ~~strikethrough~~ when you need emphasis variety in a shipping note.

### Links

Markdown link: [Soonex on GitHub](https://github.com/corex-ui/soonex). Bare URL: https://github.com/corex-ui/soonex.

---

## Lists and tasks

### Unordered

- Clone `https://github.com/corex-ui/soonex.git`
  - Run `mix setup`
  - Run `mix soonex.server`
- Swap stills and the lockup
- Point the countdown at your date

### Ordered

1. Pick a look in Template Options
2. Add log posts under `_posts/`
3. Wire waitlist fields to your list

### Task list

- [x] Waitlist toast on submit
- [ ] Real mailbox backend
- [ ] Your launch photography

---

## Table

| Band | Job | Note |
| --- | --- | --- |
| Product | What you launch | Tabs + clone strip |
| Looks | Four rooms | Type, radius, brand |
| Log | Shipping notes | Client pager |
| Waitlist | Canonical form | Toast on submit |

| Feature | Status | Note |
| --- | :---: | --- |
| Tables | Ready | In the log renderer |
| Task lists | Ready | GitHub-style checkboxes |
| Alerts | Ready | NOTE / TIP / WARNING |
| Footnotes | Ready | Collected at document end |

---

## Blockquote

> Fork once. Pick a look. Ship on the date.

> The waitlist and countdown stay. Rename Soonex when you are ready.

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
> Swap the lockup, stills, and launch date before you call it your product.

> [!WARNING]
> `mix soonex.server` fails if port 4999 is already bound. Stop the occupant first.

> [!CAUTION]
> Log pagination is a client event. There is no LiveView `handle_event`.

---

## Footnotes

The log index paginates on the client[^alpha]. Reduced motion lives in Accessibility[^beta].

[^alpha]: Host script listens for `pagination-page-changed` and hides the other SSR entries.
[^beta]: Scroll reveal stops under `data-motion=reduce`.

---

## Code

Fenced Elixir:

```elixir
defmodule Soonex.HomePage do
  @moduledoc "September launch landing."

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
<p>Press <kbd>Ctrl</kbd>+<kbd>K</kbd> style shortcuts when documenting keyboards. The product does not bind that chord.</p>
</details>

---

> **Tip:** After `mix tableau.build`, open the permalink under `_site/` to confirm tables, alerts, images, and footnotes shipped as expected.
