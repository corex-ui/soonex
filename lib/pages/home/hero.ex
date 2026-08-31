defmodule Soonex.HomePage.Hero do
  @moduledoc false

  use Phoenix.Component
  use Corex

  alias Soonex.Layouts.Shell

  def hero(assigns) do
    ~H"""
    <header
      class="soonex-edition-hero relative isolate flex min-h-svh w-full flex-col justify-between overflow-x-clip bg-root"
      aria-labelledby="soonex-headline"
      data-hero-boundary
    >
      <div class={"#{Shell.stage()} flex w-full flex-1 flex-col justify-center pt-20 pb-10 sm:pt-28 sm:pb-14"}>
        <div class="soonex-edition-meta" data-hero>
          <span class="soonex-mono-meta">Edition</span>
          <span class="soonex-meta-rule" aria-hidden="true"></span>
          <span class="soonex-mono-meta">1 September 2026</span>
        </div>

        <h1 id="soonex-headline" class="soonex-edition-display mt-6 text-pretty">
          Soonex
        </h1>

        <div class="soonex-edition-split mt-10 grid grid-cols-1 gap-8 lg:grid-cols-12 lg:items-end lg:gap-12">
          <p class="soonex-edition-lede m-0 max-w-xl text-pretty lg:col-span-7">
            Waitlist, shipping log, countdown, four looks — a launch desk for studios that ship on a
            date.
          </p>
          <.navigate
            to={Soonex.Public.path("/blog")}
            class="link ui-brand ui-size-sm w-fit lg:col-span-5 lg:justify-self-end"
          >
            Read the log <.heroicon name="hero-arrow-up-right" />
          </.navigate>
        </div>
      </div>

      <div class="soonex-waitlist-strip border-t border-border bg-surface">
        <div class={Shell.stage()}>
          <form
            id="soonex-hero-waitlist-form"
            class="soonex-strip-form"
            data-waitlist-toast-title="You're on the list"
            data-waitlist-toast-description="We'll email you before 1 September."
          >
            <div class="soonex-strip-label">
              <small class={Shell.eyebrow()}>Waitlist</small>
              <p class="m-0 mt-1 text-sm/6 text-ink-muted">
                240 studios · write before launch
              </p>
            </div>

            <div class="soonex-waitlist-join soonex-strip-join min-w-0 flex-1">
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

              <button type="submit" class="button ui-brand ui-solid ui-size-md shrink-0">
                Join waitlist
              </button>
            </div>

            <.radio_group
              id="soonex-hero-role"
              name="waitlist[role]"
              class="radio-group ui-brand soonex-strip-roles"
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
        </div>
      </div>
    </header>

    <div data-hero-sentinel aria-hidden="true" class="pointer-events-none h-px w-full shrink-0"></div>
    """
  end
end
