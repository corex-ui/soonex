# AGENTS.md

## Cursor Cloud specific instructions

Soonex is an Elixir **Tableau** static-site generator (Corex UI components, Tailwind v4, esbuild).
There is one product: the static marketing/blog site. Standard commands live in `README.md` and
`mix.exs` aliases — prefer those; the notes below only cover non-obvious cloud gotchas.

### Toolchain activation
- Elixir/OTP versions are pinned in `.tool-versions` (Erlang 28.3.1, Elixir 1.19.5-otp-28). Use
  **mise** (`mise install`) or **asdf** if present. There is no `assets/package.json`; Node is not
  required for builds.
- If a command reports `mix: command not found` (e.g. in a bare non-login shell), activate the
  toolchain first: `eval "$(mise activate bash)"` or `. "$HOME/.asdf/asdf.sh"`.

### Running / building
- Dev server: `mix server` (alias: port check, then `tableau.server`) → site at
  `http://localhost:4999` (home `/`, `/blog`, `/tags`). In dev it also starts Corex MCP at
  `http://localhost:4004/corex/mcp`. Tailwind/esbuild run in `--watch` mode and live-reload picks
  up changes to `lib/`, `_posts/`, `_data/`, `assets/`.
- Adding a blog post = create a Markdown file under `_posts/` with `layout: Soonex.PostLayout`
  front matter; the running dev server regenerates it automatically.
- Rebuild only assets: `mix assets.build`. Production build: `MIX_ENV=prod mix build` → `_site/`.
- After changing Corex config (`config :corex_design` in `config/config.exs`) run
  `mix corex.design.build`.

### Lint / test
- Lint: `mix credo`.
- Tests: `mix test` (the `test` alias first runs `pre.test`, which builds the static site into
  `_site/`, then runs ExUnit). The only test is a **Wallaby** browser accessibility check
  (`test/soonex/home_a11y_test.exs`) that drives headless Chrome via chromedriver against a Bandit
  server on port 4999. Chrome and a matching `chromedriver` are already installed at
  `/usr/local/bin`; the suite works without setting `WALLABY_*` env vars, but you can point at them
  explicitly with `WALLABY_CHROME_BINARY` / `WALLABY_CHROMEDRIVER_PATH` if needed.
- If you upgrade Chrome, replace `/usr/local/bin/chromedriver` with the matching version from
  Chrome for Testing, or Wallaby tests will fail to start a session.

### Gotchas
- Live reload needs `inotify-tools` (installed). If the dev server logs
  `inotify-tools is needed ... fs_inotify_bootstrap_error`, the file watcher is disabled and content
  changes won't hot-reload — restart the server after installing it. `mix server` fails fast on
  Linux when `inotifywait` is missing.
- Port 4999 is shared by the dev server and the test harness. Stop `mix server` before running
  `mix test`, otherwise the test's Bandit server can't bind the port.
