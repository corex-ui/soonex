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
      eyebrow="Numbers"
      tone={:surface}
      align={:center}
      compact
    >
      <:title>
        Lorem ipsum <span class="text-brand-text">dolor sit</span>
      </:title>
      <:lede>
        Consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
      </:lede>
      <dl class="grid grid-cols-1 gap-4 sm:grid-cols-2 lg:grid-cols-4">
        <div
          :for={{stat, caption} <- stats()}
          class={"#{Shell.panel()} flex flex-col-reverse gap-y-2 px-6 py-10 text-center"}
        >
          <dt class="text-sm/6 text-ink-muted">{caption}</dt>
          <dd class="display m-0 text-4xl font-semibold tracking-tight text-ink">{stat}</dd>
        </div>
      </dl>
    </.block>
    """
  end

  defp stats do
    [
      {"128", "Lorem ipsum"},
      {"24", "Dolor sit amet"},
      {"1 Sep", "Consectetur"},
      {"6", "Adipiscing elit"}
    ]
  end
end
