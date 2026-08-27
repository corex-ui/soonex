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
          <:subtitle>Browse the journal by topic</:subtitle>
          <:actions>
            <.navigate to={Soonex.Public.path("/blog")} class="button ui-ghost ui-size-sm">
              <.heroicon name="hero-arrow-left" /> Journal
            </.navigate>
          </:actions>
        </.layout_heading>

        <div class="mt-16">
          <div :if={@tag_cards == []} class={"#{Shell.panel()} p-8 text-ink-muted"}>
            <p class="m-0">No tags yet.</p>
          </div>
          <div
            :if={@tag_cards != []}
            class="grid grid-cols-1 gap-px overflow-hidden border border-border bg-border sm:grid-cols-2 lg:grid-cols-3"
          >
            <article :for={tag <- @tag_cards} class="flex flex-col bg-surface p-8">
              <h2 class="display m-0 text-xl font-semibold tracking-tight text-ink">
                <.navigate to={tag.href} class="link ui-nav">{tag.label}</.navigate>
              </h2>
              <p class="mt-3 text-sm/6 text-ink-muted">
                {tag.count} {if tag.count == 1, do: "post", else: "posts"}
              </p>
            </article>
          </div>
          <.pager id="soonex-tags-pagination" count={length(@tag_cards)} page_size={6} />
        </div>
      </div>
    </article>
    """
  end
end
