defmodule Soonex.HomePage.Numeri do
  @moduledoc false

  use Phoenix.Component

  import Soonex.Layouts.Section, only: [block: 1]

  def numeri(assigns) do
    ~H"""
    <.block
      id="numeri"
      labelledby="soonex-numeri-heading"
      eyebrow="Numeri"
      tone={:root}
      align={:center}
      compact
    >
      <:title>
        Summa <span class="text-brand-text">rerum</span>
      </:title>
      <:lede>
        Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur.
      </:lede>
      <dl class="grid grid-cols-1 gap-px overflow-hidden border border-border bg-border sm:grid-cols-2 lg:grid-cols-4">
        <div
          :for={{stat, caption} <- stats()}
          class="flex flex-col-reverse gap-y-2 bg-surface px-6 py-10 text-center"
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
      {"XII mil.", "Lorem lecti"},
      {"48h", "Ipsum cursus"},
      {"99%", "Dolor ratio"},
      {"IV", "Capita aperta"}
    ]
  end
end
