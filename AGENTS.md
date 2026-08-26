# AGENTS.md

## Cursor Cloud specific instructions

Soonex is an Elixir **Tableau** static-site generator (Corex UI components, Tailwind v4, esbuild).
There is one product: the static marketing/blog site. Standard commands live in `README.md` and
`mix.exs` aliases — prefer those; the notes below only cover non-obvious cloud gotchas.

### Toolchain activation
- The Elixir/OTP toolchain is provided by **asdf** (versions pinned in `.tool-versions`:
  Erlang 28.3.1, Elixir 1.19.5-otp-28). Node/npm come from **nvm**. Both are activated by
  `~/.bashrc`, so a normal interactive shell already has `mix` and `npm`.
- If a command reports `mix: command not found` or `npm: command not found` (e.g. in a bare
  non-login shell), activate them first:
  `. "$HOME/.asdf/asdf.sh"` and `export NVM_DIR="$HOME/.nvm"; . "$NVM_DIR/nvm.sh"`.

### Running / building
- Dev server: `mix tableau.server` → site at `http://localhost:4999` (home `/`, `/blog`, `/tags`).
  In dev it also starts Corex MCP at `http://localhost:4004/corex/mcp`. Tailwind/esbuild run in
  `--watch` mode and live-reload picks up changes to `lib/`, `_posts/`, `_data/`, `assets/`.
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
  changes won't hot-reload — restart the server after installing it.
- Port 4999 is shared by the dev server and the test harness. Stop `mix tableau.server` before
  running `mix test`, otherwise the test's Bandit server can't bind the port.
