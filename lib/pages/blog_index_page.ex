defmodule Soonex.BlogIndexPage do
  @moduledoc false

  use Tableau.Page,
    layout: Soonex.RootLayout,
    permalink: "/blog",
    title: "Journal",
    page_kind: :blog_index,
    sitemap: %{priority: 0.7, changefreq: "weekly"}

  use Phoenix.Component
  use Corex

  import Soonex.Layouts.Articles, only: [cards: 1, pager: 1]

  alias Soonex.Layouts.Shell

  def template(assigns) do
    posts =
      assigns
      |> Map.get(:posts, [])
      |> Enum.sort_by(& &1[:date], {:desc, DateTime})

    assigns =
      assigns
      |> Map.put(:sorted_posts, posts)
      |> Map.put(:blog_count, length(posts))

    ~H"""
    <article class={"#{Shell.section()} bg-root"}>
      <div class={Shell.stage()}>
        <.layout_heading class="layout-heading" subtitle_tag="p">
          <:title>Journal</:title>
          <:subtitle>
            Shipping notes for the Corex waitlist template — {@blog_count}
            {if @blog_count == 1, do: "post", else: "posts"}.
          </:subtitle>
          <:actions>
            <.navigate to={Soonex.Public.path("/")} class="button ui-ghost ui-size-sm">
              <.heroicon name="hero-arrow-left" /> Home
            </.navigate>
            <.navigate to={Soonex.Public.path("/tags")} class="button ui-ghost ui-size-sm">
              Tags
            </.navigate>
          </:actions>
        </.layout_heading>

        <div class="mt-16" data-soonex-page="soonex-blog-pagination" data-soonex-page-size="3">
          <.cards posts={@sorted_posts} />
          <.pager id="soonex-blog-pagination" count={@blog_count} page_size={3} />
        </div>
      </div>
    </article>
    """
  end
end
