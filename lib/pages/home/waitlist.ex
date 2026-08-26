defmodule Soonex.HomePage.Waitlist do
  @moduledoc false

  use Phoenix.Component
  use Corex

  import Soonex.Layouts.Section, only: [block: 1]

  alias Soonex.Layouts.Shell

  def waitlist(assigns) do
    ~H"""
    <.block
      id="epistula"
      labelledby="soonex-waitlist-heading"
      eyebrow="Epistula"
      tone={:surface}
      layout={:sticky}
    >
      <:title>
        Scribe <span class="text-brand-text">nomen tuum</span>
      </:title>
      <:lede>
        At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti.
      </:lede>
      <form
        id="soonex-waitlist-form"
        class={"#{Shell.panel()} w-full p-8 sm:p-10"}
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
    </.block>
    """
  end
end
