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
        Everything you need to <span class="text-brand-text">launch</span>
      </:title>
      <:lede>
        A waitlist that converts, a public shipping log, a countdown aimed at your date, and four
        looks for client review — one product, ready for <span class="whitespace-nowrap">1 September</span>.
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
              Soonex is a launch workspace for studios shipping on a hard date. Put the waitlist on
              the page, keep a public log, and review four looks with your client before go-live.
            </p>
            <ul class="soonex-check-list mt-8">
              <li>
                <span class="soonex-check-mark" aria-hidden="true"></span>
                <div>
                  <p class="m-0 font-semibold text-ink">Waitlist on day one</p>
                  <p class="lede m-0 mt-1 text-sm/6">
                    Email, role, interests, and team size — with a launch toast on submit.
                  </p>
                </div>
              </li>
              <li>
                <span class="soonex-check-mark" aria-hidden="true"></span>
                <div>
                  <p class="m-0 font-semibold text-ink">Public shipping log</p>
                  <p class="lede m-0 mt-1 text-sm/6">
                    Markdown entries with covers and tags. The index paginates in the browser.
                  </p>
                </div>
              </li>
              <li>
                <span class="soonex-check-mark" aria-hidden="true"></span>
                <div>
                  <p class="m-0 font-semibold text-ink">Countdown that stays honest</p>
                  <p class="lede m-0 mt-1 text-sm/6">
                    Aimed at <span class="whitespace-nowrap">1 September</span> until you change the
                    date. Digits stay on one row.
                  </p>
                </div>
              </li>
            </ul>
            <div class="mt-8">
              <.navigate to="#waitlist" class="button ui-brand ui-solid ui-size-md">
                Join waitlist
              </.navigate>
            </div>
          </div>
        </:content>

        <:trigger value="waitlist">Waitlist</:trigger>
        <:content value="waitlist" class="soonex-tab-panel">
          <div class="soonex-tab-workspace">
            <div class="grid grid-cols-1 gap-8 lg:grid-cols-2">
              <div>
                <p class="soonex-card-title m-0">Capture who is coming</p>
                <p class="lede mt-3">
                  The same fields live on the hero still and at the end of the page. Collect email,
                  role, interests, and team size — then show a clear success path.
                </p>
                <ul class="soonex-feature-bullets mt-6">
                  <li>Email with validation</li>
                  <li>Role select or radios</li>
                  <li>Interests as tags</li>
                  <li>Team size stepper</li>
                  <li>Launch notes switch</li>
                </ul>
              </div>
              <div class="soonex-mini-form border border-border bg-surface p-6">
                <small class={Shell.eyebrow()}>Preview</small>
                <p class="soonex-card-title mt-2">Join the list</p>
                <div class="mt-5 flex flex-col gap-4">
                  <div class="soonex-field-ghost">you@studio.dev</div>
                  <div class="soonex-field-ghost">Founder</div>
                  <div class="soonex-field-ghost">Add an interest…</div>
                  <div class="button ui-brand ui-solid ui-size-md pointer-events-none w-full text-center">
                    Join waitlist
                  </div>
                </div>
                <p class="m-0 mt-4 text-sm/6 text-ink-muted">
                  Wire your provider after launch. The toast already ships.
                </p>
              </div>
            </div>
          </div>
        </:content>

        <:trigger value="log">Log</:trigger>
        <:content value="log" class="soonex-tab-panel">
          <div class="soonex-tab-workspace">
            <p class="lede m-0 max-w-2xl">
              Keep a public trail of what shipped. Posts live as Markdown with covers and tags —
              rebuild and the index updates.
            </p>
            <article class="soonex-sample-entry mt-8 border border-border bg-surface p-6 sm:p-8">
              <small class={Shell.eyebrow()}>02 August 2026</small>
              <h3 class={"#{Shell.card_title()} mt-2"}>
                Accessibility on this device
              </h3>
              <p class="lede mt-3 max-w-xl">
                Zoom, contrast, motion, cursor, focus, and link underline — stored in local storage
                so preferences follow the visitor.
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
              Four looks for the same launch. Switch rooms in Template Options and review with your
              client without a second build.
            </p>
            <ul class="mt-8 grid grid-cols-1 gap-4 sm:grid-cols-2">
              <li
                :for={room <- looks()}
                class="flex flex-col gap-1 border border-border bg-surface p-5"
              >
                <p class="m-0 font-semibold text-ink">{room.name}</p>
                <p class="lede m-0 text-sm/6">{room.line}</p>
              </li>
            </ul>
            <.navigate to="#looks" class="link ui-brand mt-6 inline-flex">
              See all four looks <.heroicon name="hero-arrow-down" />
            </.navigate>
          </div>
        </:content>
      </.tabs>

      <div class="mt-12 flex flex-col gap-6 border-t border-border pt-10 lg:flex-row lg:items-end lg:gap-8">
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

      <div class="mt-16 border-t border-border pt-12">
        <small class={Shell.eyebrow()}>Plans</small>
        <h3 class={"#{Shell.section_heading()} mt-2"}>
          Pick a lane. <span class="text-brand-text">Ship the same core.</span>
        </h3>
        <p class="lede mt-4 max-w-2xl">
          Every plan is the same Soonex launch. The columns describe how far you take it before <span class="whitespace-nowrap">1 September</span>.
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
      %{name: "neo", line: "Product studio — geometric display, open corners, cobalt."},
      %{name: "uno", line: "Calm ops — tight tracking, small radius, teal."},
      %{name: "duo", line: "Editorial atelier — serif display, soft corners, rust."},
      %{name: "leo", line: "Signal poster — strong display, square corners, orange."}
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
        headline: "Four looks, real stills, client review",
        body: "Treat Template Options as the review. Photography and the shipping log stay.",
        cta: "Join waitlist",
        cta_class: "button ui-brand ui-solid ui-size-sm w-fit",
        items: [
          "neo, uno, duo, and leo on this device",
          "Covers, tags, and client pagination",
          "Header timer, toast, and clone strip"
        ]
      },
      %{
        name: "Agency",
        headline: "Accessible handoff your team can repeat",
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
