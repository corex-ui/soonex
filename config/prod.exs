import Config

site_url =
  case System.get_env("SOONEX_PUBLIC_URL") do
    url when is_binary(url) and url != "" -> url
    _ -> "https://corex-ui.github.io/soonex"
  end

public_path_prefix =
  site_url
  |> URI.parse()
  |> Map.get(:path)
  |> case do
    nil -> ""
    "/" -> ""
    p -> String.trim_trailing(p, "/")
  end

config :soonex, :public_path_prefix, public_path_prefix
config :tableau, :config, url: site_url
config :tableau, Tableau.PostExtension, future: false, dir: ["_posts"]
config :tableau, Tableau.PageExtension, dir: ["_pages"]
