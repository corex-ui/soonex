defmodule Soonex.WallabyStatic do
  @moduledoc false
  use Plug.Builder

  plug(TableauDevServer.IndexHtml)
  plug(Plug.Static, at: "/", from: "_site", cache_control_for_etags: "public, max-age=3600")
end

ExUnit.start(max_cases: 1, timeout: 180_000)

base_url =
  :tableau
  |> Application.fetch_env!(:config)
  |> Keyword.fetch!(:url)
  |> String.trim_trailing("/")

Application.put_env(:wallaby, :base_url, base_url)

with {:ok, _} <- Application.ensure_all_started(:wallaby),
     {:ok, _} <- Application.ensure_all_started(:soonex),
     {:ok, _} <-
       Bandit.start_link(
         plug: Soonex.WallabyStatic,
         scheme: :http,
         port: 4999,
         ip: :loopback,
         startup_log: false
       ) do
  :ok
else
  {:error, reason} ->
    raise "test_helper setup failed: #{inspect(reason)}"
end
