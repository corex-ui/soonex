defmodule Soonex.TagLayout do
  @moduledoc false

  use Tableau.Layout, layout: Soonex.RootLayout
  use Phoenix.Component
  use Corex

  import Soonex.Layouts.Articles, only: [cards: 1, pager: 1]

  alias Soonex.Layouts.Shell

  def template(assigns) do
    page = assigns.page
    tag = page[:tag] || ""
    posts = page[:posts] || []

    assigns =
      assigns
      |> Map.put(:tag_label, tag)
      |> Map.put(:tag_posts, posts)
      |> Map.put(:tag_count, length(posts))

    ~H"""
    <article class={"#{Shell.section()} bg-root"}>
      <div class={Shell.stage()}>
        <.layout_heading class="layout-heading" subtitle_tag="p">
          <:title>{@tag_label}</:title>
          <:subtitle>
            {@tag_count} {if @tag_count == 1, do: "post", else: "posts"} tagged in the journal
          </:subtitle>
          <:actions>
            <.navigate to={Soonex.Public.path("/tags")} class="button ui-ghost ui-size-sm">
              <.heroicon name="hero-arrow-left" /> All tags
            </.navigate>
            <.navigate to={Soonex.Public.path("/blog")} class="button ui-ghost ui-size-sm">
              Journal
            </.navigate>
          </:actions>
        </.layout_heading>

        <div class="mt-16">
          <.cards posts={@tag_posts} />
          <.pager id="soonex-tag-pagination" count={@tag_count} page_size={1} />
        </div>
      </div>
    </article>
    """
  end
end
