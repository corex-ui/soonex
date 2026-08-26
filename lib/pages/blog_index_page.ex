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

  import Soonex.Layouts.Rows, only: [data_rows: 1]

  alias Soonex.Layouts.Rows
  alias Soonex.Layouts.Shell

  def template(assigns) do
    posts =
      assigns
      |> Map.get(:posts, [])
      |> Enum.sort_by(& &1[:date], {:desc, DateTime})

    assigns =
      assigns
      |> Map.put(:sorted_items, Rows.from_posts(posts))
      |> Map.put(:blog_count, length(posts))

    ~H"""
    <article class={"#{Shell.section()} bg-root"}>
      <div class={Shell.stage()}>
        <nav class="flex flex-wrap items-center gap-3" aria-label="Blog">
          <.navigate to={Soonex.Public.path("/")} class="link ui-nav w-fit">
            <.heroicon name="hero-arrow-left" /> Ad initium
          </.navigate>
        </nav>

        <div class={"#{Shell.sticky_grid()} mt-10"}>
          <header class={Shell.sticky_intro()} aria-labelledby="blog-index-heading">
            <p class={Shell.eyebrow()}>Acta</p>
            <h1 id="blog-index-heading" class={Shell.page_heading()}>
              Omnia <span class="text-brand-text">scripta</span>
            </h1>
            <p class={Shell.lede()}>
              Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
            </p>
            <p class="mt-6 flex flex-wrap items-center gap-3 text-sm/6 text-ink-muted">
              <span>
                {@blog_count} {if @blog_count == 1, do: "post", else: "posts"}
              </span>
              <span aria-hidden="true">·</span>
              <.navigate to={Soonex.Public.path("/tags")} class="link ui-brand ui-size-sm">
                Notae
              </.navigate>
            </p>
          </header>

          <div class={Shell.sticky_body()}>
            <.data_rows id="soonex-blog-list" items={@sorted_items} />
          </div>
        </div>
      </div>
    </article>
    """
  end
end
