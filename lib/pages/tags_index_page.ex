defmodule Soonex.TagsIndexPage do
  @moduledoc false

  use Tableau.Page,
    layout: Soonex.RootLayout,
    permalink: "/tags",
    title: "Notae",
    page_kind: :tags_index,
    sitemap: %{priority: 0.5, changefreq: "weekly"}

  use Phoenix.Component
  use Corex

  import Soonex.Layouts.Rows, only: [data_rows: 1]

  alias Soonex.Layouts.Shell

  def template(assigns) do
    tags = Map.get(assigns, :tags, %{})

    items =
      tags
      |> Map.to_list()
      |> Enum.sort_by(fn {_tag, posts} -> length(posts) end, :desc)
      |> Enum.map(fn {tag, posts} ->
        count = length(posts)

        %{
          label: "#{count}",
          content: if(count == 1, do: "post", else: "posts"),
          meta: %{
            href: Soonex.Public.path(tag.permalink),
            title: tag.tag
          }
        }
      end)
      |> Corex.Content.new()

    assigns = Map.put(assigns, :tag_items, items)

    ~H"""
    <article class={"#{Shell.section()} bg-root"}>
      <div class={"#{Shell.stage()} flex flex-col"}>
        <nav class="flex flex-wrap items-center gap-3" aria-label="Tags">
          <.navigate to={Soonex.Public.path("/blog")} class="link ui-nav w-fit">
            <.heroicon name="hero-arrow-left" /> Ad acta
          </.navigate>
        </nav>

        <header class={"#{Shell.intro()} mt-10"} aria-labelledby="tags-heading">
          <p class={Shell.eyebrow()}>Notae</p>
          <h1 id="tags-heading" class={Shell.page_heading()}>
            Omnes <span class="text-brand-text">notae</span>
          </h1>
          <p class={Shell.lede()}>
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt.
          </p>
          <p class="mt-6 text-sm/6">
            <.navigate to={Soonex.Public.path("/blog")} class="link ui-brand ui-size-sm">
              Omnia acta
            </.navigate>
          </p>
        </header>

        <div class={Shell.body()}>
          <.data_rows
            id="soonex-tags-list"
            items={@tag_items}
            empty="Lorem ipsum — nullae notae."
          />
        </div>
      </div>
    </article>
    """
  end
end
