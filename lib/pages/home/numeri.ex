defmodule Soonex.HomePage.Numeri do
  @moduledoc false

  use Phoenix.Component

  import Soonex.Layouts.Section, only: [block: 1]

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
        Small surface, <span class="text-brand-text">full overlay</span>
      </:title>
      <:lede>
        What you get when you fork the template — not vanity metrics.
      </:lede>
      <dl class="grid grid-cols-1 gap-px overflow-hidden border border-border bg-border sm:grid-cols-2 lg:grid-cols-4">
        <div
          :for={{stat, caption} <- stats()}
          class="flex flex-col-reverse gap-y-2 bg-root px-6 py-10 text-center"
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
      {"4", "Theme overlays"},
      {"0", "npm packages for Corex"},
      {"1 Sep", "Public launch"},
      {"6", "Accessibility axes"}
    ]
  end
end
