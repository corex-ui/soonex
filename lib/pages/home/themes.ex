defmodule Soonex.HomePage.Themes do
  @moduledoc false

  use Phoenix.Component

  import Soonex.Layouts.Section, only: [block: 1]

  def themes(assigns) do
    ~H"""
    <.block id="looks" labelledby="soonex-looks-heading" eyebrow="Looks" layout={:open}>
      <:title>
        Four looks. <span class="text-brand-text">One launch.</span>
      </:title>
      <:lede>
        Review neo, uno, duo, and leo with your client on this device. Paper stays calm — type,
        corners, and brand change the room.
      </:lede>
      <p class="soonex-room-specimen m-0">Soonex</p>
      <p class="lede mt-4 max-w-xl">
        This display follows the look you pick in Template Options. Switch rooms live — no second
        build for the review.
      </p>

      <ol class="mt-12 grid grid-cols-1 gap-6 sm:grid-cols-2 lg:gap-8">
        <li
          :for={room <- rooms()}
          data-theme={room.id}
          data-mode="light"
          class="soonex-room border border-border bg-surface p-6 sm:p-8"
        >
          <p class="soonex-room-name m-0">{room.id}</p>
          <p class="lede m-0 mt-3">{room.line}</p>
          <p class="m-0 mt-4 text-sm/6 text-ink-muted">{room.use}</p>
        </li>
      </ol>
    </.block>
    """
  end

  defp rooms do
    [
      %{
        id: "neo",
        line: "Product studio — geometric display, open corners, cobalt.",
        use: "Default for product launches and investor-facing pages."
      },
      %{
        id: "uno",
        line: "Calm ops — tight tracking, small radius, teal.",
        use: "Ops and tooling launches that need quiet confidence."
      },
      %{
        id: "duo",
        line: "Editorial atelier — serif display, soft corners, rust.",
        use: "Studios and cultural brands that want editorial warmth."
      },
      %{
        id: "leo",
        line: "Signal poster — strong display, square corners, orange.",
        use: "Campaign drops and poster-led announcements."
      }
    ]
  end
end
