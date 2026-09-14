defmodule Soonex.HomePage.Pricing do
  @moduledoc false

  use Phoenix.Component
  use Corex

  import Soonex.Layouts.Section, only: [block: 1]

  alias Soonex.Layouts.Shell

  def pricing(assigns) do
    ~H"""
    <.block
      id="pricing"
      section="pricing"
      labelledby="soonex-pricing-heading"
      eyebrow="Plans"
      tone={:root}
      align={:center}
    >
      <:title>
        Start free. Scale when you ship.
      </:title>
      <:lede>
        Placeholder tiers you can rename for your product. The middle option is the default fork
        path for teams who want the full template.
      </:lede>
      <div class="grid grid-cols-1 gap-6 lg:grid-cols-3">
        <article
          :for={plan <- plans()}
          class={"#{plan_class(plan)} soonex-plan flex flex-col p-6 sm:p-8"}
          data-featured={if(plan.featured, do: "true")}
        >
          <p class={Shell.eyebrow()}>{plan.name}</p>
          <h3 class="display mt-2 text-xl font-semibold tracking-tight">{plan.headline}</h3>
          <p class="display mt-4 text-4xl font-semibold tracking-tight">{plan.price}</p>
          <p class="mt-3 flex-auto text-sm/6 sm:text-base/7">{plan.body}</p>
          <ul class="mt-6 flex list-none flex-col gap-2 p-0 text-sm/6">
            <li :for={item <- plan.items} class="flex items-start gap-2">
              <.heroicon name="hero-check" class="mt-0.5 size-4 shrink-0" />
              <span>{item}</span>
            </li>
          </ul>
          <.navigate
            to="#waitlist"
            class={
              if plan.featured,
                do: "button ui-size-md mt-8 w-full bg-root text-ink",
                else: "button ui-brand ui-solid ui-size-md mt-8 w-full"
            }
          >
            {plan.cta}
          </.navigate>
        </article>
      </div>
    </.block>
    """
  end

  defp plan_class(%{featured: true}), do: Shell.frame()
  defp plan_class(_plan), do: Shell.panel()

  defp plans do
    [
      %{
        name: "Launch",
        headline: "Fork and customize",
        price: "Open",
        featured: false,
        cta: "Join waitlist",
        body: "Waitlist landing, journal, and light/dark modes with Corex tokens.",
        items: ["Waitlist + toast demo", "Journal + tags", "GitHub Pages workflow"]
      },
      %{
        name: "Studio",
        headline: "Full template",
        price: "Open",
        featured: true,
        cta: "Start with Studio",
        body: "Everything in Launch plus accessibility controls and richer form fields.",
        items: ["Corex a11y dialog", "Tabs, accordion, selects", "mix project.rename task"]
      },
      %{
        name: "Team",
        headline: "Ship for clients",
        price: "Open",
        featured: false,
        cta: "Join waitlist",
        body: "Hand off a static site that already passes axe and documents customization in README.",
        items: ["Self-hosted fonts", "Config-driven theming", "Tableau + Corex docs linked"]
      }
    ]
  end
end
