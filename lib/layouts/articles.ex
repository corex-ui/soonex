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
    <p :if={@posts == []} class="m-0 text-ink-muted">{@empty}</p>
    <ol
      :if={@posts != []}
      class={Shell.log_list()}
      data-soonex-page-list
    >
      <li
        :for={post <- @posts}
        data-soonex-page-item
        class="grid grid-cols-1 gap-6 py-8 first:pt-0 sm:grid-cols-12 sm:items-start"
      >
        <div
          :if={cover(post)}
          class={"#{Shell.frame()} relative aspect-[16/10] overflow-hidden sm:col-span-4"}
        >
          <.photo
            src={cover(post).src}
            alt={cover(post).alt}
            width={800}
            height={500}
          />
        </div>
        <div class={if cover(post), do: "sm:col-span-8", else: "sm:col-span-12"}>
          <small :if={date_label(post)} class={Shell.eyebrow()}>{date_label(post)}</small>
          <h2 class={"#{Shell.card_title()} mt-1"}>
            <.navigate to={Soonex.Public.path(post.permalink)} class="link ui-nav">
              {post[:title] || "Untitled"}
            </.navigate>
          </h2>
          <p :if={post[:description]} class="lede mt-3 max-w-2xl">
            {post[:description]}
          </p>
          <div :if={post_tags(post) != []} class="mt-4 flex flex-wrap gap-2">
            <span :for={tag <- post_tags(post)} class="badge ui-size-sm">{tag}</span>
          </div>
        </div>
      </li>
    </ol>
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

  defp date_label(%{date: %DateTime{} = date}), do: Calendar.strftime(date, "%d %B %Y")
  defp date_label(_), do: nil

  defp cover(post) do
    src = post[:image]

    if is_binary(src) and src != "" do
      %{src: src, alt: post[:image_alt] || post[:title] || "Log cover"}
    end
  end

  defp post_tags(post) do
    post
    |> Map.get(:tags, [])
    |> List.wrap()
    |> Enum.filter(&is_binary/1)
  end
end
