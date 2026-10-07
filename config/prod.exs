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

asset_version =
  case System.get_env("GITHUB_SHA") do
    sha when is_binary(sha) and sha != "" -> String.slice(sha, 0, 12)
    _ -> Integer.to_string(System.os_time(:second))
  end

config :soonex, :public_path_prefix, public_path_prefix
config :soonex, :asset_version, asset_version
config :tableau, :config, url: site_url
config :tableau, Tableau.PostExtension, future: false, dir: ["_posts"]
config :tableau, Tableau.PageExtension, dir: ["_pages"]
