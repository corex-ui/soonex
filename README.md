# Soonex

English-only **Tableau** static site: Corex components, theme/mode toggles, and the same contrast pipeline as the SaaS template.

**Related:** multi-locale variant at [github.com/corex-ui/soonex_i18n](https://github.com/corex-ui/soonex_i18n). Corex docs on Hex: [installation](https://hexdocs.pm/corex/installation.html), [Tableau + Corex](https://hexdocs.pm/corex/tableau.html), [Design](https://hexdocs.pm/corex/design.html), [update guide](https://hexdocs.pm/corex/update.html).

## Prerequisites

- Elixir ~> 1.17
- Hex packages `corex`, `corex_design`, and `corex_mcp` (`~> 0.2.1`)

## Quick start

```shell
cd soonex
mix setup
mix soonex.server
```

- Dev site: `http://localhost:4999` (home at `/`).
- Production output: `MIX_ENV=prod mix build` → `_site/`.
- Set **`SOONEX_PUBLIC_URL`** for your real origin; otherwise the demo default is `https://corex-ui.github.io/soonex`.

With `MIX_ENV=dev`, Corex MCP listens at `http://localhost:4004/corex/mcp` (Tableau stays on 4999). Configure your editor using [`.cursor/mcp.json`](.cursor/mcp.json) as an example.

`mix tableau.server` logs “server started on http://localhost:4999/” **before** Bandit binds. If you then see `:eaddrinuse`, another process already owns 4999 (a leftover Tableau, Wallaby, or `python -m http.server 4999`). Stop it, then retry:

```shell
ss -ltnp 'sport = :4999'          # Linux
lsof -nP -iTCP:4999 -sTCP:LISTEN  # macOS
kill <pid>
mix soonex.server                 # port check, then tableau.server
```

Rebuild assets: `mix assets.build`.

## Customize (where to edit)

- **Brand / SEO:** lockup in [`lib/layouts/brand.ex`](lib/layouts/brand.ex) and [`extra/images/logo.svg`](extra/images/logo.svg); titles in [`lib/layouts/root_layout.ex`](lib/layouts/root_layout.ex).
- **Themes:** overlay **all allowed keys** per theme in [`config/config.exs`](config/config.exs) (`seeds`, `colors.light` / `colors.dark`, `dimensions.radius`, `dimensions.font`, `typography`) plus top-level `scales:`. Contrast stays calculated; `*_scale` / duration / opacity keys are rejected. Then `mix corex.design.build`. [`lib/soonex/theme.ex`](lib/soonex/theme.ex) must list the same ids as `data-theme`.
- **Accessibility:** Corex `--a11y` dialog in the demo FAB ([`lib/soonex/accessibility.ex`](lib/soonex/accessibility.ex)). Preferences live in `localStorage` (`phx:a11y`); `corex_design` must stay a **runtime** dep.
- **Fonts:** self-hosted woff2 in [`extra/fonts/`](extra/fonts/), faces in [`assets/css/fonts.css`](assets/css/fonts.css). Stacks follow Corex 0.2 (neo = Outfit + Manrope; uno/duo/leo keep their Corex families).
- **Chrome:** sticky header in [`lib/layouts/root/nav.ex`](lib/layouts/root/nav.ex); condensed + countdown `hidden`/`inert` in [`assets/js/landing-scroll-chrome.js`](assets/js/landing-scroll-chrome.js). [`assets/css/hosts.css`](assets/css/hosts.css) is after `corex.css`. No token opacity (`bg-surface/90`).
- **Content:** home sections in [`lib/pages/home/`](lib/pages/home/), composed by [`lib/pages/home_page.ex`](lib/pages/home_page.ex). Band skeletons live in [`lib/layouts/section.ex`](lib/layouts/section.ex) (`:open`, `:editorial`, `:sticky`). FAQ is the sticky split. Anchors: `#product`, `#notes`, `#themes`, `#log`, `#questions`, `#waitlist`.
- **Log:** index at [`/blog`](lib/pages/blog_index_page.ex) (`layout_heading`, list, pagination); posts under [`_posts/`](_posts/) with `Soonex.PostLayout`; tags at [`/tags`](lib/pages/tags_index_page.ex).
- **Posts / data:** [`_posts/`](_posts/), [`_data/`](_data/), optional `title` / `description` in YAML.

MDX-style Tableau extras (tags, `include_dir`, sitemap) are summarized in **Tableau data, tags, and static extras** in the longer notes below.

## Rename this template

1. Commit or branch (no undo).
2. From the repo root: `mix project.rename your_otp_app` (snake_case). See [`lib/mix/tasks/project.rename.ex`](lib/mix/tasks/project.rename.ex).
3. Run `mix format` and `mix compile`.
4. **`_posts/*.md`:** only the YAML `layout:` line is rewritten; post bodies stay as-is.

## Corex assets and JS

- `assets/js/site.js` imports `corex/*`; Esbuild resolves via **`NODE_PATH`** including `deps` ([`config/config.exs`](config/config.exs)).
- Run **`mix corex.design.build`** after upgrading Corex / changing `config :corex_design`.
- Generated CSS lives under `assets/corex/` (gitignored).
- Client UI: [`assets/js/theme.js`](assets/js/theme.js), [`assets/js/mode.js`](assets/js/mode.js), a11y head script; header condensed + countdown in [`assets/js/landing-scroll-chrome.js`](assets/js/landing-scroll-chrome.js) (`hidden` + `inert` until past the hero sentinel).

## Production and hosting

- GitHub Actions: [`.github/workflows/deploy.yml`](.github/workflows/deploy.yml) publishes Pages **only after CI succeeds** on a **push to `main`**. In the repo, set Pages **Source** to **GitHub Actions**.
- Clear `_site/` when permalinks change (`rm -rf _site`) so stale paths are not published.
- **404:** [`lib/pages/not_found_page.ex`](lib/pages/not_found_page.ex) emits `_site/404.html` for static hosts. `mix tableau.server` 404 behavior is still Tableau’s default.

## Tableau data, tags, and static extras

- **`@data`:** YAML (etc.) under [`_data/`](_data/) merged into the page assigns (e.g. `@data["facts"]["headline"]`).
- **Tags:** enabled in [`config/config.exs`](config/config.exs); index at **`/tags`** via [`lib/pages/tags_index_page.ex`](lib/pages/tags_index_page.ex).
- **Static passthrough:** [`static/`](static/) via `include_dir` on `config :tableau, :config`.
- **Sitemap:** optional `sitemap:` on `use Tableau.Page` or in post front matter.

## Drafts

Drafts and WIP live in `_drafts` and `_wip` (see `config/dev.exs` / `config/prod.exs`).
