# Changelog

## 0.2.1

- Upgrade Corex packages to 0.2.1 (`corex`, `corex_design`, `corex_mcp`).
- Keep stock Corex themes (neo/uno/duo/leo) and self-host their type stacks.
- Rebuild home, blog, and footer as a Lorem Ipsum template with extra sections.
- Drop homepage/blog BEM CSS in favor of inline Tailwind + Corex tokens.
- Use the common Tailwind marketing section (`py-24` / `max-w-7xl` / heading cluster / `mt-16` body).
- Sticky countdown is a centered `w-fit` chip, not a full-width bar.
- Index, acta, blog, and tags lists use Corex `data-list` with the arrow at the end of each row.
- Add Socii (marquee), Officia (tabs), and Numeri (stats); FAQ stays on Corex accordion.

## 0.2.0

- Upgrade to Corex 0.2 (`corex`, `corex_design`, `corex_mcp`); replace Designex with `mix corex.design.build`.
- Migrate component modifiers to shared `ui-*` classes and token renames (`bg-surface`, `text-brand-text`).
- Require Elixir `~> 1.17`.
- Publish GitHub Pages only via `deploy.yml` after CI succeeds on `main` (remove ungated `pages.yml`).

## 0.1.0

Initial Soonex template release.
