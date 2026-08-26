defmodule Soonex.HomePage do
  @moduledoc false

  use Phoenix.Component
  use Corex

  import Soonex.HomePage.Hero, only: [hero: 1]
  import Soonex.HomePage.Socii, only: [socii: 1]
  import Soonex.HomePage.Contents, only: [contents: 1]
  import Soonex.HomePage.Capita, only: [capita: 1]
  import Soonex.HomePage.Officia, only: [officia: 1]
  import Soonex.HomePage.Kalendarium, only: [kalendarium: 1]
  import Soonex.HomePage.Voces, only: [voces: 1]
  import Soonex.HomePage.Numeri, only: [numeri: 1]
  import Soonex.HomePage.Highlights, only: [highlights: 1]
  import Soonex.HomePage.Faq, only: [faq: 1]
  import Soonex.HomePage.Waitlist, only: [waitlist: 1]

  def template(assigns) do
    assigns =
      assigns
      |> Map.put(
        :countdown_ms,
        max(DateTime.diff(~U[2026-09-01 00:00:00Z], DateTime.utc_now(), :millisecond), 0)
      )
      |> Map.put(
        :posts,
        assigns
        |> Map.get(:posts, [])
        |> List.wrap()
      )

    ~H"""
    <div id="home" class="w-full text-ink">
      <.hero countdown_ms={@countdown_ms} />
      <.socii />
      <.contents />
      <.capita />
      <.officia />
      <.kalendarium />
      <.voces />
      <.numeri />
      <.highlights posts={@posts} />
      <.faq />
      <.waitlist />
    </div>
    """
  end
end
