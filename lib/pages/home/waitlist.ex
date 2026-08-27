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
      id="epistula"
      labelledby="soonex-waitlist-heading"
      eyebrow="Waitlist"
      tone={:surface}
      align={:center}
    >
      <:title>
        Join the <span class="text-brand-text">September list</span>
      </:title>
      <:lede>
        Tell us your role, interests, and team size. This demo does not store addresses — submit still
        shows the launch toast.
      </:lede>
      <form
        id="soonex-waitlist-form"
        class={"#{Shell.panel()} mx-auto w-full max-w-lg p-8 sm:p-10"}
        data-waitlist-toast-title="You're on the list"
        data-waitlist-toast-description="This demo form does not collect addresses. The live template wires the same toast."
      >
        <div class="flex w-full flex-col items-stretch gap-5">
          <.native_input
            type="email"
            name="waitlist[email]"
            id="soonex-waitlist-email"
            required
            autocomplete="email"
            placeholder="you@studio.dev"
            class="native-input ui-size-md ui-width-full"
          >
            <:label class="sr-only">Email</:label>
          </.native_input>

          <.select
            id="soonex-waitlist-role"
            name="waitlist[role]"
            class="select ui-brand ui-size-md ui-width-full"
            value={["founder"]}
            positioning={
              %Corex.Positioning{
                placement: "bottom-start",
                same_width: true
              }
            }
            items={@role_items}
          >
            <:label>Role</:label>
            <:trigger>
              <.heroicon name="hero-chevron-down" />
            </:trigger>
          </.select>

          <.tags_input
            id="soonex-waitlist-interests"
            name="waitlist[interests]"
            class="tags-input ui-brand ui-size-md ui-width-full"
            value={[]}
            translation={
              %Corex.TagsInput.Translation{
                placeholder: "Add an interest and press Enter"
              }
            }
          >
            <:label>Interests</:label>
            <:close>
              <.heroicon name="hero-x-mark" />
            </:close>
          </.tags_input>

          <.number_input
            id="soonex-waitlist-team"
            name="waitlist[team_size]"
            class="number-input ui-brand ui-size-md ui-width-full"
            min={1.0}
            max={200.0}
            step={1.0}
            value="2"
          >
            <:label>Team size</:label>
            <:decrement_trigger>
              <.heroicon name="hero-chevron-down" class="icon" />
            </:decrement_trigger>
            <:increment_trigger>
              <.heroicon name="hero-chevron-up" class="icon" />
            </:increment_trigger>
          </.number_input>

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
