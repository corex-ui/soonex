defmodule Soonex.HomePage.Contents do
  @moduledoc false

  use Phoenix.Component
  use Corex

  import Soonex.Layouts.Section, only: [block: 1]

  alias Soonex.Layouts.Shell

  def contents(assigns) do
    assigns = assign(assigns, :theme_snippet, theme_snippet())

    ~H"""
    <.block
      id="principia"
      labelledby="soonex-principia-heading"
      eyebrow="Product"
      tone={:root}
    >
      <:title>
        Three reasons to <span class="text-brand-text">start here</span>
      </:title>
      <:lede>
        Each band on this page has one job. Tokens stay in config. Hooks stay in Mix.
      </:lede>
      <ul class="grid grid-cols-1 gap-8 sm:grid-cols-3">
        <li :for={feature <- features()} class="flex flex-col">
          <.tooltip id={feature.tooltip_id} class="tooltip">
            <:trigger>
              <span class="flex size-10 items-center justify-center border border-border bg-surface text-brand-text">
                <.heroicon name={feature.icon} class="size-5" />
              </span>
            </:trigger>
            <:content>{feature.tip}</:content>
          </.tooltip>
          <h3 class="display mt-5 text-xl font-semibold tracking-tight text-ink">
            {feature.title}
          </h3>
          <p class="mt-3 text-sm/6 text-ink-muted sm:text-base/7">{feature.body}</p>
        </li>
      </ul>

      <div class={"#{Shell.panel()} mt-12 flex flex-col gap-4 p-6 sm:flex-row sm:items-center sm:justify-between sm:p-8"}>
        <div>
          <p class={Shell.eyebrow()}>Customize in config</p>
          <p class="mt-2 font-mono text-sm text-ink">
            {String.trim(@theme_snippet)}
          </p>
        </div>
        <.clipboard
          id="soonex-theme-snippet"
          class="clipboard ui-brand ui-size-sm shrink-0"
          value={@theme_snippet}
          input={false}
          trigger_aria_label="Copy theme config"
        >
          <:copy>
            <.heroicon name="hero-clipboard" />
          </:copy>
          <:copied>
            <.heroicon name="hero-check" />
          </:copied>
        </.clipboard>
      </div>
    </.block>
    """
  end

  defp features do
    [
      %{
        tooltip_id: "soonex-feature-tokens",
        icon: "hero-swatch",
        tip: "Seeds and contrast live in config :corex_design",
        title: "Tokens, not hand-rolled CSS",
        body:
          "Overlay seeds, colors, radius, and type per theme. Contrast targets stay at preset strength so axe stays green."
      },
      %{
        tooltip_id: "soonex-feature-themes",
        icon: "hero-squares-2x2",
        tip: "neo, uno, duo, and leo each retint root, surface, and brand",
        title: "Four themes that actually change",
        body:
          "Template Options is not a hue shift on the same gray. Radius and type stacks move with the palette."
      },
      %{
        tooltip_id: "soonex-feature-mix",
        icon: "hero-cube",
        tip: "mix corex.design.build — no package.json for Corex",
        title: "Zero npm for Corex hooks",
        body:
          "Esbuild resolves corex/* from Mix deps. Add a component in config, rebuild CSS, lazy-hook it in site.js."
      }
    ]
  end

  defp theme_snippet do
    """
    config :corex_design, themes: %{neo: %{seeds: %{brand: "#2F4BDA"}}}
    """
    |> String.trim()
  end
end
