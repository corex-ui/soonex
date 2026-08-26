defmodule Soonex.HomePage.Hero do
  @moduledoc false

  use Phoenix.Component
  use Corex

  alias Soonex.Layouts.Shell

  attr(:countdown_ms, :integer, required: true)

  def hero(assigns) do
    ~H"""
    <header
      class={"#{Shell.section_hero()} bg-root"}
      aria-labelledby="soonex-headline"
      data-hero-boundary
    >
      <div class={"#{Shell.stage()} grid grid-cols-1 items-center gap-size-lg lg:grid-cols-2 lg:gap-size-xl"}>
        <div
          class="mx-auto flex w-full max-w-xl flex-col items-center gap-size-md text-center lg:mx-0 lg:max-w-none lg:items-start lg:text-start"
          data-hero
        >
          <p class={Shell.eyebrow()}>Soonex</p>

          <h1
            id="soonex-headline"
            class="display m-0 text-balance text-4xl tracking-tighter text-ink sm:text-5xl lg:text-6xl xl:text-7xl"
          >
            Cut the wait. <span class="text-brand-text">Ship the site.</span>
          </h1>

          <p class={Shell.lede()}>
            A Tableau + Corex coming-soon template: static HEEx, design tokens, and a launch countdown you can fork.
          </p>

          <ul
            class="m-0 grid w-full max-w-xl list-none grid-cols-1 gap-x-space-xl gap-y-space-lg p-0 sm:grid-cols-2"
            aria-label="Highlights"
          >
            <%= for line <- [
                  "Static HEEx pages with Corex components.",
                  "Theme and mode toggles on every page.",
                  "Markdown journal, tags, and RSS.",
                  "Waitlist form ready to point at your API."
                ] do %>
              <li class="relative flex items-start gap-x-space text-pretty text-start text-sm text-ink-muted">
                <span class="mt-space-xs shrink-0 text-success-text">
                  <.heroicon name="hero-check" />
                </span>
                <span>{line}</span>
              </li>
            <% end %>
          </ul>

          <div class="flex w-full flex-wrap items-center justify-center gap-space-lg lg:justify-start">
            <.navigate to="#waitlist" class="button ui-brand ui-solid ui-size-lg">
              Join the waitlist
            </.navigate>
            <.navigate to={Soonex.Public.path("/blog")} class="button ui-ghost ui-size-lg">
              Read the journal <.heroicon name="hero-arrow-up-right" />
            </.navigate>
          </div>
        </div>

        <div class={"#{Shell.paper()} mx-auto w-full max-w-lg rotate-[-1.25deg] p-size md:p-size-lg lg:mx-0 lg:max-w-none"}>
          <p class={Shell.eyebrow()}>Launching in</p>
          <p
            id="hero-countdown-title"
            class="display m-0 mt-space-sm text-2xl tracking-tight text-ink sm:text-3xl"
          >
            Q3 2026 window
          </p>
          <.timer
            id="soonex-hero-countdown"
            countdown
            start_ms={@countdown_ms}
            target_ms={0}
            class="timer ui-success ui-size-lg mt-size w-full"
          >
            <:day_label>Days</:day_label>
            <:hour_label>Hours</:hour_label>
            <:minute_label>Min</:minute_label>
            <:second_label>Sec</:second_label>
          </.timer>
          <p class="m-0 mt-size text-sm text-ink-muted">
            Stock Corex timer on a paper sheet — no custom countdown chrome.
          </p>
        </div>
      </div>
    </header>

    <div data-hero-sentinel aria-hidden="true" class="pointer-events-none h-px w-full shrink-0"></div>
    """
  end
end
