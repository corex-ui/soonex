defmodule Soonex.HomePage.Stats do
  @moduledoc false

  use Phoenix.Component

  import Soonex.Layouts.Section, only: [block: 1]

  alias Soonex.Layouts.Shell

  def stats(assigns) do
    ~H"""
    <.block
      id="stats"
      section="stats"
      labelledby="soonex-stats-heading"
      eyebrow="Numbers"
      tone={:surface}
      align={:center}
      compact
    >
      <:title>
        Small surface. <span class="soonex-accent">Finished chrome.</span>
      </:title>
      <:lede>
        Counts you can stand behind when you fork the template. Replace them when you have real ones.
      </:lede>
      <dl class="soonex-stats grid grid-cols-1 gap-4 sm:grid-cols-2 lg:grid-cols-4">
        <div
          :for={{stat, caption} <- stat_items()}
          class={"#{Shell.panel()} flex flex-col-reverse gap-y-2 px-6 py-10 text-center"}
        >
          <dt class="text-sm/6 text-ink-muted">{caption}</dt>
          <dd class="display m-0 text-4xl font-semibold tracking-tight text-ink">{stat}</dd>
        </div>
      </dl>
    </.block>
    """
  end

  defp stat_items do
    [
      {"4", "Theme skins"},
      {"5", "Waitlist fields"},
      {Soonex.Launch.label(), "Launch day"},
      {"0", "npm packages"}
    ]
  end
end
