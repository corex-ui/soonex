defmodule Soonex.HomePage.Waitlist do
  @moduledoc false

  use Phoenix.Component
  use Corex

  import Soonex.Layouts.Section, only: [block: 1]

  alias Soonex.Layouts.Shell

  def waitlist(assigns) do
    assigns = assign(assigns, :role_items, role_items())

    ~H"""
    <.block
      id="waitlist"
      section="waitlist"
      labelledby="soonex-waitlist-heading"
      eyebrow="Waitlist"
      tone={:root}
      align={:center}
    >
      <:title>
        Get notified when Corex templates expand.
      </:title>
      <:lede>
        Demo form — no addresses are stored. Submit still fires the success toast so you can validate
        the flow before connecting your provider.
      </:lede>
      <form
        id="soonex-waitlist-form"
        class={"#{Shell.panel_open()} mx-auto w-full max-w-lg"}
        data-waitlist-toast-title="You're on the list"
        data-waitlist-toast-description="This demo form does not collect addresses. Wire the same fields to your list when you ship."
      >
        <div class="flex w-full flex-col items-stretch gap-5">
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
            class="select ui-brand ui-size-md ui-width-full"
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
            class="switch ui-brand"
          >
            <:label>Email me launch notes</:label>
          </.switch>

          <button type="submit" class="button ui-brand ui-solid ui-size-md w-full">
            Join waitlist
          </button>
        </div>
      </form>
    </.block>
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
