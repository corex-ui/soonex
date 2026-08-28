defmodule Soonex.HomePage.Numeri do
  @moduledoc false

  use Phoenix.Component

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
      <div class={Shell.stat_grid()}>
        <article :for={fact <- facts()} class={Shell.stat()}>
          <p class="m-0">
            <small class="eyebrow">{fact.label}</small>
          </p>
          <p class="soonex-stat-value m-0">{fact.value}</p>
          <p class="lede m-0">{fact.detail}</p>
        </article>
      </div>
    </.block>
    """
  end

  defp facts do
    [
      %{label: "Themes", value: "4", detail: "neo, uno, duo, leo"},
      %{label: "Journal", value: "6", detail: "Shipping-log posts"},
      %{label: "npm", value: "0", detail: "Mix, Tailwind, esbuild"},
      %{label: "Launch", value: "1 Sep", detail: "Countdown target"}
    ]
  end
end
