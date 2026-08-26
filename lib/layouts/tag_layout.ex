defmodule Soonex.TagLayout do
  @moduledoc false

  use Tableau.Layout, layout: Soonex.RootLayout
  use Phoenix.Component
  use Corex

  alias Soonex.Layouts.Shell

  def template(assigns) do
    page = assigns.page
    tag = page[:tag] || ""
    posts = page[:posts] || []

    assigns =
      assigns
      |> Map.put(:tag_label, tag)
      |> Map.put(:tag_posts, posts)

    ~H"""
    <article class={"#{Shell.stage()} flex min-h-dvh flex-col gap-space-xl pt-size-xl pb-size-xl"}>
      <nav class="flex flex-wrap items-center gap-space-sm" aria-label="Tag">
        <.navigate to={Soonex.Public.path("/tags")} class="link ui-nav w-fit">
          <.heroicon name="hero-arrow-left" /> All tags
        </.navigate>
      </nav>

      <header class="flex max-w-2xl flex-col gap-space" aria-labelledby="tag-heading">
        <p class={Shell.eyebrow()}>Tag</p>
        <h1
          id="tag-heading"
          class="display m-0 text-balance text-4xl tracking-tighter text-ink sm:text-5xl"
        >
          Posts tagged “<span class="text-brand-text">{@tag_label}</span>”
        </h1>
        <p class="m-0 flex flex-wrap items-center gap-space-sm text-sm text-ink-muted">
          <span>
            {length(@tag_posts)} {if length(@tag_posts) == 1, do: "post", else: "posts"}
          </span>
          <span aria-hidden="true">·</span>
          <.navigate to={Soonex.Public.path("/blog")} class="link ui-brand ui-size-sm">
            All posts
          </.navigate>
        </p>
      </header>

      <ul class="m-0 list-none p-0">
        <li :for={post <- @tag_posts}>
          <.navigate
            to={Soonex.Public.path(post.permalink)}
            class={"#{Shell.listing_row()} link ui-nav text-ink no-underline"}
          >
            <span class="font-mono text-sm tracking-wide text-brand-text">Post</span>
            <span class="min-w-0">
              <span class="display m-0 block text-xl tracking-tight text-ink">{post[:title] ||
                "Untitled"}</span>
              <span :if={post[:description]} class="mt-space-xs block text-sm text-ink-muted">
                {post[:description]}
              </span>
            </span>
            <.heroicon name="hero-arrow-right" />
          </.navigate>
        </li>
      </ul>
    </article>
    """
  end
end
