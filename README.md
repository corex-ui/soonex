# Soonex

Soonex is a launch page kit for Phoenix teams. It builds a coming-soon site as static HTML with [Tableau](https://github.com/elixir-tools/tableau), styles it with [Corex](https://hexdocs.pm/corex) design tokens, and hydrates accessible Corex components in the browser.

**Live demo:** [corex-ui.github.io/soonex](https://corex-ui.github.io/soonex)

There is also a multi-locale variant: [corex-ui/soonex_i18n](https://github.com/corex-ui/soonex_i18n).

## Features

- **Landing page:** hero with launch countdown, tech marquee, live component preview, capabilities grid, workflow tabs, proof section, journal highlights, FAQ, and a closing waitlist band.
- **Four themes:** `neo`, `uno`, `duo`, and `leo`, each with light and dark modes generated from color seeds in `config :corex_design`. Visitors can switch them in **Template Options**.
- **Waitlist form:** email, role select, and opt-in switch with toast feedback. It stores nothing until you connect a provider.
- **Journal:** Markdown posts with cover images, tags, RSS (`/feed.xml`), sitemap, and pagination.
- **Accessibility panel:** text size, contrast, motion, focus ring, and link underline, saved in the visitor's browser.
- **Cookie consent and privacy page:** optional categories stay off unless the visitor allows them.
- **No Node toolchain:** Tailwind v4 and esbuild run as Mix tasks. There is no `package.json`.

## Requirements

- Erlang/OTP 28 and Elixir 1.19 (pinned in [`.tool-versions`](.tool-versions); the project supports Elixir `~> 1.17` and CI also runs 1.17 and 1.18)
- Hex packages `corex`, `corex_design`, and `corex_mcp` at `~> 0.2`
- Linux only: `inotify-tools` for live reload in the dev server
- For `mix test`: Google Chrome and a matching `chromedriver`

## Quick start

```shell
git clone https://github.com/corex-ui/soonex.git
cd soonex
mix setup
mix server
```

Open [http://localhost:4999](http://localhost:4999). The dev server watches `lib/`, `_posts/`, `_data/`, and `assets/` and reloads on change.

In development, Corex MCP also runs at `http://localhost:4004/corex/mcp`. See [`.cursor/mcp.json`](.cursor/mcp.json) for an editor configuration example.

## Commands

| Command | What it does |
| --- | --- |
| `mix setup` | Fetch dependencies and build Corex design CSS |
| `mix server` | Check that ports 4999 and 4004 are free, then start the Tableau dev server |
| `mix assets.build` | Rebuild Corex design CSS, Tailwind, and esbuild output |
| `mix corex.design.build` | Regenerate design tokens and component CSS after changing `config :corex_design` |
| `MIX_ENV=prod mix build` | Production build into `_site/` with minified CSS and JavaScript |
| `mix test` | Build the site, then run the Wallaby axe accessibility check on the home page |
| `mix credo` | Lint |
| `mix soonex.gen.post My title` | Create a new post in `_posts/` |

## Project structure

```text
config/config.exs        Tableau, Tailwind, esbuild, and config :corex_design (themes)
lib/pages/home_page.ex   Home page section order
lib/pages/home/          One module per home section (hero, logos, showcase, features, ...)
lib/layouts/             Root layout, nav, footer, post layout, Shell and Section helpers
lib/soonex/launch.ex     Launch date used by the hero badge and countdown
assets/css/              Tailwind entry, fonts, and small host helpers
assets/js/site.js        Corex hook registration, theme and mode persistence, waitlist toast
extra/                   Static files copied to the site root (images, fonts, favicons)
_posts/                  Journal posts (Markdown)
test/                    Wallaby accessibility test
```

## Customizing

### Brand and SEO

- Logo lockup: [`lib/layouts/brand.ex`](lib/layouts/brand.ex) and [`extra/images/logo.svg`](extra/images/logo.svg)
- Page titles and meta descriptions: [`lib/layouts/root_layout.ex`](lib/layouts/root_layout.ex)
- Open Graph image: [`extra/images/og.svg`](extra/images/og.svg)

### Launch date

Change `@target` in [`lib/soonex/launch.ex`](lib/soonex/launch.ex). The hero badge and countdown both read it.

### Themes

Each theme in `config :corex_design` (in [`config/config.exs`](config/config.exs)) accepts `seeds`, `colors.light` and `colors.dark`, `dimensions.radius`, `dimensions.font`, and `typography`, plus top-level `scales`. After editing, run:

```shell
mix corex.design.build
```

Keep styling in Corex `ui-*` modifiers and design tokens in HEEx. [`assets/css/hosts.css`](assets/css/hosts.css) and [`assets/css/chrome.css`](assets/css/chrome.css) only hold small layout helpers.

### Home sections

Sections live in [`lib/pages/home/`](lib/pages/home/) and are composed in [`lib/pages/home_page.ex`](lib/pages/home_page.ex). Shared spacing and type classes are in [`lib/layouts/shell.ex`](lib/layouts/shell.ex), and [`lib/layouts/section.ex`](lib/layouts/section.ex) provides the `block` component with `:root`, `:surface`, `:inverse`, and `:photo` tones.

Photos live in [`extra/images/photos/`](extra/images/photos/) and post covers in [`extra/images/covers/`](extra/images/covers/).

### Waitlist

The form is in [`lib/pages/home/waitlist.ex`](lib/pages/home/waitlist.ex) and the toast in [`assets/js/waitlist.js`](assets/js/waitlist.js). Point the form at your email provider or endpoint before launch; field names are `waitlist[email]`, `waitlist[role]`, and `waitlist[notes]`.

### Journal

Posts are Markdown files in [`_posts/`](_posts/) with `layout: Soonex.PostLayout`. Front matter supports `title`, `date`, `permalink`, `description`, `image`, `image_alt`, `tags`, and `sitemap`. The post [Writing in the journal](_posts/2026-09-08-writing-in-the-journal.md) shows every supported Markdown feature. In development only, draft posts in `_drafts/` and work-in-progress pages in `_wip/` are rendered too, along with future-dated posts.

### Accessibility and cookies

The accessibility panel is configured in [`lib/soonex/accessibility.ex`](lib/soonex/accessibility.ex), and cookie consent in [`lib/soonex/cookie_consent.ex`](lib/soonex/cookie_consent.ex). Update [`lib/pages/privacy_page.ex`](lib/pages/privacy_page.ex) for your jurisdiction.

## Deploying

1. Set `SOONEX_PUBLIC_URL` to your production origin. Subpaths such as `https://example.github.io/my-launch` are supported; asset paths are prefixed automatically. Without it, builds use `https://corex-ui.github.io/soonex`.
2. Run `MIX_ENV=prod mix build`. If you changed permalinks, delete `_site/` first.
3. Publish `_site/` to any static host. [`lib/pages/not_found_page.ex`](lib/pages/not_found_page.ex) generates `404.html`.

For GitHub Pages, [`.github/workflows/deploy.yml`](.github/workflows/deploy.yml) deploys on pushes to `main` after [CI](.github/workflows/ci.yml) passes. Set **Settings > Pages > Source** to **GitHub Actions**.

## Renaming the project

1. Commit your work first; the rename cannot be undone automatically.
2. Run `mix project.rename your_app` (snake_case). See [`lib/mix/tasks/project.rename.ex`](lib/mix/tasks/project.rename.ex).
3. Run `mix format` and `mix compile`.

Only the `layout:` line in `_posts/*.md` is rewritten; post bodies are left as they are.

## Troubleshooting

**Port 4999 is already in use.** `mix server` and `mix test` both use port 4999. Find and stop the other process, then retry:

```shell
ss -ltnp 'sport = :4999'          # Linux
lsof -nP -iTCP:4999 -sTCP:LISTEN  # macOS
```

**Live reload does not work on Linux.** Install `inotify-tools` and restart the dev server.

**Wallaby cannot start a session.** Chrome and `chromedriver` must match versions. You can point at specific binaries with `WALLABY_CHROME_BINARY` and `WALLABY_CHROMEDRIVER_PATH`.

**Styles look stale after a Corex upgrade.** Run `mix corex.design.build`; generated CSS lives in `assets/corex/` (gitignored).

## Image credits

Photography is from [Unsplash](https://unsplash.com) under the [Unsplash License](https://unsplash.com/license).

| File | Photographer |
| --- | --- |
| `photos/hero.jpg` | [Andrew Kliatskyi](https://unsplash.com/@kirp) |
| `photos/texture.jpg` | [Adrien Olichon](https://unsplash.com/@adrienolichon) |
| `photos/ribbons.jpg` | [Milad Fakurian](https://unsplash.com/@fakurian) |
| `photos/closing.jpg` | [Pawel Czerwinski](https://unsplash.com/@pawel_czerwinski) |
| `covers/waves.jpg` | [Milad Fakurian](https://unsplash.com/@fakurian) |
| `covers/spectrum.jpg` | [Milad Fakurian](https://unsplash.com/@fakurian) |
| `covers/haze.jpg` | [MagicPattern](https://unsplash.com/@magicpattern) |
| `covers/dusk.jpg` | [Martin Martz](https://unsplash.com/@martz90) |
| `covers/orbit.jpg` | [Martin Martz](https://unsplash.com/@martz90) |
| `covers/current.jpg` | [Martin Martz](https://unsplash.com/@martz90) |

Tool logos in `extra/images/tech/` come from [Simple Icons](https://simpleicons.org) (CC0), except `tableau.jpg`, which is the [Tableau project](https://github.com/elixir-tools/tableau) logo.

## License

This repository does not include a license file yet. Add one before you redistribute a fork.
