defmodule Soonex.HomePage.Highlights do
  @moduledoc false

  use Phoenix.Component
  use Corex

  import Soonex.Layouts.Rows, only: [data_rows: 1]
  import Soonex.Layouts.Section, only: [block: 1]

  alias Soonex.Layouts.Rows

  attr(:posts, :list, default: [])

  def highlights(assigns) do
    posts =
      assigns.posts
      |> List.wrap()
      |> Enum.sort_by(& &1[:date], {:desc, DateTime})
      |> Enum.take(3)

    assigns = assign(assigns, :highlight_items, Rows.from_posts(posts))

    ~H"""
    <.block id="acta" labelledby="soonex-highlights-heading" eyebrow="Acta" tone={:surface}>
      <:title>
        Recentiora <span class="text-brand-text">scripta</span>
      </:title>
      <:lede>
        Quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur.
      </:lede>
      <:actions>
        <.navigate to={Soonex.Public.path("/blog")} class="link ui-brand">
          Omnia acta <.heroicon name="hero-arrow-up-right" />
        </.navigate>
      </:actions>
      <.data_rows id="soonex-acta-list" items={@highlight_items} />
    </.block>
    """
  end
end
