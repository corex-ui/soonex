defmodule Soonex.Layouts.Articles do
  @moduledoc false

  use Phoenix.Component
  use Corex

  import Soonex.Layouts.Media, only: [photo: 1]

  alias Soonex.Layouts.Shell

  attr(:posts, :list, required: true)
  attr(:empty, :string, default: "No posts yet.")

  def cards(assigns) do
    ~H"""
    <div :if={@posts == []} class={"#{Shell.panel()} p-8 text-ink-muted"}>
      <p class="m-0">{@empty}</p>
    </div>
    <div
      :if={@posts != []}
      class="grid grid-cols-1 gap-4 sm:grid-cols-2"
      data-soonex-page-list
    >
      <article
        :for={post <- @posts}
        data-soonex-page-item
        class={"#{Shell.panel()} flex flex-col overflow-hidden"}
      >
        <div :if={cover(post)} class="relative aspect-[16/10] overflow-hidden">
          <.photo src={cover(post).src} alt={cover(post).alt} width={1400} height={900} />
        </div>
        <div class="flex flex-1 flex-col p-8">
          <small :if={date_label(post)} class={Shell.eyebrow()}>{date_label(post)}</small>
          <h2 class={Shell.card_title()}>
            <.navigate to={Soonex.Public.path(post.permalink)} class="link ui-nav">
              {post[:title] || "Untitled"}
            </.navigate>
          </h2>
          <p :if={post[:description]} class="lede mt-3 flex-auto">
            {post[:description]}
          </p>
          <div :if={post_tags(post) != []} class="mt-6 flex flex-wrap gap-2">
            <span :for={tag <- post_tags(post)} class="badge ui-size-sm">{tag}</span>
          </div>
        </div>
      </article>
    </div>
    """
  end

  attr(:id, :string, required: true)
  attr(:count, :integer, required: true)
  attr(:page_size, :integer, default: 6)

  def pager(assigns) do
    ~H"""
    <div :if={@count > @page_size} class="mt-12 flex justify-center">
      <.pagination
        id={@id}
        class="pagination ui-brand ui-size-sm"
        count={@count}
        page_size={@page_size}
        type={:button}
        on_page_change_client="pagination-page-changed"
      >
        <:prev_trigger>
          <.heroicon name="hero-chevron-left" />
        </:prev_trigger>
        <:next_trigger>
          <.heroicon name="hero-chevron-right" />
        </:next_trigger>
        <:ellipsis>
          <.heroicon name="hero-ellipsis-horizontal" />
        </:ellipsis>
      </.pagination>
    </div>
    """
  end

  defp cover(post) do
    src = post[:image]

    if is_binary(src) and src != "" do
      %{src: src, alt: post[:image_alt] || post[:title] || "Journal cover"}
    end
  end

  defp date_label(%{date: %DateTime{} = date}), do: Calendar.strftime(date, "%d %B %Y")
  defp date_label(_), do: nil

  defp post_tags(post) do
    post
    |> Map.get(:tags, [])
    |> List.wrap()
    |> Enum.filter(&is_binary/1)
  end
end
