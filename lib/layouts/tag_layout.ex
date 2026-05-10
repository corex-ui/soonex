defmodule Soonex.TagLayout do
  @moduledoc false

  use Tableau.Layout, layout: Soonex.RootLayout
  use Phoenix.Component
  use Corex

  def template(assigns) do
    page = assigns.page
    tag = page[:tag] || ""
    posts = page[:posts] || []

    assigns =
      assigns
      |> Map.put(:tag_label, tag)
      |> Map.put(:tag_posts, posts)

    ~H"""
    <article class="flex min-h-dvh flex-col px-space py-size-xl">
      <div class="mx-auto flex w-full max-w-3xl flex-col gap-space-lg">
        <.navigate to={Soonex.Public.path("/tags")} class="link link--accent w-fit">
          All tags
        </.navigate>
        <header class="flex flex-col gap-space-sm border-b border-border pb-space-lg">
          <h1 class="m-0">Posts tagged “{@tag_label}”</h1>
          <p class="m-0 max-w-prose text-ink-muted">
            {length(@tag_posts)} {if length(@tag_posts) == 1, do: "post", else: "posts"}
          </p>
        </header>
        <ul class="m-0 flex list-none flex-col gap-space-sm p-0">
          <li :for={post <- @tag_posts}>
            <.navigate to={Soonex.Public.path(post.permalink)} class="link link--accent">
              {post[:title] || "Untitled"}
            </.navigate>
          </li>
        </ul>
      </div>
    </article>
    """
  end
end
