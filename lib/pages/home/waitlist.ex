defmodule Soonex.HomePage.Waitlist do
  @moduledoc false

  use Phoenix.Component
  use Corex

  alias Soonex.Layouts.Shell

  def waitlist(assigns) do
    ~H"""
    <section
      id="epistula"
      class={"#{Shell.section()} bg-root"}
      aria-labelledby="soonex-waitlist-heading"
    >
      <div class={"#{Shell.stage()} grid grid-cols-1 items-center gap-size-xl lg:grid-cols-2"}>
        <div class="flex flex-col gap-size-md">
          <p class={Shell.eyebrow()}>Epistula</p>
          <h2 id="soonex-waitlist-heading" class={Shell.section_heading()}>
            Scribe <span class="text-brand-text">nomen tuum</span>
          </h2>
          <p class={Shell.lede()}>
            At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque.
          </p>
        </div>

        <div class={"#{Shell.panel()} w-full p-size sm:p-size-lg"}>
          <form
            id="soonex-waitlist-form"
            class="flex w-full flex-col items-stretch gap-space"
            data-waitlist-toast-title="Gratias tibi"
            data-waitlist-toast-description="Lorem ipsum dolor sit amet, consectetur adipiscing elit. Haec forma nihil colligit."
          >
            <div class="flex w-full flex-col items-stretch gap-space sm:flex-row">
              <div class="min-w-0 flex-1">
                <.native_input
                  type="email"
                  name="waitlist[email]"
                  id="soonex-waitlist-email"
                  required
                  class="native-input ui-size-md ui-width-full"
                >
                  <:label class="sr-only">Email</:label>
                </.native_input>
              </div>
              <button type="submit" class="button ui-brand ui-solid ui-size-md shrink-0">
                Mitte
              </button>
            </div>

            <div class="flex pt-space-sm">
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
