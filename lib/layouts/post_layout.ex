defmodule Soonex.PostLayout do
  @moduledoc false

  use Tableau.Layout, layout: Soonex.RootLayout
  use Phoenix.Component
  use Corex

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

    assigns =
      assigns
      |> Map.put(:post_title, title)
      |> Map.put(:post_description, description)
      |> Map.put(:post_date_label, date_label)

    ~H"""
    <article class="flex min-h-dvh flex-col px-space py-size-xl">
      <div class="mx-auto flex w-full max-w-3xl flex-col gap-space-lg">
        <div class="flex flex-col gap-space-sm sm:flex-row sm:flex-wrap sm:gap-space">
          <.navigate to="/" class="link link--accent w-fit">
            Back to home
          </.navigate>
          <.navigate to="/tags" class="link link--accent w-fit">
            Browse tags
          </.navigate>
        </div>
        <header class="flex flex-col gap-space-sm border-b border-border pb-space-lg">
          <h1 class="m-0">{@post_title}</h1>
          <%= if @post_date_label do %>
            <p class="ui-label m-0 text-ink-muted">{@post_date_label}</p>
          <% end %>
          <%= if @post_description do %>
            <p class="m-0 max-w-prose text-ink-muted">{@post_description}</p>
          <% end %>
        </header>
        <div class="typo markdown max-w-none">
          {{:safe, render(@inner_content)}}
        </div>
      </div>
    </article>
    """
  end
end
