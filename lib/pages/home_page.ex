defmodule Soonex.HomePage do
  @moduledoc false

  use Phoenix.Component
  use Corex

  import Soonex.HomePage.Hero, only: [hero: 1]
  import Soonex.HomePage.MarqueeBand, only: [marquee_band: 1]
  import Soonex.HomePage.Bento, only: [bento: 1]
  import Soonex.HomePage.Product, only: [product: 1]
  import Soonex.HomePage.Themes, only: [themes: 1]
  import Soonex.HomePage.Notes, only: [notes: 1]
  import Soonex.HomePage.Log, only: [log: 1]
  import Soonex.HomePage.Faq, only: [faq: 1]
  import Soonex.HomePage.Waitlist, only: [waitlist: 1]

  def template(assigns) do
    assigns = Map.put(assigns, :log_posts, posts(assigns))

    ~H"""
    <div id="home" class="w-full text-ink">
      <.hero />
      <.marquee_band />
      <.bento />
      <.product />
      <.themes />
      <.notes />
      <.log posts={@log_posts} />
      <.faq />
      <.waitlist />
    </div>
    """
  end

  defp posts(assigns) do
    cond do
      is_list(assigns[:posts]) -> assigns.posts
      is_map(assigns[:page]) and is_list(assigns.page[:posts]) -> assigns.page.posts
      true -> []
    end
  end
end
