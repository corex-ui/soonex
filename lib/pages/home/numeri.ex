defmodule Soonex.HomePage.Numeri do
  @moduledoc false

  use Phoenix.Component
  use Corex

  import Soonex.Layouts.Section, only: [block: 1]

  alias Soonex.Layouts.Shell

  def numeri(assigns) do
    ~H"""
    <.block
      id="numeri"
      labelledby="soonex-numeri-heading"
      eyebrow="Facts"
      tone={:surface}
      compact
    >
      <:title>
        What is actually <span class="text-brand-text">true</span>
      </:title>
      <:lede>
        No vanity counters. These are the numbers this template ships with.
      </:lede>
      <.data_list class={Shell.data_list()} items={facts()} />
    </.block>
    """
  end

  defp facts do
    Corex.Content.new([
      %{label: "Themes", content: "4 — neo, uno, duo, leo"},
      %{label: "Journal", content: "6 shipping-log posts"},
      %{label: "npm", content: "0 — Mix, Tailwind, esbuild"},
      %{label: "Launch", content: "1 September"}
    ])
  end
end
