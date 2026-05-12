# Soonex

English-only **Tableau** static site: Corex components, theme/mode toggles, and the same contrast pipeline as the SaaS template.

**Related:** multi-locale variant at [github.com/corex-ui/soonex_i18n](https://github.com/corex-ui/soonex_i18n). Corex docs on Hex: [installation](https://hexdocs.pm/corex/installation.html), [API](https://hexdocs.pm/corex/api.html), [Events](https://hexdocs.pm/corex/events.html), [Tableau + Corex](https://hexdocs.pm/corex/tableau.html).

## Prerequisites

- Elixir ~> 1.15
- Node.js (for `npm install` in `assets/`)

## Quick start

```shell
cd templates/soonex
mix deps.get
mix designex corex
cd assets && npm install && cd ..
mix tableau.server
```

- Dev site: `http://localhost:4999` (home at `/`).
- Production output: `MIX_ENV=prod mix build` → `_site/`.
- Set **`SOONEX_PUBLIC_URL`** for your real origin; otherwise the demo default is `https://corex-ui.github.io/soonex`.

With `MIX_ENV=dev`, Corex MCP listens at `http://localhost:4004/corex/mcp` (Tableau stays on 4999). Configure your editor using [`.cursor/mcp.json`](.cursor/mcp.json) as an example.

Rebuild assets: `mix assets.build`.

## Customize (where to edit)

- **Brand / SEO:** [`lib/layouts/root_layout.ex`](lib/layouts/root_layout.ex), [`lib/pages/root_index_page.ex`](lib/pages/root_index_page.ex).
- **Themes:** [`lib/soonex/theme.ex`](lib/soonex/theme.ex) — `data-theme` on `<html>` must match imports in [`assets/css/site.css`](assets/css/site.css).
- **Content:** home sections in [`lib/pages/home/`](lib/pages/home/), composed by [`lib/pages/home_page.ex`](lib/pages/home_page.ex).
- **Posts / data:** [`_posts/`](_posts/), [`_data/`](_data/), optional `title` / `description` in YAML; see [`_posts/2026-05-08-docs.md`](_posts/2026-05-08-docs.md).

MDX-style Tableau extras (tags, `include_dir`, sitemap) are summarized in **Tableau data, tags, and static extras** in the longer notes below.

## Rename this template

1. Commit or branch (no undo).
2. From the repo root: `mix project.rename your_otp_app` (snake_case). See [`lib/mix/tasks/project.rename.ex`](lib/mix/tasks/project.rename.ex).
3. Run `mix format` and `mix compile`.
4. **`_posts/*.md`:** only the YAML `layout:` line is rewritten; post bodies stay as-is.

## Corex assets and JS

- `assets/js/site.js` imports `corex/*`; Esbuild resolves via **`NODE_PATH`** including `deps` ([`config/config.exs`](config/config.exs)).
- Run **`mix designex corex`** after upgrading Corex.
- Local Corex checkout: `{:corex, path: "../../corex"}` in `mix.exs`, then `mix deps.get`.
- Client UI: [`assets/js/theme.js`](assets/js/theme.js), [`assets/js/mode.js`](assets/js/mode.js); landing motion under [`assets/js/landing*.js`](assets/js).

## Production and hosting

- GitHub Actions: [`.github/workflows/pages.yml`](.github/workflows/pages.yml). In the repo, set Pages **Source** to **GitHub Actions**.
- Clear `_site/` when permalinks change (`rm -rf _site`) so stale paths are not published.
- **404:** [`lib/pages/not_found_page.ex`](lib/pages/not_found_page.ex) emits `_site/404.html` for static hosts. `mix tableau.server` 404 behavior is still Tableau’s default.

## Tableau data, tags, and static extras

- **`@data`:** YAML (etc.) under [`_data/`](_data/) merged into the page assigns (e.g. `@data["facts"]["headline"]`).
- **Tags:** enabled in [`config/config.exs`](config/config.exs); index at **`/tags`** via [`lib/pages/tags_index_page.ex`](lib/pages/tags_index_page.ex).
- **Static passthrough:** [`static/`](static/) via `include_dir` on `config :tableau, :config`.
- **Sitemap:** optional `sitemap:` on `use Tableau.Page` or in post front matter.

## Drafts

Drafts and WIP live in `_drafts` and `_wip` (see `config/dev.exs` / `config/prod.exs`).
