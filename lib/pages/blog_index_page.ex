defmodule Soonex.BlogIndexPage do
  @moduledoc false

  use Tableau.Page,
    layout: Soonex.RootLayout,
    permalink: "/blog",
    title: "Blog",
    page_kind: :blog_index,
    sitemap: %{priority: 0.7, changefreq: "weekly"}

  use Phoenix.Component
  use Corex

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
    <article class={"#{Shell.stage()} flex min-h-dvh flex-col gap-space-xl pt-size-xl pb-size-xl"}>
      <nav class="blog__nav" aria-label="Blog">
        <.navigate to={Soonex.Public.path("/")} class="link ui-nav w-fit">
          <.heroicon name="hero-arrow-left" /> Back to home
        </.navigate>
      </nav>

      <header class="blog__hero" aria-labelledby="blog-index-heading">
        <div class="blog__head">
          <p class="blog__eyebrow">Journal</p>
          <h1 id="blog-index-heading" class="blog__display">
            All <span class="blog__display__accent">posts</span>
          </h1>
          <p class="blog__lede">
            Markdown in
            <code class="rounded-md bg-surface px-space-xs py-space-xs text-sm">_posts/</code>
            — compiled by Tableau into static pages you can host anywhere.
          </p>
          <p class="blog__meta">
            <span>
              {@blog_count} {if @blog_count == 1, do: "post", else: "posts"}
            </span>
            <span aria-hidden="true">·</span>
            <.navigate to={Soonex.Public.path("/tags")} class="link ui-brand ui-size-sm">
              Browse tags
            </.navigate>
          </p>
        </div>
      </header>

      <ul :if={@sorted_posts != []} class="blog__grid m-0 list-none p-0">
        <li :for={post <- @sorted_posts}>
          <.navigate to={Soonex.Public.path(post.permalink)} class={"#{Shell.card()}"}>
            <div class="blog__card__top">
              <p :if={post_date_label(post)} class="blog__card__date">{post_date_label(post)}</p>
              <span :if={is_nil(post_date_label(post))}></span>
              <.heroicon name="hero-arrow-right" class="blog__card__arrow" />
            </div>
            <h2 class="blog__card__title">{post[:title] || "Untitled"}</h2>
            <p :if={post[:description]} class="blog__card__excerpt">{post[:description]}</p>
            <ul
              :if={post_tags(post) != []}
              class="m-0 flex list-none flex-wrap gap-space-sm p-0 blog__card__tags"
            >
              <li :for={tag <- post_tags(post)}>
                <span class="badge ui-size-sm">{tag}</span>
              </li>
            </ul>
          </.navigate>
        </li>
      </ul>
      <p :if={@sorted_posts == []} class="m-0 text-ink-muted">
        No posts yet. Add Markdown files to
        <code class="rounded-md bg-surface px-space-xs py-space-xs text-sm">_posts/</code>
        to get started.
      </p>
    </article>
    """
  end

  defp post_date_label(%{date: %DateTime{} = date}), do: Calendar.strftime(date, "%Y-%m-%d")
  defp post_date_label(_), do: nil

  defp post_tags(post) do
    post
    |> Map.get(:tags, [])
    |> List.wrap()
    |> Enum.filter(&is_binary/1)
  end
end
