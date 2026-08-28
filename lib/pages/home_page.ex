defmodule Soonex.HomePage do
  @moduledoc false

  use Phoenix.Component
  use Corex

  import Soonex.HomePage.Hero, only: [hero: 1]
  import Soonex.HomePage.Contents, only: [contents: 1]
  import Soonex.HomePage.Capita, only: [capita: 1]
  import Soonex.HomePage.Officia, only: [officia: 1]
  import Soonex.HomePage.Voces, only: [voces: 1]
  import Soonex.HomePage.Faq, only: [faq: 1]
  import Soonex.HomePage.Waitlist, only: [waitlist: 1]

  def template(assigns) do
    ~H"""
    <div id="home" class="w-full text-ink">
      <.hero />
      <.contents />
      <.capita />
      <.voces />
      <.officia />
      <.faq />
      <.waitlist />
    </div>
    """
  end
end
