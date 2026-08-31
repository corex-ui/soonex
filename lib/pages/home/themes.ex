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
        Switch neo, uno, duo, and leo live in Template Options. Paper stays calm — type, corners,
        and brand change the room.
      </:lede>

      <p class="soonex-room-specimen m-0">Soonex</p>
      <p class="lede mt-4 max-w-xl">
        This specimen follows the look you pick. No second build for the review.
      </p>

      <ol class="soonex-looks-bento mt-12">
        <li
          :for={room <- rooms()}
          data-theme={room.id}
          data-mode="light"
          class="soonex-look-tile soonex-card-motion"
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
        use: "Default for product launches."
      },
      %{
        id: "uno",
        line: "Calm ops — tight tracking, small radius, teal.",
        use: "Ops and tooling launches."
      },
      %{
        id: "duo",
        line: "Editorial atelier — serif display, soft corners, rust.",
        use: "Studios that want editorial warmth."
      },
      %{
        id: "leo",
        line: "Signal poster — strong display, square corners, orange.",
        use: "Campaign drops and posters."
      }
    ]
  end
end
