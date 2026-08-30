defmodule Soonex.HomePage.Hero do
  @moduledoc false

  use Phoenix.Component
  use Corex

  alias Soonex.Layouts.Shell

  def hero(assigns) do
    ~H"""
    <header
      class="soonex-hero-slab relative isolate flex min-h-svh w-full flex-col justify-center overflow-x-clip"
      aria-labelledby="soonex-headline"
      data-hero-boundary
    >
      <div class={"#{Shell.stage()} relative z-[1] w-full py-20 sm:py-28"}>
        <div class="grid grid-cols-1 items-stretch gap-12 lg:grid-cols-12 lg:gap-10">
          <div class="flex w-full flex-col justify-center lg:col-span-7" data-hero>
            <p class="soonex-slab-kicker m-0">Launch · 1 September</p>
            <h1 id="soonex-headline" class="soonex-slab-display mt-4 text-pretty">
              Soonex
            </h1>
            <p class="soonex-slab-lede mt-6 max-w-xl text-pretty">
              Waitlist. Shipping log. Countdown. Four looks. One instrument desk for studios that
              ship on a date.
            </p>
            <div class="mt-10 flex flex-wrap items-center gap-x-8 gap-y-4">
              <.navigate to="#waitlist" class="soonex-slab-cta">
                Join waitlist
              </.navigate>
              <.navigate to={Soonex.Public.path("/blog")} class="soonex-slab-link">
                Read the log <.heroicon name="hero-arrow-up-right" />
              </.navigate>
            </div>
          </div>

          <div class="flex lg:col-span-5 lg:items-center">
            <div class="soonex-waitlist-rack w-full">
              <div class="soonex-rack-head">
                <small class={Shell.eyebrow()}>Waitlist</small>
                <p class="soonex-card-title m-0 mt-2">Reserve a seat</p>
                <p class="lede m-0 mt-2 text-sm/6">
                  Email + role. We write before the countdown ends.
                </p>
              </div>

              <form
                id="soonex-hero-waitlist-form"
                class="soonex-rack-body mt-6 flex w-full flex-col gap-5"
                data-waitlist-toast-title="You're on the list"
                data-waitlist-toast-description="We'll email you before 1 September."
              >
                <div class="soonex-waitlist-join flex w-full flex-col gap-3 sm:flex-row sm:items-stretch">
                  <.native_input
                    type="email"
                    name="waitlist[email]"
                    id="soonex-hero-waitlist-email"
                    required
                    autocomplete="email"
                    placeholder="you@studio.dev"
                    class="native-input ui-size-md ui-width-full min-w-0 flex-1"
                  >
                    <:label class="sr-only">Email</:label>
                  </.native_input>

                  <button type="submit" class="button ui-brand ui-solid ui-size-md sm:w-auto">
                    Join
                  </button>
                </div>

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
                  <:label><span class="sr-only">I am a</span></:label>
                </.radio_group>
              </form>

              <p class="soonex-rack-proof m-0 mt-6 border-t border-border pt-5 text-sm/6 text-ink-muted">
                <span class="font-semibold text-ink">240 studios</span>
                already on the list for <span class="whitespace-nowrap">1 September</span>.
              </p>
            </div>
          </div>
        </div>
      </div>
    </header>

    <div data-hero-sentinel aria-hidden="true" class="pointer-events-none h-px w-full shrink-0"></div>
    """
  end
end
