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
      <nav class="blog__nav" aria-label="Tag">
        <.navigate to={Soonex.Public.path("/tags")} class="link ui-nav w-fit">
          <.heroicon name="hero-arrow-left" /> All tags
        </.navigate>
      </nav>

      <header class="blog__hero" aria-labelledby="tag-heading">
        <div class="blog__head">
          <p class="blog__eyebrow">Tag</p>
          <h1 id="tag-heading" class="blog__display">
            Posts tagged “<span class="blog__display__accent">{@tag_label}</span>”
          </h1>
          <p class="blog__meta">
            <span>
              {length(@tag_posts)} {if length(@tag_posts) == 1, do: "post", else: "posts"}
            </span>
            <span aria-hidden="true">·</span>
            <.navigate to={Soonex.Public.path("/blog")} class="link ui-brand ui-size-sm">
              All posts
            </.navigate>
          </p>
        </div>
      </header>

      <ul class="blog__grid m-0 list-none p-0">
        <li :for={post <- @tag_posts}>
          <.navigate to={Soonex.Public.path(post.permalink)} class={"#{Shell.card()}"}>
            <div class="blog__card__top">
              <span></span>
              <.heroicon name="hero-arrow-right" class="blog__card__arrow" />
            </div>
            <h2 class="blog__card__title">{post[:title] || "Untitled"}</h2>
            <p :if={post[:description]} class="blog__card__excerpt">{post[:description]}</p>
          </.navigate>
        </li>
      </ul>
    </article>
    """
  end
end
