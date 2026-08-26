defmodule Soonex.HomePage.Waitlist do
  @moduledoc false

  use Phoenix.Component
  use Corex

  alias Soonex.Layouts.Shell

  def waitlist(assigns) do
    ~H"""
    <section
      id="waitlist"
      class={"#{Shell.section()} bg-root"}
      aria-labelledby="soonex-waitlist-heading"
    >
      <div class={"#{Shell.stage()} flex flex-col items-center"}>
        <div class={"#{Shell.paper()} w-full max-w-xl rotate-[0.8deg] p-size sm:p-size-lg"}>
          <div class="flex flex-col items-center gap-size-lg text-center">
            <div class="flex w-full flex-col items-center gap-size-md">
              <p class={Shell.eyebrow()}>RSVP</p>
              <h2 id="soonex-waitlist-heading" class={Shell.section_heading()}>
                Save a <span class="text-brand-text">seat</span>
              </h2>
              <p class="m-0 max-w-md text-pretty text-lg text-ink-muted">
                Drop an email for launch notes. This demo card does not collect anything yet.
              </p>
            </div>

            <form
              id="soonex-waitlist-form"
              class="flex w-full max-w-md flex-col items-stretch gap-space"
              data-waitlist-toast-title="Thanks for joining"
              data-waitlist-toast-description="This demo does not send or collect email. Point this form at your API or endpoint when you ship."
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
                    <:label class="sr-only">Your email</:label>
                  </.native_input>
                </div>
                <button
                  type="submit"
                  class="button ui-brand ui-solid ui-size-md shrink-0"
                >
                  Stamp it
                </button>
              </div>

              <div class="flex justify-center pt-space-sm">
                <.checkbox
                  id="soonex-waitlist-updates"
                  name="waitlist[updates]"
                  checked={true}
                  class="checkbox ui-accent ui-size-md"
                >
                  <:indicator>
                    <.heroicon name="hero-check" />
                  </:indicator>
                  <:label>Send me build updates</:label>
                </.checkbox>
              </div>
            </form>
          </div>
        </div>
      </div>
    </section>
    """
  end
end
