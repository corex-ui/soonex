defmodule Soonex.Application do
  @moduledoc false

  use Application

  @mcp_enabled Mix.env() == :dev

  @impl true
  def start(_type, _args) do
    children =
      if @mcp_enabled do
        [{Bandit, plug: Soonex.Mcp, scheme: :http, port: 4004}]
      else
        []
      end

    opts = [strategy: :one_for_one, name: Soonex.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
