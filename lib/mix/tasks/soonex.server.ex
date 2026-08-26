defmodule Mix.Tasks.Soonex.Server do
  @shortdoc "Check ports and npm assets, then start mix tableau.server"

  @moduledoc """
  Wrapper around `mix tableau.server` that fails before Tableau starts when:

  - Tableau’s site port (4999) or Corex MCP (4004) is already bound
  - `assets/node_modules/lenis` is missing (`assets/node_modules` is gitignored)
  """

  use Mix.Task

  @impl Mix.Task
  def run(args) do
    Mix.Task.run("soonex.port_check", [])
    Mix.Task.run("soonex.assets_check", [])
    Mix.Task.run("tableau.server", args)
  end
end
