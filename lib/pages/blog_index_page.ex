defmodule Soonex.BlogIndexPage do
  @moduledoc false

  use Tableau.Page,
    layout: Soonex.RootLayout,
    permalink: "/blog",
    title: "Acta",
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
      <nav class="flex flex-wrap items-center gap-space-sm" aria-label="Blog">
        <.navigate to={Soonex.Public.path("/")} class="link ui-nav w-fit">
          <.heroicon name="hero-arrow-left" /> Ad initium
        </.navigate>
      </nav>

      <header class="flex max-w-2xl flex-col gap-space" aria-labelledby="blog-index-heading">
        <p class={Shell.eyebrow()}>Acta</p>
        <h1
          id="blog-index-heading"
          class="display m-0 text-balance text-4xl tracking-tighter text-ink sm:text-5xl"
        >
          Omnia <span class="text-brand-text">scripta</span>
        </h1>
        <p class="m-0 max-w-xl text-pretty text-lg text-ink-muted">
          Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
        </p>
        <p class="m-0 flex flex-wrap items-center gap-space-sm text-sm text-ink-muted">
          <span>
            {@blog_count} {if @blog_count == 1, do: "post", else: "posts"}
          </span>
          <span aria-hidden="true">·</span>
          <.navigate to={Soonex.Public.path("/tags")} class="link ui-brand ui-size-sm">
            Notae
          </.navigate>
        </p>
      </header>

      <ul :if={@sorted_posts != []} class="m-0 list-none p-0">
        <li :for={post <- @sorted_posts}>
          <.navigate
            to={Soonex.Public.path(post.permalink)}
            class={"#{Shell.listing_row()} link ui-nav text-ink no-underline"}
          >
            <span class="font-mono text-sm tracking-wide text-brand-text">
              {post_date_label(post) || "Post"}
            </span>
            <span class="min-w-0">
              <span class="display m-0 block text-xl tracking-tight text-ink">{post[:title] ||
                "Untitled"}</span>
              <span :if={post[:description]} class="mt-space-xs block text-sm text-ink-muted">
                {post[:description]}
              </span>
              <span
                :if={post_tags(post) != []}
                class="mt-space flex flex-wrap gap-space-sm"
              >
                <span :for={tag <- post_tags(post)} class="badge ui-size-sm">{tag}</span>
              </span>
            </span>
            <.heroicon name="hero-arrow-right" />
          </.navigate>
        </li>
      </ul>
      <p :if={@sorted_posts == []} class="m-0 text-ink-muted">
        Lorem ipsum dolor sit amet — nulla acta adhuc.
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
