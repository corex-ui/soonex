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
    "Soonex ships 1 September — waitlist, shipping log, countdown, and four looks for client review."

config :elixir, :time_zone_database, Tz.TimeZoneDatabase

l = fn lightness, seed ->
  %{kind: :l, seed: seed, l: lightness}
end

fill = fn lightness, seed ->
  %{
    kind: :l,
    seed: seed,
    l: lightness,
    states: %{
      muted: min(lightness + 0.03, 1.0),
      default: lightness,
      hover: max(lightness - 0.04, 0.0),
      active: max(lightness - 0.07, 0.0)
    }
  }
end

contrast = fn seed, against, target ->
  %{kind: :contrast, seed: seed, against: against, target: target * 1.0}
end

# Host color maps replace the preset mode (resolved_spec?/1). Keep *-contrast and
# *-text so solid brand/accent buttons stay readable. Do not lower these targets.
with_on = fn colors ->
  colors
  |> Map.merge(%{
    alert: fill.(0.44, :alert),
    info: fill.(0.4, :info),
    success: fill.(0.38, :success)
  })
  |> Map.merge(%{
    "accent-contrast" => contrast.(:neutral, :accent, 9.5),
    "brand-contrast" => contrast.(:neutral, :brand, 9.5),
    "alert-contrast" => contrast.(:neutral, :alert, 9.5),
    "info-contrast" => contrast.(:neutral, :info, 9.5),
    "success-contrast" => contrast.(:neutral, :success, 9.5),
    "accent-text" => contrast.(:accent, :root, 4.6),
    "brand-text" => contrast.(:brand, :root, 4.6),
    "alert-text" => contrast.(:alert, :root, 4.6),
    "info-text" => contrast.(:info, :root, 4.6),
    "success-text" => contrast.(:success, :root, 4.6)
  })
end

config :corex_design,
  output: "assets/corex",
  default_theme: :neo,
  default_mode: :light,
  # Host overlays cannot set *_scale / duration / opacity. See Theme.Validator.
  # Contrast targets stay at or above preset strength so the solver and axe stay green.
  themes: %{
    neo: %{
      seeds: %{
        neutral: "#EEF1F6",
        accent: "#070A10",
        brand: "#155EEF",
        alert: "#B42318",
        info: "#0E7490",
        success: "#15803D"
      },
      colors: %{
        light:
          with_on.(%{
            root: l.(0.99, :neutral),
            surface: l.(0.955, :neutral),
            ui: fill.(0.9, :neutral),
            accent: fill.(0.16, :accent),
            brand: fill.(0.48, :brand),
            ink: contrast.(:accent, :root, 13),
            "ink-muted": contrast.(:accent, :root, 6.4),
            link: contrast.(:brand, :root, 5.8),
            border: contrast.(:neutral, :ui, 1.35),
            focus: contrast.(:brand, :ui, 2.5),
            shadow: contrast.(:accent, :root, 1.15)
          }),
        dark:
          with_on.(%{
            root: l.(0.045, :accent),
            surface: l.(0.085, :accent),
            ui: fill.(0.14, :accent),
            accent: fill.(0.55, :accent),
            brand: fill.(0.5, :brand),
            ink: contrast.(:neutral, :root, 14),
            "ink-muted": contrast.(:neutral, :root, 7.0),
            link: contrast.(:brand, :root, 6.5),
            border: contrast.(:neutral, :ui, 1.4),
            focus: contrast.(:brand, :ui, 2.55),
            shadow: contrast.(:accent, :root, 1.2)
          })
      },
      dimensions: %{
        radius: %{
          xs: 0.2,
          sm: 0.4,
          md: 0.7,
          lg: 1.0,
          xl: 1.35,
          "2xl": 1.7,
          "3xl": 2.2,
          "4xl": 2.8,
          full: 9999
        },
        font: %{
          sans: ["Manrope", "ui-sans-serif", "system-ui", "sans-serif"],
          display: ["Outfit", "ui-sans-serif", "system-ui", "sans-serif"],
          mono: ["JetBrains Mono", "ui-monospace", "monospace"],
          code: ["JetBrains Mono", "ui-monospace", "monospace"],
          serif: ["ui-serif", "Georgia", "serif"]
        }
      },
      typography: %{
        "h1" => %{
          font_family: {:font, :display},
          font_weight: {:weight, :bold},
          letter_spacing: {:tracking, :tighter},
          font_size: {:text, :"5xl"},
          sm: %{font_size: {:text, :"6xl"}},
          lg: %{font_size: {:text, :"8xl"}}
        },
        "h2" => %{
          font_family: {:font, :display},
          font_weight: {:weight, :bold},
          letter_spacing: {:tracking, :tight},
          font_size: {:text, :"4xl"},
          sm: %{font_size: {:text, :"5xl"}}
        },
        "h3" => %{
          font_family: {:font, :display},
          font_weight: {:weight, :semibold},
          font_size: {:text, :xl}
        },
        "h4" => %{font_family: {:font, :sans}, font_weight: {:weight, :semibold}},
        "p" => %{line_height: {:leading, :relaxed}},
        "p.lede" => %{
          font_size: {:text, :lg},
          line_height: {:leading, :relaxed},
          color: "var(--color-ink-muted)"
        },
        "small.eyebrow" => %{
          font_weight: {:weight, :semibold},
          font_size: {:text, :sm},
          letter_spacing: {:tracking, :wide},
          color: "var(--color-brand-text)"
        },
        "blockquote" => %{font_family: {:font, :display}, font_weight: {:weight, :semibold}},
        "code" => %{font_family: {:font, :mono}},
        "kbd" => %{font_family: {:font, :mono}}
      }
    },
    uno: %{
      seeds: %{
        neutral: "#E8F0ED",
        accent: "#021A16",
        brand: "#0D9488",
        alert: "#B91C1C",
        info: "#0369A1",
        success: "#166534"
      },
      colors: %{
        light:
          with_on.(%{
            root: l.(0.97, :neutral),
            surface: l.(0.94, :neutral),
            ui: fill.(0.9, :neutral),
            accent: fill.(0.22, :accent),
            brand: fill.(0.4, :brand),
            ink: contrast.(:accent, :root, 11),
            "ink-muted": contrast.(:accent, :root, 5.8),
            link: contrast.(:brand, :root, 6.0),
            border: contrast.(:neutral, :ui, 1.28),
            focus: contrast.(:brand, :ui, 2.35),
            shadow: contrast.(:accent, :root, 1.08)
          }),
        dark:
          with_on.(%{
            root: l.(0.05, :accent),
            surface: l.(0.095, :accent),
            ui: fill.(0.155, :accent),
            accent: fill.(0.55, :accent),
            brand: fill.(0.55, :brand),
            ink: contrast.(:neutral, :root, 13),
            "ink-muted": contrast.(:neutral, :root, 6.5),
            link: contrast.(:brand, :root, 7.2),
            border: contrast.(:neutral, :ui, 1.35),
            focus: contrast.(:brand, :ui, 2.4),
            shadow: contrast.(:accent, :root, 1.16)
          })
      },
      dimensions: %{
        radius: %{
          xs: 0,
          sm: 0.02,
          md: 0.05,
          lg: 0.1,
          xl: 0.16,
          "2xl": 0.24,
          "3xl": 0.32,
          "4xl": 0.4,
          full: 9999
        },
        font: %{
          sans: ["DM Sans", "ui-sans-serif", "system-ui", "sans-serif"],
          display: ["Sora", "ui-sans-serif", "system-ui", "sans-serif"],
          mono: ["JetBrains Mono", "ui-monospace", "monospace"],
          code: ["JetBrains Mono", "ui-monospace", "monospace"],
          serif: ["ui-serif", "Georgia", "serif"]
        }
      },
      typography: %{
        "h1" => %{
          font_family: {:font, :display},
          font_weight: {:weight, :semibold},
          letter_spacing: {:tracking, :tighter},
          font_size: {:text, :"4xl"},
          sm: %{font_size: {:text, :"5xl"}},
          lg: %{font_size: {:text, :"6xl"}}
        },
        "h2" => %{
          font_family: {:font, :display},
          font_weight: {:weight, :semibold},
          letter_spacing: {:tracking, :tighter},
          font_size: {:text, :"3xl"},
          sm: %{font_size: {:text, :"4xl"}}
        },
        "h3" => %{
          font_family: {:font, :display},
          font_weight: {:weight, :medium},
          letter_spacing: {:tracking, :tight}
        },
        "h4" => %{font_weight: {:weight, :medium}, letter_spacing: {:tracking, :tight}},
        "p" => %{line_height: {:leading, :snug}},
        "p.lede" => %{
          font_size: {:text, :base},
          line_height: {:leading, :snug},
          letter_spacing: {:tracking, :tight},
          color: "var(--color-ink-muted)"
        },
        "small.eyebrow" => %{
          font_weight: {:weight, :medium},
          font_size: {:text, :xs},
          letter_spacing: {:tracking, :widest},
          text_transform: "uppercase",
          color: "var(--color-brand-text)"
        },
        "blockquote" => %{font_style: :italic},
        "code" => %{font_family: {:font, :mono}},
        "kbd" => %{font_family: {:font, :mono}}
      }
    },
    duo: %{
      seeds: %{
        neutral: "#F3EDE6",
        accent: "#2A140C",
        brand: "#C2410C",
        alert: "#9F1239",
        info: "#3D5278",
        success: "#3F6B4E"
      },
      colors: %{
        light:
          with_on.(%{
            root: l.(0.98, :neutral),
            surface: l.(0.95, :neutral),
            ui: fill.(0.91, :neutral),
            accent: fill.(0.28, :accent),
            brand: fill.(0.46, :brand),
            ink: contrast.(:accent, :root, 10),
            "ink-muted": contrast.(:accent, :root, 5.4),
            link: contrast.(:brand, :root, 5.8),
            border: contrast.(:neutral, :ui, 1.22),
            focus: contrast.(:brand, :ui, 2.2),
            shadow: contrast.(:accent, :root, 1.3)
          }),
        dark:
          with_on.(%{
            root: l.(0.06, :accent),
            surface: l.(0.11, :accent),
            ui: fill.(0.18, :accent),
            accent: fill.(0.52, :accent),
            brand: fill.(0.58, :brand),
            ink: contrast.(:neutral, :root, 12.5),
            "ink-muted": contrast.(:neutral, :root, 6.4),
            link: contrast.(:brand, :root, 7.2),
            border: contrast.(:neutral, :ui, 1.25),
            focus: contrast.(:brand, :ui, 2.35),
            shadow: contrast.(:accent, :root, 1.35)
          })
      },
      dimensions: %{
        radius: %{
          xs: 1.0,
          sm: 1.6,
          md: 2.4,
          lg: 3.2,
          xl: 4.2,
          "2xl": 5.4,
          "3xl": 7.0,
          "4xl": 9.0,
          full: 9999
        },
        font: %{
          sans: ["Work Sans", "ui-sans-serif", "system-ui", "sans-serif"],
          display: ["Playfair Display", "Georgia", "serif"],
          mono: ["JetBrains Mono", "ui-monospace", "monospace"],
          code: ["JetBrains Mono", "ui-monospace", "monospace"],
          serif: ["Playfair Display", "Georgia", "serif"]
        }
      },
      typography: %{
        "h1" => %{
          font_family: {:font, :display},
          font_weight: {:weight, :bold},
          letter_spacing: {:tracking, :tight},
          font_size: {:text, :"5xl"},
          sm: %{font_size: {:text, :"6xl"}},
          lg: %{font_size: {:text, :"8xl"}}
        },
        "h2" => %{
          font_family: {:font, :display},
          font_weight: {:weight, :semibold},
          font_size: {:text, :"4xl"},
          sm: %{font_size: {:text, :"5xl"}}
        },
        "h3" => %{font_family: {:font, :display}},
        "h4" => %{font_family: {:font, :serif}, font_weight: {:weight, :medium}},
        "p" => %{line_height: {:leading, :relaxed}},
        "p.lede" => %{
          font_family: {:font, :serif},
          font_style: :italic,
          font_size: {:text, :xl},
          line_height: {:leading, :relaxed},
          color: "var(--color-ink-muted)"
        },
        "small.eyebrow" => %{
          font_family: {:font, :sans},
          font_weight: {:weight, :semibold},
          letter_spacing: {:tracking, :wide},
          color: "var(--color-brand-text)"
        },
        "blockquote" => %{font_family: {:font, :serif}, font_style: :italic},
        "code" => %{font_family: {:font, :mono}},
        "kbd" => %{font_family: {:font, :mono}}
      }
    },
    leo: %{
      seeds: %{
        neutral: "#F0EEE9",
        accent: "#0A0A0A",
        brand: "#F97316",
        alert: "#C41E1E",
        info: "#0369A1",
        success: "#166534"
      },
      colors: %{
        light:
          with_on.(%{
            root: l.(0.985, :neutral),
            surface: l.(0.955, :neutral),
            ui: fill.(0.91, :neutral),
            accent: fill.(0.1, :accent),
            brand: fill.(0.45, :brand),
            ink: contrast.(:accent, :root, 13),
            "ink-muted": contrast.(:accent, :root, 6.0),
            link: contrast.(:brand, :root, 6.0),
            border: contrast.(:accent, :ui, 1.4),
            focus: contrast.(:brand, :ui, 2.6),
            shadow: contrast.(:accent, :root, 1.05)
          }),
        dark:
          with_on.(%{
            root: l.(0.03, :accent),
            surface: l.(0.07, :accent),
            ui: fill.(0.13, :accent),
            accent: fill.(0.5, :accent),
            brand: fill.(0.52, :brand),
            ink: contrast.(:neutral, :root, 14.5),
            "ink-muted": contrast.(:neutral, :root, 7.0),
            link: contrast.(:brand, :root, 7.4),
            border: contrast.(:neutral, :ui, 1.5),
            focus: contrast.(:brand, :ui, 2.7),
            shadow: contrast.(:accent, :root, 1.08)
          })
      },
      dimensions: %{
        radius: %{
          xs: 0,
          sm: 0,
          md: 0,
          lg: 0,
          xl: 0,
          "2xl": 0,
          "3xl": 0,
          "4xl": 0,
          full: 9999
        },
        font: %{
          sans: ["IBM Plex Sans", "ui-sans-serif", "system-ui", "sans-serif"],
          display: ["IBM Plex Sans", "ui-sans-serif", "system-ui", "sans-serif"],
          mono: ["IBM Plex Mono", "ui-monospace", "monospace"],
          code: ["IBM Plex Mono", "ui-monospace", "monospace"],
          serif: ["ui-serif", "Georgia", "serif"]
        }
      },
      typography: %{
        "h1" => %{
          font_weight: {:weight, :bold},
          letter_spacing: {:tracking, :tighter},
          font_size: {:text, :"5xl"},
          text_transform: "uppercase",
          sm: %{font_size: {:text, :"6xl"}},
          lg: %{font_size: {:text, :"8xl"}}
        },
        "h2" => %{
          font_weight: {:weight, :bold},
          letter_spacing: {:tracking, :tight},
          font_size: {:text, :"4xl"},
          text_transform: "uppercase",
          sm: %{font_size: {:text, :"5xl"}}
        },
        "h3" => %{font_weight: {:weight, :medium}, text_transform: "uppercase"},
        "h4" => %{
          font_weight: {:weight, :medium},
          letter_spacing: {:tracking, :widest},
          font_size: {:text, :sm},
          text_transform: "uppercase"
        },
        "p" => %{line_height: {:leading, :snug}},
        "p.lede" => %{
          font_size: {:text, :lg},
          line_height: {:leading, :snug},
          color: "var(--color-ink-muted)"
        },
        "small.eyebrow" => %{
          font_weight: {:weight, :medium},
          font_size: {:text, :xs},
          letter_spacing: {:tracking, :widest},
          text_transform: "uppercase",
          color: "var(--color-brand-text)"
        },
        "blockquote" => %{font_weight: {:weight, :semibold}},
        "code" => %{font_family: {:font, :mono}},
        "kbd" => %{font_family: {:font, :mono}}
      }
    }
  },
  modes: [:light, :dark],
  scales: [
    space: [xs: 1, sm: 2, md: 3, lg: 5, xl: 6],
    size: [xs: 6, sm: 8, md: 11, lg: 13, xl: 15],
    text: [md: 1.02, lg: 1.15, xl: 1.28, "2xl": 1.55],
    weight: [normal: 400, medium: 500, semibold: 600, bold: 700]
  ],
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
    :scrollbar,
    :pagination,
    :carousel,
    :switch,
    :"data-table",
    :collapsible,
    :"radio-group",
    :"tags-input",
    :"number-input",
    :"date-picker"
  ],
  semantics: [:accent, :brand, :alert, :info, :success],
  accessibility: true

config :phoenix, json_library: Jason

import_config "#{Mix.env()}.exs"
