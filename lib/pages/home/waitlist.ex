defmodule Soonex.HomePage.Waitlist do
  @moduledoc false

  use Phoenix.Component
  use Corex

  alias Soonex.Layouts.Shell

  def waitlist(assigns) do
    assigns = assign(assigns, :role_items, role_items())

    ~H"""
    <section
      id="waitlist"
      data-section="waitlist"
      class={"#{Shell.section_compact()} border-t border-border bg-surface"}
      aria-labelledby="soonex-waitlist-heading"
    >
      <div class={Shell.stage()}>
        <div class="mx-auto max-w-xl">
          <h2 id="soonex-waitlist-heading" class={Shell.section_heading()}>
            Join the waitlist
          </h2>
          <p class={Shell.lede()}>
            Demo form — no addresses are stored. Submit fires the success toast so you can validate
            the flow before connecting your provider.
          </p>

          <form
            id="soonex-waitlist-form"
            class="mt-10 flex w-full flex-col items-stretch gap-5"
            data-waitlist-toast-title="You're on the list"
            data-waitlist-toast-description="This demo form does not collect addresses. Wire the same fields to your list when you ship."
          >
            <.native_input
              type="email"
              name="waitlist[email]"
              id="soonex-waitlist-email"
              required
              autocomplete="email"
              placeholder="you@company.com"
              class="native-input ui-size-md ui-width-full"
            >
              <:label>Email</:label>
            </.native_input>

            <.select
              id="soonex-waitlist-role"
              name="waitlist[role]"
              class="select ui-accent ui-size-md ui-width-full"
              value={["founder"]}
              items={@role_items}
              positioning={
                %Corex.Positioning{
                  strategy: "absolute",
                  placement: "bottom-start",
                  same_width: true,
                  gutter: 8,
                  slide: false,
                  fit_viewport: false,
                  flip: false
                }
              }
            >
              <:label>Role</:label>
              <:trigger>
                <.heroicon name="hero-chevron-down" />
              </:trigger>
            </.select>

            <.switch
              id="soonex-waitlist-notes"
              name="waitlist[notes]"
              checked
              class="switch ui-accent"
            >
              <:label>Email me launch notes</:label>
            </.switch>

            <button type="submit" class={"#{Shell.primary_button()} w-full sm:w-auto"}>
              Join waitlist
            </button>
          </form>
        </div>
      </div>
    </section>
    """
  end

  defp role_items do
    Corex.List.new([
      %{label: "Founder", value: "founder"},
      %{label: "Engineer", value: "engineer"},
      %{label: "Designer", value: "designer"}
    ])
  end
end
