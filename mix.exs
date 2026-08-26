defmodule Soonex.MixProject do
  use Mix.Project

  def project do
    [
      app: :soonex,
      version: "0.2.1",
      elixir: "~> 1.17",
      start_permanent: Mix.env() == :prod,
      compilers: Mix.compilers() ++ [:corex_design],
      elixirc_paths: elixirc_paths(Mix.env()),
      aliases: aliases(),
      deps: deps(),
      usage_rules: usage_rules()
    ]
  end

  defp elixirc_paths(env) when env in [:dev, :test], do: ["lib", "lib_dev"]
  defp elixirc_paths(_), do: ["lib"]

  def cli do
    [preferred_envs: [test: :test]]
  end

  def application do
    [
      mod: {Soonex.Application, []},
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:tableau, "~> 0.30"},
      {:tailwind, "~> 0.3", runtime: Mix.env() == :dev},
      {:phoenix_live_view, "~> 1.0"},
      {:esbuild, "~> 0.10", runtime: Mix.env() == :dev},
      {:bandit, "~> 1.0"},
      {:heroicons,
       github: "tailwindlabs/heroicons",
       tag: "v2.2.0",
       sparse: "optimized",
       app: false,
       compile: false,
       depth: 1},
      {:corex, "~> 0.2.1"},
      {:corex_design, "~> 0.2.1", runtime: false},
      {:corex_mcp, "~> 0.2.1", only: [:dev, :test]},
      {:color, "~> 0.11"},
      {:floki, "~> 0.38"},
      {:makeup, "~> 1.2"},
      {:makeup_elixir, "~> 1.0"},
      {:makeup_eex, "~> 2.0"},
      {:makeup_html, "~> 0.2"},
      {:makeup_css, "~> 0.2"},
      {:makeup_js, "~> 0.1"},
      {:rustler_precompiled, "~> 0.9", override: true},
      {:makeup_syntect, "~> 0.1.4"},
      {:wallaby, "~> 0.30", only: :test, runtime: false},
      {:a11y_audit, "~> 0.3.1", only: :test, runtime: false},
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false},
      {:ex_slop, "~> 0.1", only: [:dev, :test], runtime: false},
      {:usage_rules, "~> 1.1", only: :dev}
    ] ++ maybe_json_polyfill()
  end

  defp usage_rules do
    [
      skills: [
        location: ".cursor/skills",
        package_skills: [:corex]
      ]
    ]
  end

  defp maybe_json_polyfill do
    if Code.ensure_loaded?(:json) do
      []
    else
      [{:json_polyfill, "~> 0.2 or ~> 1.0"}]
    end
  end

  defp aliases do
    [
      compile: ["compile"],
      setup: ["deps.get", "corex.design.build"],
      "pre.test": [
        "corex.design.build",
        "esbuild default",
        "tailwind default",
        "tableau.build"
      ],
      test: ["pre.test", "test"],
      "assets.build": [
        "corex.design.build",
        "tailwind default",
        "esbuild default"
      ],
      build: [
        "compile",
        "corex.design.build",
        "tableau.build",
        "tailwind default --minify",
        "esbuild default --minify"
      ]
    ]
  end
end
