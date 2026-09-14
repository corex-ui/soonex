defmodule Soonex.HomePage.Hero do
  @moduledoc false

  use Phoenix.Component
  use Corex

  alias Soonex.Layouts.Shell

  def hero(assigns) do
    ~H"""
    <header
      class={"#{Shell.section_hero()} bg-root"}
      aria-labelledby="soonex-headline"
      data-section="hero"
    >
      <div class={Shell.stage()}>
        <div class="grid grid-cols-1 gap-10 lg:grid-cols-12 lg:items-end">
          <div class="lg:col-span-8">
            <p class="m-0 text-sm/6 text-ink-muted">
              Launching {Soonex.Launch.year_label()}
            </p>

            <h1 id="soonex-headline" class={"#{Shell.hero_heading()} mt-6"}>
              Accessible Phoenix UI for your coming-soon launch.
            </h1>

            <p class="mt-6 max-w-xl text-pretty text-sm/6 text-ink-muted sm:text-base/7">
              Soonex is a Tableau + Corex template. Ship a waitlist, journal, and production-grade
              components with design tokens, light/dark modes, and built-in accessibility — no
              parallel CSS framework.
            </p>
          </div>

          <div class="flex flex-wrap items-center gap-3 lg:col-span-4 lg:justify-end lg:pb-1">
            <.navigate to="#waitlist" class={Shell.primary_button()}>
              Join waitlist
            </.navigate>
            <.navigate to={Soonex.Public.path("/blog")} class="button ui-ghost ui-size-sm">
              Read journal
            </.navigate>
          </div>
        </div>

        <div class="mt-16 flex flex-col gap-3 border-t border-border pt-10 sm:flex-row sm:items-end sm:justify-between">
          <.timer
            id="soonex-hero-timer"
            countdown
            start_ms={Soonex.Launch.countdown_ms()}
            target_ms={0}
            class="timer ui-accent ui-size-sm"
          >
            <:day_label>days</:day_label>
            <:hour_label>hours</:hour_label>
            <:minute_label>min</:minute_label>
            <:second_label>sec</:second_label>
          </.timer>
          <p class="m-0 text-sm/6 text-ink-muted">
            Countdown target lives in <code class="code">Soonex.Launch</code>.
          </p>
        </div>
      </div>
    </header>
    """
  end
end
