defmodule Soonex.HomePage.Product do
  @moduledoc false

  use Phoenix.Component
  use Corex

  import Soonex.Layouts.Section, only: [block: 1]

  alias Soonex.Layouts.Shell

  def product(assigns) do
    assigns = assign(assigns, :snippet, snippet())

    ~H"""
    <.block id="product" labelledby="soonex-product-heading" eyebrow="Product" layout={:open}>
      <:title>
        The desk that ships <span class="text-brand-text">on a date</span>
      </:title>
      <:lede>
        Four instruments. Open a panel. Launch when <span class="whitespace-nowrap">1 September</span>
        hits.
      </:lede>

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
              Soonex is a launch desk for studios with a hard date. Waitlist on the page, public log,
              countdown aimed at launch, four looks for client review.
            </p>
            <ol class="soonex-instrument-list mt-10">
              <li>
                <span class="soonex-instrument-index" aria-hidden="true">01</span>
                <div>
                  <p class="m-0 font-semibold text-ink">Waitlist strip</p>
                  <p class="lede m-0 mt-1 text-sm/6">
                    Email, role, interests, team size — toast on submit.
                  </p>
                </div>
              </li>
              <li>
                <span class="soonex-instrument-index" aria-hidden="true">02</span>
                <div>
                  <p class="m-0 font-semibold text-ink">Shipping ledger</p>
                  <p class="lede m-0 mt-1 text-sm/6">
                    Markdown entries with tags. Index paginates in the browser.
                  </p>
                </div>
              </li>
              <li>
                <span class="soonex-instrument-index" aria-hidden="true">03</span>
                <div>
                  <p class="m-0 font-semibold text-ink">Honest countdown</p>
                  <p class="lede m-0 mt-1 text-sm/6">
                    Aimed at <span class="whitespace-nowrap">1 September</span> until you change it.
                  </p>
                </div>
              </li>
            </ol>
            <div class="mt-10">
              <.navigate to="#waitlist" class="button ui-brand ui-solid ui-size-md">
                Join waitlist
              </.navigate>
            </div>
          </div>
        </:content>

        <:trigger value="waitlist">Waitlist</:trigger>
        <:content value="waitlist" class="soonex-tab-panel">
          <div class="soonex-tab-workspace">
            <p class="soonex-card-title m-0">Fields on the strip</p>
            <p class="lede mt-3 max-w-2xl">
              Same instruments on the edition strip and the closing rack. Collect who is coming —
              then show a clear success path.
            </p>
            <ul class="soonex-feature-bullets mt-8">
              <li>Email with validation</li>
              <li>Role select or radios</li>
              <li>Interests as tags</li>
              <li>Team size stepper</li>
              <li>Launch notes switch</li>
            </ul>
            <p class="m-0 mt-8 text-sm/6 text-ink-muted">
              Wire your provider after launch. The toast already ships.
            </p>
          </div>
        </:content>

        <:trigger value="log">Log</:trigger>
        <:content value="log" class="soonex-tab-panel">
          <div class="soonex-tab-workspace">
            <p class="lede m-0 max-w-2xl">
              A public ledger of what shipped. Posts are Markdown with tags — rebuild and the index
              updates.
            </p>
            <article class="soonex-ledger-row mt-10">
              <span class="soonex-mono-meta">02 August 2026</span>
              <h3 class={"#{Shell.card_title()} mt-2"}>
                Accessibility on this device
              </h3>
              <p class="lede mt-3 max-w-xl">
                Zoom, contrast, motion, cursor, focus, and underline — stored on this device.
              </p>
              <.navigate
                to={Soonex.Public.path("/blog/accessibility-on-device/")}
                class="button ui-ghost ui-brand ui-size-sm mt-6 w-fit"
              >
                Read entry <.heroicon name="hero-arrow-up-right" />
              </.navigate>
            </article>
            <div class="mt-6">
              <.navigate to={Soonex.Public.path("/blog")} class="link ui-brand">
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
              Four editions for the same launch. Switch in Template Options — no second build.
            </p>
            <ul class="soonex-look-rail mt-8">
              <li :for={room <- looks()}>
                <span class="soonex-look-id">{room.name}</span>
                <span class="soonex-look-line">{room.line}</span>
              </li>
            </ul>
            <.navigate to="#looks" class="link ui-brand mt-8 inline-flex">
              See all four looks <.heroicon name="hero-arrow-down" />
            </.navigate>
          </div>
        </:content>
      </.tabs>

      <div class="soonex-clone-strip mt-14">
        <div class="min-w-0 lg:max-w-xs">
          <small class={Shell.eyebrow()}>Get Soonex</small>
          <p class="lede mt-2">
            Clone once. mix setup, then mix soonex.server.
          </p>
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

      <div class="mt-20">
        <small class={Shell.eyebrow()}>Plans</small>
        <h3 class={"#{Shell.section_heading()} mt-2"}>
          Same core. <span class="text-brand-text">Three lanes.</span>
        </h3>
        <p class="lede mt-4 max-w-2xl">
          Every plan is Soonex. How far you take it before <span class="whitespace-nowrap">1 September</span>.
        </p>

        <div class="soonex-pricing mt-10">
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

  defp looks do
    [
      %{name: "neo", line: "Cold paper · electric cobalt · geometric display"},
      %{name: "uno", line: "Teal field · razor corners · compressed type"},
      %{name: "duo", line: "Warm surface · rust brand · editorial serif"},
      %{name: "leo", line: "Poster ink · signal orange · uppercase"}
    ]
  end

  defp plans do
    [
      %{
        name: "Solo",
        headline: "Fork and put a date on the page",
        body: "One look, the waitlist, and the log. Enough for an independent launch.",
        cta: "Join waitlist",
        cta_class: "button ui-ghost ui-size-sm w-fit",
        items: [
          "Waitlist landing and shipping log",
          "Keep neo, or switch once for your brand",
          "Countdown aimed at 1 September"
        ]
      },
      %{
        name: "Studio",
        headline: "Four looks, client review",
        body: "Treat Template Options as the review. The shipping log stays.",
        cta: "Join waitlist",
        cta_class: "button ui-brand ui-solid ui-size-sm w-fit",
        items: [
          "neo, uno, duo, and leo on this device",
          "Tags and client pagination",
          "Header timer, toast, and clone strip"
        ]
      },
      %{
        name: "Agency",
        headline: "Accessible handoff you can repeat",
        body: "Ship with accessibility on and a clone path the whole studio can run.",
        cta: "Join waitlist",
        cta_class: "button ui-ghost ui-size-sm w-fit",
        items: [
          "Zoom, contrast, motion, focus, underline",
          "Same fork for every client engagement",
          "Clone, mix setup, mix soonex.server"
        ]
      }
    ]
  end

  defp snippet do
    "git clone https://github.com/corex-ui/soonex.git"
  end
end
