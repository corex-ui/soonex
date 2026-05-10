defmodule Soonex.HomePage do
  @moduledoc false

  use Phoenix.Component
  use Corex

  import Soonex.HomePage.Hero, only: [hero: 1]
  import Soonex.HomePage.Highlights, only: [highlights: 1]
  import Soonex.HomePage.Scale, only: [scale: 1]
  import Soonex.HomePage.Pricing, only: [pricing: 1]
  import Soonex.HomePage.Faq, only: [faq: 1]
  import Soonex.HomePage.Waitlist, only: [waitlist: 1]

  def template(assigns) do
    assigns =
      assigns
      |> Map.put(
        :countdown_ms,
        max(DateTime.diff(~U[2026-09-01 00:00:00Z], DateTime.utc_now(), :millisecond), 0)
      )
      |> Map.put(:stats_components, length(Corex.component_ids()))

    ~H"""
    <.hero countdown_ms={@countdown_ms} />
    <.highlights />
    <.scale stats_components={@stats_components} />
    <.pricing />
    <.faq />
    <.waitlist />
    """
  end
end
