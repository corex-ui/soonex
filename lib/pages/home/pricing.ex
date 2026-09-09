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
    >
      <:title>
        One template. <span class="soonex-accent">Three ways to ship it.</span>
      </:title>
      <:lede>
        These tiers are placeholders you rename. The middle card is the one you keep when you fork.
      </:lede>
      <div class="soonex-plans grid grid-cols-1 gap-4 lg:grid-cols-3">
        <article
          :for={plan <- plans()}
          class={"#{plan_class(plan)} soonex-card-motion soonex-plan flex flex-col p-6 sm:p-8"}
          data-featured={if(plan.featured, do: "true")}
        >
          <p class={Shell.eyebrow()}>{plan.name}</p>
          <h3 class="display mt-2 text-xl font-semibold tracking-tight">{plan.headline}</h3>
          <p class="soonex-plan-price display mt-4 text-4xl font-semibold tracking-tight">
            {plan.price}
          </p>
          <p class="mt-3 flex-auto text-sm/6 sm:text-base/7">{plan.body}</p>
          <ul class="soonex-plan-items mt-6 flex list-none flex-col gap-2 p-0 text-sm/6">
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

  defp plan_class(%{featured: true}) do
    "soonex-frame relative overflow-hidden border"
  end

  defp plan_class(_plan), do: Shell.panel()

  defp plans do
    [
      %{
        name: "Launch",
        headline: "Fork and go live",
        price: "Open",
        featured: false,
        cta: "Join waitlist",
        body: "The waitlist landing page, countdown chrome, and a single theme you rebrand.",
        items: ["Waitlist form + toast", "Journal + RSS", "One Corex theme"]
      },
      %{
        name: "Studio",
        headline: "All four skins",
        price: "Open",
        featured: true,
        cta: "Start with Studio",
        body:
          "Switch neo, uno, duo, and leo from config. Keep the ones you like; delete the rest.",
        items: ["Four skins + dark mode", "Accessibility dialog", "Launch timeline"]
      },
      %{
        name: "Agency",
        headline: "Ship it for a client",
        price: "Open",
        featured: false,
        cta: "Join waitlist",
        body:
          "Rename the OTP app, swap the lockup, and hand over a site that already passes axe.",
        items: ["mix project.rename", "Self-hosted fonts", "GitHub Pages workflow"]
      }
    ]
  end
end
