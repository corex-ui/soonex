defmodule Mix.Tasks.Soonex.Server do
  @shortdoc "Check ports 4999/4004, then start mix tableau.server"

  @moduledoc """
  Wrapper around `mix tableau.server` that fails with a process listing when
  Tableau’s site port (4999) or Corex MCP (4004) is already bound.
  """

  use Mix.Task

  @impl Mix.Task
  def run(args) do
    Mix.Task.run("soonex.port_check", [])
    Mix.Task.run("tableau.server", args)
  end
end
