defmodule Soonex.HomePage.Pricing do
  @moduledoc false

  use Phoenix.Component
  use Corex

  def pricing(assigns) do
    ~H"""
    <section
      id="pricing"
      data-soonex-pricing
      data-pricing-suffix-monthly="/mo"
      data-pricing-suffix-yearly="/yr"
      class="relative flex min-h-dvh flex-col justify-center border-y border-border bg-ui-muted px-space py-size-xl"
      aria-labelledby="soonex-pricing-heading"
      data-reveal
    >
      <div class="mx-auto flex w-full max-w-6xl flex-col gap-size">
        <div class="layout__section-intro">
          <h2 id="soonex-pricing-heading" class="text-ink-brand">
            Soonex stays free. Corex stays free. This block is a pricing example.
          </h2>
          <p>
            Soonex is MIT-licensed and will remain free to use and fork. Corex is free. Most products still need a pricing section, below is sample copy, tiers, and a billing toggle you replace with your own plans and checkout.
          </p>
        </div>

        <p class="m-0 text-center text-sm text-ink-muted">
          Demonstrates Corex Switch wiring for monthly versus yearly display, swap labels and math for your billing rules.
        </p>

        <div class="flex flex-wrap items-center justify-center gap-space-md">
          <span class="text-sm font-medium text-ink">
            Monthly billing
          </span>

          <.switch
            id="soonex-pricing-yearly"
            class="switch switch--accent switch--sm"
            on_checked_change_client="soonex-pricing-billing"
            aria_label="Toggle yearly billing with twenty percent discount"
          >
            <:label position={:post} class="text-sm text-ink-muted">
              Pay yearly (−20%)
            </:label>
          </.switch>
        </div>

        <ul class="m-0 grid list-none gap-space p-0 lg:grid-cols-3" data-stagger>
          <%= for {tier, idx} <- Enum.with_index([
                 %{
                   tier_key: "free",
                   name: "Soonex",
                   price: "$0",
                   period: "forever",
                   blurb:
                     "The template itself: fork, run setup, then ship with Tableau or Phoenix. No charge, no upsell.",
                   perks: [
                     "Corex components + token-driven styling",
                     "Assets plus static export",
                     "Palette to Tailwind v4 pipeline",
                     "_posts Markdown and RSS starter"
                   ],
                   cta_label: "Read the docs",
                   cta_to: :docs,
                   cta_external: false,
                   cta_class: "button button--ghost",
                   featured: false
                 },
                 %{
                   tier_key: "pro",
                   monthly_usd: 49,
                   name: "Example paid",
                   price: "$49",
                   period: "/mo",
                   blurb:
                     "Placeholder tier, rename, reprice, and point the button at your checkout or waitlist.",
                   perks: [
                     "Shows featured styling and monthly or yearly math",
                     "Swap perks for your product bullets",
                     "Replace CTA text and destination freely",
                     "Delete this column if you ship one price"
                   ],
                   cta_label: "Example primary CTA",
                   cta_to: "#waitlist",
                   cta_external: false,
                   cta_class: "button button--accent",
                   featured: true
                 },
                 %{
                   tier_key: "studio",
                   name: "Example custom",
                   price: "Custom",
                   period: "from $2.5k",
                   studio_from_monthly: "from $2.5k",
                   studio_from_yearly: "from $2k",
                   blurb:
                     "Placeholder for sales-led or enterprise deals, edit numbers and bullets for your motion.",
                   perks: [
                     "Illustrates custom price lines on the toggle",
                     "Use for contact sales, pilots, or quotes",
                     "Hook forms or CRM links from the button",
                     "Remove when you do not need a third tier"
                   ],
                   cta_label: "Example contact CTA",
                   cta_to: "#",
                   cta_external: false,
                   cta_class: "button button--ghost",
                   featured: false
                 }
               ]) do %>
            <li
              data-pricing-tier={tier.tier_key}
              data-monthly-usd={Map.get(tier, :monthly_usd)}
              data-studio-from-monthly={Map.get(tier, :studio_from_monthly)}
              data-studio-from-yearly={Map.get(tier, :studio_from_yearly)}
              class={[
                "relative flex min-w-0 flex-col gap-space rounded-xl border bg-layer p-size-lg",
                if(tier.featured,
                  do: "border-accent shadow-ui ring-1 ring-accent/30 lg:-translate-y-2",
                  else: "border-border"
                )
              ]}
            >
              <%= if tier.featured do %>
                <span class="badge badge--accent absolute right-space top-0 -translate-y-1/2">
                  Example highlight
                </span>
              <% end %>

              <div class="flex flex-col gap-space-sm">
                <p class="ui-label uppercase tracking-widest text-ink-muted">
                  Tier {String.pad_leading("#{idx + 1}", 2, "0")}
                </p>
                <h3>{tier.name}</h3>
                <p class="m-0">{tier.blurb}</p>
              </div>

              <%= case tier.tier_key do %>
                <% "free" -> %>
                  <div class="flex items-baseline gap-space-sm">
                    <span class="text-5xl font-extrabold tracking-tight">{tier.price}</span>
                    <span class="text-sm">{tier.period}</span>
                  </div>
                <% "pro" -> %>
                  <div class="flex items-baseline gap-space-sm">
                    <span class="text-5xl font-extrabold tracking-tight" data-pricing-price>
                      $49
                    </span>
                    <span class="text-sm" data-pricing-period>
                      /mo
                    </span>
                  </div>
                <% "studio" -> %>
                  <div class="flex items-baseline gap-space-sm">
                    <span class="text-5xl font-extrabold tracking-tight" data-pricing-price>
                      {tier.price}
                    </span>
                    <span class="text-sm" data-pricing-studio-from>{tier.period}</span>
                  </div>
                <% _ -> %>
                  <div class="flex items-baseline gap-space-sm">
                    <span class="text-5xl font-extrabold tracking-tight">{tier.price}</span>
                    <span class="text-sm">{tier.period}</span>
                  </div>
              <% end %>

              <ul class="m-0 flex list-none flex-col gap-space-sm p-0">
                <%= for perk <- tier.perks do %>
                  <li class="flex items-start gap-space-sm text-start">
                    <.heroicon name="hero-check-circle" />
                    <span class="text-sm">{perk}</span>
                  </li>
                <% end %>
              </ul>

              <.navigate
                to={if tier.cta_to == :docs, do: Soonex.Public.path("/docs"), else: tier.cta_to}
                class={["mt-auto w-full justify-center", tier.cta_class]}
                external={tier.cta_external}
              >
                {tier.cta_label}
              </.navigate>
            </li>
          <% end %>
        </ul>

        <p class="m-0 text-center text-sm text-ink-muted">
          Questions about the template or Corex? <.navigate to="#" class="link link--accent">hello@soonex.dev</.navigate>.
        </p>
      </div>
    </section>
    """
  end
end
