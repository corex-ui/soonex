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
      <nav class="flex flex-wrap items-center gap-space-sm" aria-label="Tags">
        <.navigate to={Soonex.Public.path("/blog")} class="link ui-nav w-fit">
          <.heroicon name="hero-arrow-left" /> Ad acta
        </.navigate>
      </nav>

      <header class="flex max-w-2xl flex-col gap-space" aria-labelledby="tags-heading">
        <p class={Shell.eyebrow()}>Notae</p>
        <h1
          id="tags-heading"
          class="display m-0 text-balance text-4xl tracking-tighter text-ink sm:text-5xl"
        >
          Omnes <span class="text-brand-text">notae</span>
        </h1>
        <p class="m-0 max-w-xl text-pretty text-lg text-ink-muted">
          Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt.
        </p>
        <p class="m-0 text-sm">
          <.navigate to={Soonex.Public.path("/blog")} class="link ui-brand ui-size-sm">
            Omnia acta
          </.navigate>
        </p>
      </header>

      <ul
        :if={@sorted_tags != []}
        class="m-0 list-none p-0"
        aria-label="All tags"
      >
        <li :for={{tag, posts} <- @sorted_tags}>
          <.navigate
            to={Soonex.Public.path(tag.permalink)}
            class={"#{Shell.listing_row()} link ui-nav text-ink no-underline"}
          >
            <span class="font-mono text-sm tracking-wide text-brand-text">
              {length(posts)} {if length(posts) == 1, do: "post", else: "posts"}
            </span>
            <span class="display m-0 text-xl tracking-tight text-ink">{tag.tag}</span>
            <.heroicon name="hero-arrow-right" />
          </.navigate>
        </li>
      </ul>

      <p :if={@sorted_tags == []} class="m-0 text-ink-muted">
        Lorem ipsum — nullae notae.
      </p>
    </article>
    """
  end
end
