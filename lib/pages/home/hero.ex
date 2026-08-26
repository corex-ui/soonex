defmodule Soonex.HomePage.Hero do
  @moduledoc false

  use Phoenix.Component
  use Corex

  alias Soonex.Layouts.Shell

  attr(:countdown_ms, :integer, required: true)

  def hero(assigns) do
    assigns = assign(assigns, :theme_snippet, theme_snippet())

    ~H"""
    <header
      class={"#{Shell.section_hero()} bg-root"}
      aria-labelledby="soonex-headline"
      data-hero-boundary
    >
      <div class={Shell.stage()}>
        <div class="grid grid-cols-1 items-center gap-16 lg:grid-cols-12 lg:gap-12">
          <div class="flex w-full flex-col lg:col-span-7" data-hero>
            <span class="badge ui-brand ui-size-sm">Launching 1 September</span>

            <h1
              id="soonex-headline"
              class="display mt-6 text-pretty text-5xl font-semibold tracking-tight text-ink sm:text-6xl lg:text-7xl"
            >
              Publish the launch site <span class="text-brand-text">before the product ships.</span>
            </h1>

            <p class={"#{Shell.lede()} max-w-xl"}>
              Soonex is an English Tableau template with Corex tokens, a waitlist, and a countdown
              to 1 September. Change the brand in <code class="code">config :corex_design</code> —
              contrast stays calculated.
            </p>

            <div class="mt-10 flex flex-wrap items-center gap-x-6 gap-y-4">
              <.navigate to="#epistula" class="button ui-brand ui-solid ui-size-lg">
                Join waitlist
              </.navigate>
              <.navigate to={Soonex.Public.path("/blog")} class="button ui-ghost ui-size-lg">
                Read the log <.heroicon name="hero-arrow-up-right" />
              </.navigate>
            </div>
          </div>

          <div class="lg:col-span-5">
            <div class={"#{Shell.panel()} flex w-full min-w-0 flex-col"}>
              <div class="flex items-center gap-2 border-b border-border px-3 py-2">
                <span class="size-2 rounded-full bg-border"></span>
                <span class="size-2 rounded-full bg-border"></span>
                <span class="size-2 rounded-full bg-border"></span>
                <span class="ms-2 font-mono text-xs text-ink-muted">config.exs</span>
              </div>

              <div class="flex flex-col gap-6 p-6 sm:p-8">
                <div class="flex items-start justify-between gap-4">
                  <div>
                    <p class={Shell.eyebrow()}>Public launch</p>
                    <p
                      id="hero-countdown-title"
                      class="display mt-2 text-2xl font-semibold tracking-tight text-ink sm:text-3xl"
                    >
                      1 September 2026
                    </p>
                  </div>
                  <.clipboard
                    id="soonex-theme-snippet"
                    class="clipboard ui-brand ui-size-sm shrink-0"
                    value={@theme_snippet}
                    input={false}
                    trigger_aria_label="Copy theme config"
                  >
                    <:copy>
                      <.heroicon name="hero-clipboard" />
                    </:copy>
                    <:copied>
                      <.heroicon name="hero-check" />
                    </:copied>
                  </.clipboard>
                </div>

                <.timer
                  id="soonex-hero-countdown"
                  countdown
                  start_ms={@countdown_ms}
                  target_ms={0}
                  class="timer ui-success ui-size-lg w-full"
                >
                  <:day_label>Days</:day_label>
                  <:hour_label>Hours</:hour_label>
                  <:minute_label>Min</:minute_label>
                  <:second_label>Sec</:second_label>
                </.timer>

                <.data_list
                  class="data-list ui-accent ui-size-sm w-full max-w-none"
                  items={launch_facts()}
                />

                <.code class="code code--wide ui-size-sm" language={:elixir} code={@theme_snippet} />
              </div>
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
      {"4 themes", "neo, uno, duo, and leo in config"},
      {"0 npm", "Corex hooks via Mix — no package.json"},
      {"1 September", "Public launch on the calendar"}
    ]
  end

  defp launch_facts do
    Corex.Content.new([
      %{label: "Date", content: "1 September 2026"},
      %{label: "Status", content: "Waitlist open"},
      %{label: "Stack", content: "Tableau + Corex"}
    ])
  end

  defp theme_snippet do
    """
    config :corex_design,
      themes: %{
        neo: %{seeds: %{brand: "#2F4BDA"}}
      }
    """
    |> String.trim()
  end
end
