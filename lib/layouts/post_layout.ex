defmodule Soonex.PostLayout do
  @moduledoc false

  use Tableau.Layout, layout: Soonex.RootLayout
  use Phoenix.Component
  use Corex

  import Soonex.Layouts.Media, only: [photo: 1]

  alias Soonex.Layouts.Shell

  def template(assigns) do
    page = assigns.page
    title = page[:title] || "Post"
    description = page[:description]
    date = page[:date]

    date_label =
      case date do
        %DateTime{} -> Calendar.strftime(date, "%d %B %Y")
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
      |> Map.put(:post_cover, cover(page))

    ~H"""
    <article class={"#{Shell.section()} bg-root"}>
      <div class={Shell.stage()}>
        <.layout_heading class="layout-heading" subtitle_tag="p">
          <:title>{@post_title}</:title>
          <:subtitle>
            <span :if={@post_date_label}>{@post_date_label}</span>
            <span :if={@post_date_label && @post_description}> · </span>
            <span :if={@post_description}>{@post_description}</span>
          </:subtitle>
          <:actions>
            <.navigate to={Soonex.Public.path("/blog")} class="button ui-ghost ui-size-sm">
              <.heroicon name="hero-arrow-left" /> Journal
            </.navigate>
          </:actions>
        </.layout_heading>

        <div :if={@post_tags != []} class="mt-8 flex flex-wrap items-center gap-3">
          <ul class="m-0 flex list-none flex-wrap gap-2 p-0">
            <li :for={tag <- @post_tags}>
              <span class="badge ui-size-sm">{tag}</span>
            </li>
          </ul>
          <.navigate to={Soonex.Public.path("/tags")} class="link ui-brand ui-size-sm">
            All tags
          </.navigate>
        </div>

        <div :if={@post_cover} class={"#{Shell.frame()} mt-12 overflow-hidden"}>
          <div class="relative aspect-[2/1]">
            <.photo src={@post_cover.src} alt={@post_cover.alt} width={1400} height={700} />
          </div>
        </div>

        <div class="typo markdown prose mt-12 min-w-0 max-w-3xl">
          {{:safe, render(@inner_content)}}
        </div>
      </div>
    </article>
    """
  end

  defp cover(page) do
    src = page[:image]

    if is_binary(src) and src != "" do
      %{src: src, alt: page[:image_alt] || page[:title] || "Journal cover"}
    end
  end
end
