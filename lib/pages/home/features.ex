defmodule Soonex.HomePage.Features do
  @moduledoc false

  use Phoenix.Component

  alias Soonex.Layouts.Shell

  def features(assigns) do
    ~H"""
    <section
      id="capabilities"
      data-section="capabilities"
      class={"#{Shell.section()} soonex-band-inverse bg-accent text-accent-contrast"}
      aria-label="Corex capabilities"
    >
      <div class={Shell.stage()}>
        <ul class={"#{Shell.column_grid()} soonex-band-inverse"}>
          <li :for={feature <- claims()} class="min-w-0">
            <h2 class="soonex-column-title text-lg font-medium tracking-tight">{feature.title}</h2>
            <p class="soonex-column-body mt-3 text-sm/6 sm:text-base/7">{feature.body}</p>
          </li>
        </ul>
      </div>
    </section>
    """
  end

  defp claims do
    [
      %{
        title: "Tokens that stay readable",
        body:
          "Light and dark palettes regenerate from seeds in config :corex_design. Ink, surfaces, and CTAs keep WCAG-friendly contrast without hand-tuned hex stacks."
      },
      %{
        title: "Static HTML, live components",
        body:
          "Tableau renders the page. Corex hooks hydrate tabs, accordions, selects, and forms — the same primitives you use in LiveView apps."
      },
      %{
        title: "Accessibility built in",
        body:
          "The demo ships Corex accessibility controls for text size, contrast, motion, focus, and link underline — persisted locally with no backend."
      }
    ]
  end
end
