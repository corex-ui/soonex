defmodule Soonex.Layouts.Rows do
  @moduledoc false

  use Phoenix.Component
  use Corex

  alias Soonex.Layouts.Shell

  attr(:id, :string, default: nil)
  attr(:items, :list, required: true)
  attr(:icon, :string, default: "hero-arrow-right")
  attr(:empty, :string, default: "Lorem ipsum — nulla acta adhuc.")

  def data_rows(assigns) do
    ~H"""
    <.data_list
      id={@id}
      orientation="horizontal"
      class={Shell.data_list()}
      items={@items}
    >
      <:empty>
        <p class="m-0 text-ink-muted">{@empty}</p>
      </:empty>
      <:label :let={item}>
        <span class="font-mono text-sm tracking-wide text-brand-text">{item.label}</span>
      </:label>
      <:content :let={item}>
        <.navigate
          to={row_href(item)}
          class="link ui-nav flex w-full min-w-0 items-center justify-between gap-x-6 text-ink no-underline"
        >
          <span class="flex min-w-0 flex-col gap-1">
            <span class="display text-lg tracking-tight text-ink sm:text-xl">{row_title(item)}</span>
            <span :if={item.content not in [nil, ""]} class="text-sm/6 text-ink-muted">
              {item.content}
            </span>
            <span
              :if={row_tags(item) != []}
              class="mt-2 flex flex-wrap gap-2"
            >
              <span :for={tag <- row_tags(item)} class="badge ui-size-sm">{tag}</span>
            </span>
          </span>
          <.heroicon name={row_icon(item, @icon)} class="size-5 shrink-0 text-ink-muted" />
        </.navigate>
      </:content>
    </.data_list>
    """
  end

  def from_posts(posts) do
    posts
    |> List.wrap()
    |> Enum.map(fn post ->
      %{
        label: date_label(post) || "Acta",
        content: post[:description] || "",
        meta: %{
          href: Soonex.Public.path(post.permalink),
          title: post[:title] || "Lorem ipsum",
          tags: post_tags(post)
        }
      }
    end)
    |> Corex.Content.new()
  end

  defp row_href(%{meta: %{href: href}}) when is_binary(href), do: href
  defp row_href(_), do: "#"

  defp row_title(%{meta: %{title: title}}) when is_binary(title), do: title
  defp row_title(%{label: label}), do: label

  defp row_icon(%{meta: %{icon: icon}}, _default) when is_binary(icon), do: icon
  defp row_icon(_item, default), do: default

  defp row_tags(%{meta: %{tags: tags}}) when is_list(tags), do: Enum.filter(tags, &is_binary/1)
  defp row_tags(_), do: []

  defp date_label(%{date: %DateTime{} = date}), do: Calendar.strftime(date, "%Y-%m-%d")
  defp date_label(_), do: nil

  defp post_tags(post) do
    post
    |> Map.get(:tags, [])
    |> List.wrap()
    |> Enum.filter(&is_binary/1)
  end
end
