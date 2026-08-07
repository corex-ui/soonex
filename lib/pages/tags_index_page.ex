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

  alias Soonex.Layouts.Shell

  def template(assigns) do
    tags = Map.get(assigns, :tags, %{})

    sorted =
      tags
      |> Map.to_list()
      |> Enum.sort_by(fn {_tag, posts} -> length(posts) end, :desc)

    assigns = Map.put(assigns, :sorted_tags, sorted)

    ~H"""
    <article class={"#{Shell.stage()} flex min-h-dvh flex-col gap-space-xl pt-size-xl pb-size-xl"}>
      <nav class="blog__nav" aria-label="Tags">
        <.navigate to={Soonex.Public.path("/blog")} class="link ui-nav w-fit">
          <.heroicon name="hero-arrow-left" /> Back to blog
        </.navigate>
      </nav>

      <header class="blog__hero" aria-labelledby="tags-heading">
        <div class="blog__head">
          <p class="blog__eyebrow">Blog</p>
          <h1 id="tags-heading" class="blog__display">
            Browse <span class="blog__display__accent">tags</span>
          </h1>
          <p class="blog__lede">
            Browse topics across your posts. Every tag is a static Tableau page.
          </p>
          <p class="blog__meta">
            <.navigate to={Soonex.Public.path("/blog")} class="link ui-brand ui-size-sm">
              All posts
            </.navigate>
          </p>
        </div>
      </header>

      <ul
        :if={@sorted_tags != []}
        class="blog__grid m-0 list-none p-0"
        aria-label="All tags"
      >
        <li :for={{tag, posts} <- @sorted_tags}>
          <.navigate to={Soonex.Public.path(tag.permalink)} class={"#{Shell.card()}"}>
            <div class="blog__card__top">
              <p class="blog__card__date">
                {length(posts)} {if length(posts) == 1, do: "post", else: "posts"}
              </p>
              <.heroicon name="hero-arrow-right" class="blog__card__arrow" />
            </div>
            <h2 class="blog__card__title">{tag.tag}</h2>
            <p class="blog__card__excerpt">
              View all posts tagged with {tag.tag}.
            </p>
          </.navigate>
        </li>
      </ul>

      <p :if={@sorted_tags == []} class="m-0 text-ink-muted">
        No tags yet. Add a <code class="rounded-md bg-surface px-space-xs py-space-xs text-sm">tags:</code>
        list to post front matter.
      </p>
    </article>
    """
  end
end
