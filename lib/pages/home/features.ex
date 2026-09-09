defmodule Soonex.HomePage.Features do
  @moduledoc false

  use Phoenix.Component
  use Corex

  import Soonex.Layouts.Section, only: [block: 1]

  def features(assigns) do
    ~H"""
    <.block
      id="features"
      section="features"
      labelledby="soonex-features-heading"
      eyebrow="Product"
      tone={:root}
    >
      <:title>
        Everything a launch site needs. <span class="soonex-accent">Nothing you have to invent.</span>
      </:title>
      <:lede>
        Themes, waitlist, journal, and accessibility are already wired. You change copy, seeds, and
        the launch date.
      </:lede>
      <ul class="soonex-claims m-0 grid list-none grid-cols-1 gap-10 p-0 sm:grid-cols-3 sm:gap-8">
        <li :for={feature <- claims()} class="soonex-claim flex flex-col">
          <span class="soonex-claim-icon" aria-hidden="true">
            <.heroicon name={feature.icon} />
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
        title: "Corex tokens, not a palette dump",
        body:
          "Light and dark both ship. Brand, accent, and ink stay readable because the design pipeline owns contrast, not a handful of hex codes in CSS."
      },
      %{
        icon: "hero-rectangle-group",
        title: "Four skins that actually differ",
        body:
          "Neo, uno, duo, and leo change chrome, density, and ornament — not just hue. Switch them from Template Options on this page."
      },
      %{
        icon: "hero-command-line",
        title: "Mix in, waitlist out",
        body:
          "mix setup then mix server. The waitlist toast is wired so you can see the success path before you attach a real list."
      }
    ]
  end
end
