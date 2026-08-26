# Changelog

## 0.2.1

- Upgrade Corex packages to 0.2.1 (`corex`, `corex_design`, `corex_mcp`).
- Keep stock Corex themes (neo/uno/duo/leo) and self-host their type stacks.
- Production marketing chrome: SVG lockup, sticky condensed header, waitlist-card hero, full-width timer.
- Overlay every allowed Corex design key (seeds, light/dark colors, radius, font, typography) plus top-level `scales:`.
- Home bands each use one signature component (carousel, data_table, tabs, collapsible, date_picker, tooltip). FAQ keeps the sticky split.
- Blog, tags, and 404 use `layout_heading`, article cards, and pagination instead of `data_list` rows.
- Header countdown uses `hidden` + `inert` until past the hero sentinel (no transform peek).
- Drop homepage/blog BEM CSS in favor of inline Tailwind + Corex tokens.
- Use the common Tailwind marketing section (`py-24` / heading cluster / `mt-16` body) with a full-bleed stage (`max-w-[90rem]`).
- Override Tableau's `mdex ~> 0.11.1` pin to `mdex ~> 0.13.2` (CVE-2026-53426 / 53427 / 53428 / 53429 / 54888 / 54889).
- Add `mix soonex.server` / `mix soonex.port_check` so a taken :4999 fails with the occupant instead of Tableau's premature “server started” log.
- Drop Lenis and `assets/package.json`; native `scroll-smooth` is enough.
- Enable Corex accessibility (`accessibility: true`) with the official `--a11y` dialog (localStorage, no Phoenix plug). `corex_design` is a runtime dependency for that.
- Tiny `hosts.css` after `corex.css`. No token opacity.

## 0.2.0

- Upgrade to Corex 0.2 (`corex`, `corex_design`, `corex_mcp`); replace Designex with `mix corex.design.build`.
- Migrate component modifiers to shared `ui-*` classes and token renames (`bg-surface`, `text-brand-text`).
- Require Elixir `~> 1.17`.
- Publish GitHub Pages only via `deploy.yml` after CI succeeds on `main` (remove ungated `pages.yml`).

## 0.1.0

Initial Soonex template release.
