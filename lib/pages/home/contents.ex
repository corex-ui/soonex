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
      <ul class="grid grid-cols-1 gap-10 sm:grid-cols-3 sm:gap-8">
        <li :for={feature <- features()} class="flex flex-col">
          <.tooltip id={feature.tooltip_id} class="tooltip">
            <:trigger>
              <span class="display text-4xl font-semibold tracking-tight text-brand-text sm:text-5xl">
                {feature.index}
              </span>
              <span class="sr-only">{feature.title}</span>
            </:trigger>
            <:content>{feature.tip}</:content>
          </.tooltip>
          <h3 class="display mt-5 text-xl font-semibold tracking-tight text-ink">
            {feature.title}
          </h3>
          <p class="mt-3 text-sm/6 text-ink-muted sm:text-base/7">{feature.body}</p>
        </li>
      </ul>

      <div class={"#{Shell.panel()} mt-16 flex flex-col gap-4 p-6 sm:flex-row sm:items-center sm:justify-between sm:p-8"}>
        <div class="min-w-0">
          <p class={Shell.eyebrow()}>Customize in config</p>
          <pre class="mt-3 overflow-x-auto font-mono text-xs/6 text-ink sm:text-sm/6"><code>{String.trim(@theme_snippet)}</code></pre>
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
        index: "01",
        tooltip_id: "soonex-feature-tokens",
        tip: "Seeds, radius, and type live in config :corex_design",
        title: "Tokens, not a CSS fork",
        body:
          "Overlay seeds, colors, radius, and type per theme. Contrast targets stay at preset strength so axe stays green."
      },
      %{
        index: "02",
        tooltip_id: "soonex-feature-themes",
        tip: "neo is pill, uno is tight, duo is soft, leo is square",
        title: "Four themes that disagree",
        body:
          "Template Options is not a hue shift on the same gray. Radius, type, and ui-* control corners move with the palette."
      },
      %{
        index: "03",
        tooltip_id: "soonex-feature-mix",
        tip: "mix corex.design.build — no package.json for Corex",
        title: "Zero npm for Corex hooks",
        body:
          "Esbuild resolves corex/* from Mix deps. Add a component in config, rebuild CSS, lazy-hook it in site.js."
      }
    ]
  end

  defp theme_snippet do
    """
    config :corex_design,
      themes: %{
        neo: %{seeds: %{brand: "#2A4DFF"}, dimensions: %{radius: %{xl: 1.9}}}
      }
    """
    |> String.trim()
  end
end
