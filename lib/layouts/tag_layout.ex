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
            {@tag_count} {if @tag_count == 1, do: "shipping-log entry", else: "shipping-log entries"}
          </:subtitle>
          <:actions>
            <.navigate to={Soonex.Public.path("/tags")} class="button ui-ghost ui-size-sm">
              <.heroicon name="hero-arrow-left" /> All tags
            </.navigate>
            <.navigate to={Soonex.Public.path("/blog")} class="button ui-ghost ui-size-sm">
              Log
            </.navigate>
          </:actions>
        </.layout_heading>

        <div class="mt-16" data-soonex-page="soonex-tag-pagination" data-soonex-page-size="3">
          <.cards posts={@tag_posts} />
          <.pager id="soonex-tag-pagination" count={@tag_count} page_size={3} />
        </div>
      </div>
    </article>
    """
  end
end
