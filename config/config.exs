import Config

config :tableau, :reloader,
  patterns: [
    ~r"^lib/.*.ex",
    ~r"^(_posts|_pages|_data)/.*.(md|yaml|yml)",
    ~r"^assets/.*.(css|js)"
  ]

config :web_dev_utils, :reload_log, true

config :soonex, :public_path_prefix, ""

config :esbuild,
  version: "0.25.5",
  default: [
    args: ~w(js/site.js --bundle --format=esm --splitting --target=es2022 --outdir=../_site/js),
    cd: Path.expand("../assets", __DIR__),
    env: %{
      "NODE_PATH" =>
        [
          Path.expand("../deps", __DIR__),
          Path.expand("../node_modules", __DIR__)
        ]
        |> Enum.join(":")
    }
  ]

config :tailwind,
  version: "4.1.0",
  default: [
    args: ~w(
    --input=assets/css/site.css
    --output=_site/css/site.css
    )
  ]

if Mix.env() == :dev do
  config :tableau, :assets,
    tailwind: {Tailwind, :install_and_run, [:default, ~w(--watch)]},
    esbuild: {Esbuild, :install_and_run, [:default, ~w(--watch)]}
end

config :tableau, :config,
  url: "http://localhost:4999",
  include_dir: Path.expand("../extra", __DIR__),
  converters: [md: Soonex.MDExConverter],
  markdown: [
    mdex: [
      extension: [
        table: true,
        header_id_prefix: "",
        tasklist: true,
        strikethrough: true,
        autolink: true,
        alerts: true,
        footnotes: true
      ],
      render: [unsafe: true],
      syntax_highlight: nil
    ]
  ]

config :tableau, Tableau.PageExtension, enabled: true
config :tableau, Tableau.PostExtension, enabled: true
config :tableau, Tableau.DataExtension, enabled: true
config :tableau, Tableau.SitemapExtension, enabled: true

config :tableau, Tableau.TagExtension,
  enabled: true,
  layout: Soonex.TagLayout,
  permalink: "/tags",
  tags: %{}

config :tableau, Tableau.RSSExtension,
  enabled: true,
  title: "Soonex",
  description:
    "Tableau + Corex launch template: waitlist, countdown, and themes you customize in config."

config :elixir, :time_zone_database, Tz.TimeZoneDatabase

config :corex_design,
  output: "assets/corex",
  default_theme: :neo,
  default_mode: :light,
  # Preset ids with seed/radius overlays. Contrast tokens stay calculated.
  # Empty map `%{}` keeps a preset unchanged. Host overlays cannot set *scale keys
  # (radius_scale, space_scale, …); per-theme radius uses dimensions.radius steps.
  # See Corex.Design.Theme.Validator.
  themes: %{
    neo: %{
      seeds: %{brand: "#2F4BDA"},
      dimensions: %{
        radius: %{sm: 0.5, md: 0.8, lg: 1.05, xl: 1.3}
      }
    },
    uno: %{
      seeds: %{brand: "#0F766E"}
    },
    duo: %{
      seeds: %{brand: "#6D28D9"}
    },
    leo: %{
      seeds: %{brand: "#C2410C"}
    }
  },
  modes: [:light, :dark],
  scales: [],
  components: [
    :toast,
    :typo,
    :"layout-heading",
    :icon,
    :button,
    :link,
    :badge,
    :code,
    :clipboard,
    :tooltip,
    :select,
    :tabs,
    :toggle,
    :"toggle-group",
    :dialog,
    :menu,
    :"native-input",
    :checkbox,
    :"data-list",
    :timer,
    :marquee,
    :accordion,
    :avatar,
    :"floating-panel",
    :scrollbar
  ],
  semantics: [:accent, :brand, :alert, :info, :success],
  accessibility: true

config :phoenix, json_library: Jason

import_config "#{Mix.env()}.exs"
