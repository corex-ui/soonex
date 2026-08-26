defmodule Mix.Tasks.Soonex.AssetsCheck do
  @shortdoc "Fail fast when gitignored npm packages (lenis) are missing"

  @moduledoc """
  `assets/node_modules` is gitignored. Without `npm ci` in `assets/`, esbuild
  cannot resolve `import Lenis from "lenis"` and Tailwind cannot import
  `lenis.css`. The local wrapper used to be named `assets/js/lenis.js`, which
  made esbuild suggest `./lenis` instead of the npm package.
  """

  use Mix.Task

  @impl Mix.Task
  def run(_args) do
    lenis = Path.join(File.cwd!(), "assets/node_modules/lenis")

    unless File.dir?(lenis) do
      Mix.raise("""
      Missing assets/node_modules/lenis (gitignored). Esbuild cannot resolve
      `import Lenis from "lenis"` and Tailwind cannot import lenis.css.

      From the repo root:

          mix assets.setup
          mix soonex.server
      """)
    end
  end
end
