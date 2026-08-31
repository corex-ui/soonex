defmodule Soonex.HomePage.Product do
  @moduledoc false

  use Phoenix.Component
  use Corex

  import Soonex.Layouts.Section, only: [block: 1]

  alias Soonex.Layouts.Shell

  def product(assigns) do
    assigns = assign(assigns, :snippet, snippet())

    ~H"""
    <.block
      id="product"
      labelledby="soonex-product-heading"
      eyebrow="Product"
      tone={:surface}
      layout={:sticky}
    >
      <:title>
        Open a panel. <span class="text-brand-text">Ship the desk.</span>
      </:title>
      <:lede>
        Waitlist, log, countdown, looks — one product UI for studios launching <span class="whitespace-nowrap">1 September</span>.
      </:lede>
      <:actions>
        <.navigate to="#waitlist" class="button ui-brand ui-solid ui-size-md">
          Join waitlist
        </.navigate>
      </:actions>

      <.tabs
        id="soonex-product-tabs"
        class="tabs ui-brand ui-size-md ui-width-full soonex-product-tabs"
        indicator
        value="overview"
      >
        <:trigger value="overview">Overview</:trigger>
        <:content value="overview" class="soonex-tab-panel">
          <div class="soonex-tab-workspace">
            <p class="lede m-0 max-w-2xl">
              Soonex is a launch workspace for studios with a hard date. Put the waitlist on the
              page, keep a public log, and review four looks with your client before go-live.
            </p>
            <ul class="soonex-feature-bullets mt-8">
              <li>Waitlist rack with toast on submit</li>
              <li>Shipping log with covers and tags</li>
              <li>Countdown aimed at 1 September</li>
              <li>Four looks switched on this device</li>
            </ul>
          </div>
        </:content>

        <:trigger value="waitlist">Waitlist</:trigger>
        <:content value="waitlist" class="soonex-tab-panel">
          <div class="soonex-tab-workspace">
            <p class="soonex-card-title m-0">Capture who is coming</p>
            <p class="lede mt-3">
              Same fields on the hero still and at the end of the page. Wire your provider after
              launch — the toast already ships.
            </p>
            <ul class="soonex-feature-bullets mt-6">
              <li>Email with validation</li>
              <li>Role select or radios</li>
              <li>Interests as tags</li>
              <li>Team size stepper</li>
              <li>Launch notes switch</li>
            </ul>
          </div>
        </:content>

        <:trigger value="log">Log</:trigger>
        <:content value="log" class="soonex-tab-panel">
          <div class="soonex-tab-workspace">
            <p class="lede m-0 max-w-2xl">
              Keep a public trail of what shipped. Posts live as Markdown with covers and tags.
            </p>
            <div class="mt-8">
              <.navigate to={Soonex.Public.path("/blog")} class="button ui-ghost ui-brand ui-size-sm">
                All shipping notes <.heroicon name="hero-arrow-up-right" />
              </.navigate>
            </div>
          </div>
        </:content>

        <:trigger value="looks">Looks</:trigger>
        <:content value="looks" class="soonex-tab-panel">
          <div class="soonex-tab-workspace">
            <p class="soonex-room-specimen m-0">Soonex</p>
            <p class="lede mt-4 max-w-xl">
              Four looks for the same launch. Switch rooms in Template Options — no second build.
            </p>
            <.navigate to="#looks" class="link ui-brand mt-6 inline-flex">
              See all four looks <.heroicon name="hero-arrow-down" />
            </.navigate>
          </div>
        </:content>
      </.tabs>

      <div class="soonex-clone-strip mt-12">
        <div class="min-w-0 lg:max-w-xs">
          <small class={Shell.eyebrow()}>Get Soonex</small>
          <p class="lede mt-2">Clone once. mix setup, then mix soonex.server.</p>
        </div>
        <.clipboard
          id="soonex-theme-snippet"
          class="clipboard ui-brand ui-solid ui-width-full ui-size-md min-w-0 flex-1"
          value={@snippet}
        >
          <:label>Clone</:label>
          <:copy>
            <.heroicon name="hero-clipboard" />
            <span>Copy</span>
          </:copy>
          <:copied>
            <.heroicon name="hero-check" />
            <span>Copied</span>
          </:copied>
        </.clipboard>
      </div>

      <div class="mt-16">
        <small class={Shell.eyebrow()}>Plans</small>
        <h3 class={"#{Shell.section_heading()} mt-2"}>
          Same core. <span class="text-brand-text">Three lanes.</span>
        </h3>
        <div class="soonex-pricing mt-8">
          <article :for={plan <- plans()} class="soonex-pricing-tier">
            <div class="flex flex-col gap-2 sm:flex-row sm:items-baseline sm:justify-between sm:gap-8">
              <div>
                <small class={Shell.eyebrow()}>{plan.name}</small>
                <h4 class={"#{Shell.card_title()} mt-1"}>{plan.headline}</h4>
                <p class="lede mt-2 max-w-xl">{plan.body}</p>
              </div>
              <.navigate to="#waitlist" class={"#{plan.cta_class} shrink-0"}>
                {plan.cta}
              </.navigate>
            </div>
            <ul class="soonex-feature-bullets mt-6">
              <li :for={item <- plan.items}>{item}</li>
            </ul>
          </article>
        </div>
      </div>
    </.block>
    """
  end

  defp plans do
    [
      %{
        name: "Solo",
        headline: "Fork and put a date on the page",
        body: "One look, the waitlist, and the log.",
        cta: "Join waitlist",
        cta_class: "button ui-ghost ui-size-sm w-fit",
        items: ["Waitlist + shipping log", "Countdown to 1 September"]
      },
      %{
        name: "Studio",
        headline: "Four looks, client review",
        body: "Treat Template Options as the review.",
        cta: "Join waitlist",
        cta_class: "button ui-brand ui-solid ui-size-sm w-fit",
        items: ["neo, uno, duo, leo", "Header timer + toast"]
      },
      %{
        name: "Agency",
        headline: "Accessible handoff",
        body: "Ship with accessibility on and a clone path the studio can run.",
        cta: "Join waitlist",
        cta_class: "button ui-ghost ui-size-sm w-fit",
        items: ["Zoom, contrast, motion", "Clone · mix setup · ship"]
      }
    ]
  end

  defp snippet, do: "git clone https://github.com/corex-ui/soonex.git"
end
