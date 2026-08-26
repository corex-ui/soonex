defmodule Soonex.Layouts.Articles do
  @moduledoc false

  use Phoenix.Component
  use Corex

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
      class="grid grid-cols-1 gap-px overflow-hidden border border-border bg-border sm:grid-cols-2"
    >
      <article :for={post <- @posts} class="flex flex-col bg-surface p-8">
        <p :if={date_label(post)} class={Shell.eyebrow()}>{date_label(post)}</p>
        <h2 class="display mt-2 text-xl font-semibold tracking-tight text-ink sm:text-2xl">
          <.navigate to={Soonex.Public.path(post.permalink)} class="link ui-nav">
            {post[:title] || "Untitled"}
          </.navigate>
        </h2>
        <p :if={post[:description]} class="mt-3 flex-auto text-sm/6 text-ink-muted">
          {post[:description]}
        </p>
        <div :if={post_tags(post) != []} class="mt-6 flex flex-wrap gap-2">
          <span :for={tag <- post_tags(post)} class="badge ui-size-sm">{tag}</span>
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
    <.pagination
      id={@id}
      class="pagination ui-brand ui-size-sm mt-12"
      count={@count}
      page_size={@page_size}
      type={:button}
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
    """
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
