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
      <div class={"#{Shell.stage()} text-center"}>
        <p class="m-0">
          <span class="badge ui-brand ui-size-sm">Launching {Soonex.Launch.year_label()}</span>
        </p>

        <h1
          id="soonex-headline"
          class="display mx-auto mt-8 max-w-4xl text-pretty text-5xl font-semibold tracking-tight text-ink sm:text-6xl lg:text-7xl"
        >
          Accessible Phoenix UI, ready for your launch page.
        </h1>

        <p class="mx-auto mt-6 max-w-2xl text-pretty text-lg/8 text-ink-muted sm:text-xl/8">
          Soonex is a Tableau + Corex coming-soon template. Ship a waitlist, journal, and
          production-grade components with tokens, light/dark modes, and built-in accessibility.
        </p>

        <div class="mt-10 flex flex-wrap items-center justify-center gap-x-4 gap-y-3">
          <.navigate to="#waitlist" class="button ui-brand ui-solid ui-size-lg">
            Join waitlist
          </.navigate>
          <.navigate to={Soonex.Public.path("/blog")} class="button ui-ghost ui-size-lg">
            Read the journal
          </.navigate>
        </div>

        <div class="mx-auto mt-12 flex max-w-md flex-col items-center gap-4">
          <.timer
            id="soonex-hero-timer"
            countdown
            start_ms={Soonex.Launch.countdown_ms()}
            target_ms={0}
            class="timer ui-brand ui-size-md"
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
