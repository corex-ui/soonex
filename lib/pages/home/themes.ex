defmodule Soonex.HomePage.Themes do
  @moduledoc false

  use Phoenix.Component

  import Soonex.Layouts.Section, only: [block: 1]

  def themes(assigns) do
    ~H"""
    <.block id="looks" labelledby="soonex-looks-heading" eyebrow="Looks" layout={:open}>
      <:title>
        Four instruments. <span class="text-brand-text">One launch.</span>
      </:title>
      <:lede>
        neo, uno, duo, leo — same page, different type, corners, and brand. Switch live in Template
        Options. Surface stays the medium.
      </:lede>

      <div class="soonex-looks-stage mt-4">
        <p class="soonex-room-specimen m-0">Soonex</p>
        <p class="lede mt-4 max-w-xl">
          This specimen follows the look you pick. No second build for the review.
        </p>
      </div>

      <ol class="soonex-instrument-grid mt-14">
        <li
          :for={room <- rooms()}
          data-theme={room.id}
          data-mode="light"
          class="soonex-instrument-slab"
        >
          <p class="soonex-room-name m-0">{room.id}</p>
          <p class="lede m-0 mt-3">{room.line}</p>
          <p class="m-0 mt-5 text-sm/6 text-ink-muted">{room.use}</p>
        </li>
      </ol>
    </.block>
    """
  end

  defp rooms do
    [
      %{
        id: "neo",
        line: "Cold paper · electric cobalt · geometric display.",
        use: "Default for product launches and investor-facing pages."
      },
      %{
        id: "uno",
        line: "Teal field · razor corners · compressed type.",
        use: "Ops and tooling launches that need quiet confidence."
      },
      %{
        id: "duo",
        line: "Warm surface · rust brand · editorial serif.",
        use: "Studios and cultural brands that want editorial weight."
      },
      %{
        id: "leo",
        line: "Poster ink · signal orange · uppercase.",
        use: "Campaign drops and poster-led announcements."
      }
    ]
  end
end
