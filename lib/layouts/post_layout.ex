defmodule Soonex.PostLayout do
  @moduledoc false

  use Tableau.Layout, layout: Soonex.RootLayout
  use Phoenix.Component
  use Corex

  alias Soonex.Layouts.Shell

  def template(assigns) do
    page = assigns.page
    title = page[:title] || "Post"
    description = page[:description]
    date = page[:date]

    date_label =
      case date do
        %DateTime{} -> Calendar.strftime(date, "%Y-%m-%d")
        _ -> nil
      end

    tags =
      page
      |> Map.get(:tags, [])
      |> List.wrap()
      |> Enum.filter(&is_binary/1)

    assigns =
      assigns
      |> Map.put(:post_title, title)
      |> Map.put(:post_description, description)
      |> Map.put(:post_date_label, date_label)
      |> Map.put(:post_tags, tags)

    ~H"""
    <article class={"#{Shell.stage()} flex min-h-dvh flex-col gap-space-xl pt-size-xl pb-size-xl"}>
      <nav class="flex flex-wrap items-center gap-space-sm" aria-label="Post">
        <.navigate to={Soonex.Public.path("/blog")} class="link ui-nav w-fit">
          <.heroicon name="hero-arrow-left" /> Ad acta
        </.navigate>
      </nav>

      <header
        class="flex max-w-2xl flex-col gap-space border-b border-border pb-size"
        aria-labelledby="post-heading"
      >
        <p :if={@post_date_label} class={Shell.eyebrow()}>{@post_date_label}</p>
        <h1
          id="post-heading"
          class="display m-0 text-balance text-4xl tracking-tighter text-ink sm:text-5xl"
        >
          {@post_title}
        </h1>
        <p :if={@post_description} class="m-0 text-pretty text-lg text-ink-muted">
          {@post_description}
        </p>
        <div class="flex flex-wrap items-center gap-space-sm">
          <ul
            :if={@post_tags != []}
            class="m-0 flex list-none flex-wrap gap-space-sm p-0"
          >
            <li :for={tag <- @post_tags}>
              <span class="badge ui-size-sm">{tag}</span>
            </li>
          </ul>
          <.navigate to={Soonex.Public.path("/tags")} class="link ui-brand ui-size-sm">
            Notae
          </.navigate>
        </div>
      </header>

      <div class="typo markdown prose max-w-none">
        {{:safe, render(@inner_content)}}
      </div>
    </article>
    """
  end
end
