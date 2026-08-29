defmodule Soonex.TagsIndexPage do
  @moduledoc false

  use Tableau.Page,
    layout: Soonex.RootLayout,
    permalink: "/tags",
    title: "Tags",
    page_kind: :tags_index,
    sitemap: %{priority: 0.5, changefreq: "weekly"}

  use Phoenix.Component
  use Corex

  import Soonex.Layouts.Articles, only: [pager: 1]

  alias Soonex.Layouts.Shell

  def template(assigns) do
    tags = Map.get(assigns, :tags, %{})

    tag_cards =
      tags
      |> Map.to_list()
      |> Enum.sort_by(fn {_tag, posts} -> length(posts) end, :desc)
      |> Enum.map(fn {tag, posts} ->
        %{
          label: tag.tag,
          href: Soonex.Public.path(tag.permalink),
          count: length(posts)
        }
      end)

    assigns = Map.put(assigns, :tag_cards, tag_cards)

    ~H"""
    <article class={"#{Shell.section()} bg-root"}>
      <div class={Shell.stage()}>
        <.layout_heading class="layout-heading" subtitle_tag="p">
          <:title>Tags</:title>
          <:subtitle>Browse the shipping log by theme, launch, studio, and notes.</:subtitle>
          <:actions>
            <.navigate to={Soonex.Public.path("/blog")} class="button ui-ghost ui-size-sm">
              <.heroicon name="hero-arrow-left" /> Log
            </.navigate>
          </:actions>
        </.layout_heading>

        <div class="mt-16" data-soonex-page="soonex-tags-pagination" data-soonex-page-size="6">
          <div :if={@tag_cards == []} class={"#{Shell.panel()} p-8 text-ink-muted"}>
            <p class="m-0">No tags yet.</p>
          </div>
          <ol
            :if={@tag_cards != []}
            class={Shell.log_list()}
            data-soonex-page-list
          >
            <li
              :for={tag <- @tag_cards}
              data-soonex-page-item
              class="flex items-baseline justify-between gap-6 py-6 first:pt-0"
            >
              <h2 class={"#{Shell.card_title()} m-0"}>
                <.navigate to={tag.href} class="link ui-nav">{tag.label}</.navigate>
              </h2>
              <p class="lede m-0">
                {tag.count} {if tag.count == 1, do: "entry", else: "entries"}
              </p>
            </li>
          </ol>
          <.pager id="soonex-tags-pagination" count={length(@tag_cards)} page_size={6} />
        </div>
      </div>
    </article>
    """
  end
end
