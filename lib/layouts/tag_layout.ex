defmodule Soonex.TagLayout do
  @moduledoc false

  use Tableau.Layout, layout: Soonex.RootLayout
  use Phoenix.Component
  use Corex

  import Soonex.Layouts.Rows, only: [data_rows: 1]

  alias Soonex.Layouts.Rows
  alias Soonex.Layouts.Shell

  def template(assigns) do
    page = assigns.page
    tag = page[:tag] || ""
    posts = page[:posts] || []

    assigns =
      assigns
      |> Map.put(:tag_label, tag)
      |> Map.put(:tag_items, Rows.from_posts(posts))
      |> Map.put(:tag_count, length(posts))

    ~H"""
    <article class={"#{Shell.section()} bg-root"}>
      <div class={Shell.stage()}>
        <nav class="flex flex-wrap items-center gap-3" aria-label="Tag">
          <.navigate to={Soonex.Public.path("/tags")} class="link ui-nav w-fit">
            <.heroicon name="hero-arrow-left" /> Omnes notae
          </.navigate>
        </nav>

        <div class={"#{Shell.sticky_grid()} mt-10"}>
          <header class={Shell.sticky_intro()} aria-labelledby="tag-heading">
            <p class={Shell.eyebrow()}>Nota</p>
            <h1 id="tag-heading" class={Shell.page_heading()}>
              Acta notata “<span class="text-brand-text">{@tag_label}</span>”
            </h1>
            <p class="mt-6 flex flex-wrap items-center gap-3 text-sm/6 text-ink-muted">
              <span>
                {@tag_count} {if @tag_count == 1, do: "post", else: "posts"}
              </span>
              <span aria-hidden="true">·</span>
              <.navigate to={Soonex.Public.path("/blog")} class="link ui-brand ui-size-sm">
                Omnia acta
              </.navigate>
            </p>
          </header>

          <div class={Shell.sticky_body()}>
            <.data_rows id="soonex-tag-posts" items={@tag_items} />
          </div>
        </div>
      </div>
    </article>
    """
  end
end
