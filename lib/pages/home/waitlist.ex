defmodule Soonex.HomePage.Waitlist do
  @moduledoc false

  use Phoenix.Component
  use Corex

  alias Soonex.Layouts.Shell

  def waitlist(assigns) do
    ~H"""
    <section
      id="epistula"
      class={"#{Shell.section()} border-y border-border bg-surface"}
      aria-labelledby="soonex-waitlist-heading"
    >
      <div class={Shell.stage()}>
        <div class="relative isolate overflow-hidden border border-border bg-root px-6 py-16 sm:px-16 lg:flex lg:items-center lg:gap-x-20 lg:px-20 lg:py-20">
          <div class="mx-auto max-w-md text-center lg:mx-0 lg:flex-auto lg:text-start">
            <p class={Shell.eyebrow()}>Epistula</p>
            <h2 id="soonex-waitlist-heading" class={Shell.section_heading()}>
              Scribe <span class="text-brand-text">nomen tuum</span>
            </h2>
            <p class={"#{Shell.lede()} mx-auto lg:mx-0"}>
              At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti.
            </p>
          </div>

          <form
            id="soonex-waitlist-form"
            class="mx-auto mt-12 w-full max-w-md lg:mt-0"
            data-waitlist-toast-title="Gratias tibi"
            data-waitlist-toast-description="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Haec forma nihil colligit."
          >
            <div class="flex w-full flex-col items-stretch gap-4">
              <.native_input
                type="email"
                name="waitlist[email]"
                id="soonex-waitlist-email"
                required
                placeholder="nomen@lorem.ipsum"
                class="native-input ui-size-md ui-width-full"
              >
                <:label>Epistula electronica</:label>
              </.native_input>
              <button type="submit" class="button ui-brand ui-solid ui-size-md w-full">
                Mitte
              </button>
              <.checkbox
                id="soonex-waitlist-updates"
                name="waitlist[updates]"
                checked={true}
                class="checkbox ui-accent ui-size-md"
              >
                <:indicator>
                  <.heroicon name="hero-check" />
                </:indicator>
                <:label>Lorem ipsum nuntia mittere</:label>
              </.checkbox>
            </div>
          </form>
        </div>
      </div>
    </section>
    """
  end
end
