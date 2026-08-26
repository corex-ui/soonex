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
    <article class={"#{Shell.section()} bg-root"}>
      <div class={"#{Shell.stage()} flex flex-col"}>
        <nav class="flex flex-wrap items-center gap-3" aria-label="Post">
          <.navigate to={Soonex.Public.path("/blog")} class="link ui-nav w-fit">
            <.heroicon name="hero-arrow-left" /> Ad acta
          </.navigate>
        </nav>

        <header
          class={"#{Shell.intro()} mt-10 border-b border-border pb-10"}
          aria-labelledby="post-heading"
        >
          <p :if={@post_date_label} class={Shell.eyebrow()}>{@post_date_label}</p>
          <h1 id="post-heading" class={Shell.page_heading()}>
            {@post_title}
          </h1>
          <p :if={@post_description} class={Shell.lede()}>
            {@post_description}
          </p>
          <div class="mt-6 flex flex-wrap items-center gap-3">
            <ul
              :if={@post_tags != []}
              class="m-0 flex list-none flex-wrap gap-2 p-0"
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

        <div class="typo markdown prose mt-16 max-w-3xl">
          {{:safe, render(@inner_content)}}
        </div>
      </div>
    </article>
    """
  end
end
