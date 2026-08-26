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
      <div class={Shell.stage()}>
        <div class="grid grid-cols-1 items-center gap-16 lg:grid-cols-12 lg:gap-12">
          <div class="flex w-full flex-col lg:col-span-7" data-hero>
            <nav
              class="flex flex-wrap items-center gap-x-6 gap-y-2 text-sm/6 font-semibold"
              aria-label="Lorem"
            >
              <.navigate to="#index" class="link ui-nav ui-size-sm">Index</.navigate>
              <.navigate to="#principia" class="link ui-nav ui-size-sm">Principia</.navigate>
              <.navigate to="#officia" class="link ui-nav ui-size-sm">Officia</.navigate>
              <.navigate to="#acta" class="link ui-nav ui-size-sm">Acta</.navigate>
              <.navigate to="#epistula" class="link ui-nav ui-size-sm">Epistula</.navigate>
            </nav>

            <p class={"#{Shell.eyebrow()} mt-8"}>Editio prima</p>

            <h1
              id="soonex-headline"
              class="display mt-2 text-pretty text-5xl font-semibold tracking-tight text-ink sm:text-6xl lg:text-7xl"
            >
              Lorem ipsum <span class="text-brand-text">dolor sit amet.</span>
            </h1>

            <p class={"#{Shell.lede()} max-w-xl"}>
              Consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.
            </p>

            <div class="mt-10 flex flex-wrap items-center gap-x-6 gap-y-4">
              <.navigate to="#epistula" class="button ui-brand ui-solid ui-size-lg">
                Scribe nomen
              </.navigate>
              <.navigate to={Soonex.Public.path("/blog")} class="button ui-ghost ui-size-lg">
                Lege acta <.heroicon name="hero-arrow-up-right" />
              </.navigate>
            </div>
          </div>

          <div class="lg:col-span-5">
            <div class={"#{Shell.panel()} flex w-full min-w-0 flex-col gap-6 p-8"}>
              <div>
                <p class={Shell.eyebrow()}>Adventus</p>
                <p
                  id="hero-countdown-title"
                  class="display mt-2 text-2xl font-semibold tracking-tight text-ink sm:text-3xl"
                >
                  Nonae Septembres
                </p>
              </div>
              <.timer
                id="soonex-hero-countdown"
                countdown
                start_ms={@countdown_ms}
                target_ms={0}
                class="timer ui-success ui-size-lg w-full"
              >
                <:day_label>Dies</:day_label>
                <:hour_label>Horae</:hour_label>
                <:minute_label>Min</:minute_label>
                <:second_label>Sec</:second_label>
              </.timer>
              <.data_list
                class="data-list ui-accent ui-size-sm w-full max-w-none"
                items={adventus_facts()}
              />
            </div>
          </div>
        </div>

        <dl class="mt-16 grid grid-cols-1 gap-8 sm:grid-cols-3 sm:gap-6">
          <div
            :for={{stat, caption} <- metrics()}
            class="flex flex-col-reverse gap-y-1 border-l border-border pl-6"
          >
            <dt class="text-sm/6 text-ink-muted">{caption}</dt>
            <dd class="display m-0 text-3xl font-semibold tracking-tight text-ink">{stat}</dd>
          </div>
        </dl>
      </div>
    </header>

    <div data-hero-sentinel aria-hidden="true" class="pointer-events-none h-px w-full shrink-0"></div>
    """
  end

  defp metrics do
    [
      {"XII mil.", "Lorem lecti in indice"},
      {"48h", "Ipsum cursus a Kalendis"},
      {"99%", "Dolor ratio absoluta"}
    ]
  end

  defp adventus_facts do
    Corex.Content.new([
      %{label: "Kalendae", content: "Nonae Septembres"},
      %{label: "Status", content: "Aperitur mox"},
      %{label: "Locus", content: "Lorem ipsum aula"}
    ])
  end
end
