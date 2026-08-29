defmodule Soonex.HomePage.Themes do
  @moduledoc false

  use Phoenix.Component

  import Soonex.Layouts.Section, only: [block: 1]

  def themes(assigns) do
    ~H"""
    <.block id="themes" labelledby="soonex-themes-heading" eyebrow="Rooms" layout={:open}>
      <:title>
        Four rooms. <span class="text-brand-text">One building.</span>
      </:title>
      <:lede>
        Paper stays near-white. Type, radius, and brand change the weather. Template Options is the
        live review — not the headline.
      </:lede>
      <p class="soonex-room-specimen m-0">Soonex</p>
      <p class="lede mt-4 max-w-xl">
        The active room sets this display. Switch neo, uno, duo, or leo in the corner and this line
        moves with it.
      </p>

      <ol class="mt-12 flex list-none flex-col gap-10 p-0">
        <li :for={room <- rooms()} data-theme={room.id} data-mode="light" class="soonex-room">
          <p class="soonex-room-name m-0">{room.id}</p>
          <p class="lede m-0 mt-2 max-w-xl">{room.line}</p>
        </li>
      </ol>
    </.block>
    """
  end

  defp rooms do
    [
      %{id: "neo", line: "Product studio — geometric display, open corners, cobalt."},
      %{id: "uno", line: "Calm ops — tight tracking, small radius, teal."},
      %{id: "duo", line: "Editorial atelier — serif display, soft corners, rust."},
      %{id: "leo", line: "Signal poster — strong display, square corners, orange."}
    ]
  end
end
