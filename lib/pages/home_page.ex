defmodule Soonex.HomePage do
  @moduledoc false

  use Phoenix.Component
  use Corex

  import Soonex.HomePage.Hero, only: [hero: 1]
  import Soonex.HomePage.Logos, only: [logos: 1]
  import Soonex.HomePage.Showcase, only: [showcase: 1]
  import Soonex.HomePage.Features, only: [features: 1]
  import Soonex.HomePage.HowItWorks, only: [how_it_works: 1]
  import Soonex.HomePage.Pricing, only: [pricing: 1]
  import Soonex.HomePage.Journal, only: [journal: 1]
  import Soonex.HomePage.Faq, only: [faq: 1]
  import Soonex.HomePage.Waitlist, only: [waitlist: 1]

  def template(assigns) do
    assigns =
      assigns
      |> Map.put(:posts, assigns |> Map.get(:posts, []) |> List.wrap())

    ~H"""
    <div id="home" class="w-full text-ink">
      <.hero />
      <.logos />
      <.showcase />
      <.features />
      <.how_it_works />
      <.pricing />
      <.journal posts={@posts} />
      <.faq />
      <.waitlist />
    </div>
    """
  end
end
