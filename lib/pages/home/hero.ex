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
      <div class={"#{Shell.stage()} grid grid-cols-1 items-end gap-size-lg lg:grid-cols-12 lg:gap-size-xl"}>
        <div
          class="flex w-full flex-col gap-size-md lg:col-span-7"
          data-hero
        >
          <nav class="flex flex-wrap items-center gap-space-lg text-sm" aria-label="Lorem">
            <.navigate to="#index" class="link ui-nav ui-size-sm">Index</.navigate>
            <.navigate to="#principia" class="link ui-nav ui-size-sm">Principia</.navigate>
            <.navigate to="#acta" class="link ui-nav ui-size-sm">Acta</.navigate>
            <.navigate to="#epistula" class="link ui-nav ui-size-sm">Epistula</.navigate>
          </nav>

          <p class={Shell.eyebrow()}>Editio prima</p>

          <h1
            id="soonex-headline"
            class="display m-0 text-balance text-5xl tracking-tighter text-ink sm:text-6xl lg:text-7xl xl:text-8xl"
          >
            Lorem ipsum <span class="text-brand-text">dolor sit amet.</span>
          </h1>

          <p class={"#{Shell.lede()} max-w-xl"}>
            Consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation.
          </p>

          <div class="flex w-full flex-wrap items-center gap-space-lg">
            <.navigate to="#epistula" class="button ui-brand ui-solid ui-size-lg">
              Scribe nomen
            </.navigate>
            <.navigate to={Soonex.Public.path("/blog")} class="button ui-ghost ui-size-lg">
              Lege acta <.heroicon name="hero-arrow-up-right" />
            </.navigate>
          </div>
        </div>

        <div class="lg:col-span-5">
          <div class={"#{Shell.panel()} flex w-full min-w-0 flex-col gap-size p-size md:p-size-lg"}>
            <p class={Shell.eyebrow()}>Adventus</p>
            <p
              id="hero-countdown-title"
              class="display m-0 text-2xl tracking-tight text-ink sm:text-3xl"
            >
              Nonae Septembres
            </p>
            <.timer
              id="soonex-hero-countdown"
              countdown
              start_ms={@countdown_ms}
              target_ms={0}
              class="timer ui-success ui-size-lg mt-space w-full"
            >
              <:day_label>Dies</:day_label>
              <:hour_label>Horae</:hour_label>
              <:minute_label>Min</:minute_label>
              <:second_label>Sec</:second_label>
            </.timer>
            <p class="m-0 text-sm text-ink-muted">
              Tempora mutantur, nos et mutamur in illis.
            </p>
          </div>
        </div>
      </div>
    </header>

    <div data-hero-sentinel aria-hidden="true" class="pointer-events-none h-px w-full shrink-0"></div>
    """
  end
end
