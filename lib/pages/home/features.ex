defmodule Soonex.HomePage.Features do
  @moduledoc false

  use Phoenix.Component
  use Corex

  import Soonex.Layouts.Section, only: [block: 1]

  alias Soonex.Layouts.Shell

  def features(assigns) do
    ~H"""
    <.block
      id="features"
      section="features"
      labelledby="soonex-features-heading"
      eyebrow="Product"
      tone={:root}
      align={:center}
    >
      <:title>
        Corex components with contrast you can trust.
      </:title>
      <:lede>
        Tokens, modes, and accessibility are solved in config — not in one-off CSS. Customize seeds,
        radius, and typography, then ship the same markup in light and dark.
      </:lede>
      <ul class="grid grid-cols-1 gap-6 sm:grid-cols-2 lg:grid-cols-3">
        <li :for={feature <- claims()} class={Shell.panel()}>
          <span class="inline-flex size-10 items-center justify-center rounded-lg bg-ui text-brand-text">
            <.heroicon name={feature.icon} class="size-5" />
          </span>
          <h3 class="display mt-5 text-xl font-semibold tracking-tight text-ink">
            {feature.title}
          </h3>
          <p class="mt-3 text-sm/6 text-ink-muted sm:text-base/7">{feature.body}</p>
        </li>
      </ul>
    </.block>
    """
  end

  defp claims do
    [
      %{
        icon: "hero-swatch",
        title: "Design tokens that stay readable",
        body:
          "Light and dark palettes are generated from seeds in config :corex_design. Brand, accent, and ink keep WCAG-friendly contrast without hand-tuned hex stacks."
      },
      %{
        icon: "hero-command-line",
        title: "Phoenix UI without the app server",
        body:
          "Tableau renders static HTML. Corex hooks hydrate selects, tabs, accordions, and forms on the client — the same components you use in LiveView apps."
      },
      %{
        icon: "hero-heart",
        title: "Accessibility built in",
        body:
          "The demo ships Corex accessibility controls: text size, contrast, motion, focus, and link underline — persisted locally with no backend."
      }
    ]
  end
end
