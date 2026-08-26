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
            <span class="badge ui-brand ui-size-sm">Launching 1 September</span>

            <h1
              id="soonex-headline"
              class="display mt-6 text-pretty text-5xl font-semibold tracking-tight text-ink sm:text-6xl lg:text-7xl"
            >
              Publish the launch site <span class="text-brand-text">before the product ships.</span>
            </h1>

            <p class={"#{Shell.lede()} max-w-xl"}>
              Soonex is an English Tableau template with Corex tokens, a waitlist, and a countdown
              to 1 September. Change the brand in <code class="code">config :corex_design</code>
              — contrast stays calculated.
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
            <div class={"#{Shell.panel()} flex w-full min-w-0 flex-col p-6 sm:p-8"}>
              <p class={Shell.eyebrow()}>Waitlist</p>
              <h2 class="display mt-2 text-2xl font-semibold tracking-tight text-ink sm:text-3xl">
                Get launch notes first
              </h2>
              <p class="mt-3 text-sm/6 text-ink-muted">
                One email. Tell us how you work. We will not store this form — it only fires a toast.
              </p>

              <form
                id="soonex-hero-waitlist-form"
                class="mt-8 flex w-full flex-col items-stretch gap-5"
                data-waitlist-toast-title="You're on the list"
                data-waitlist-toast-description="This demo form does not collect addresses. The live template wires the same toast."
              >
                <.native_input
                  type="email"
                  name="waitlist[email]"
                  id="soonex-hero-waitlist-email"
                  required
                  autocomplete="email"
                  placeholder="you@studio.dev"
                  class="native-input ui-size-md ui-width-full"
                >
                  <:label>Email</:label>
                </.native_input>

                <.radio_group
                  id="soonex-hero-role"
                  name="waitlist[role]"
                  class="radio-group ui-brand ui-width-full"
                  value="founder"
                  items={[
                    %{value: "founder", label: "Founder"},
                    %{value: "engineer", label: "Engineer"},
                    %{value: "designer", label: "Designer"}
                  ]}
                >
                  <:label>I am a</:label>
                </.radio_group>

                <.switch
                  id="soonex-hero-notes"
                  name="waitlist[notes]"
                  checked
                  class="switch ui-brand"
                >
                  <:label>Email me launch notes</:label>
                </.switch>

                <button type="submit" class="button ui-brand ui-solid ui-size-md w-full">
                  Join waitlist
                </button>
              </form>
            </div>
          </div>
        </div>

        <.timer
          id="soonex-hero-countdown"
          countdown
          start_ms={@countdown_ms}
          target_ms={0}
          class="timer ui-success ui-size-lg mt-16 w-full"
        >
          <:day_label>Days</:day_label>
          <:hour_label>Hours</:hour_label>
          <:minute_label>Min</:minute_label>
          <:second_label>Sec</:second_label>
        </.timer>

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
end
