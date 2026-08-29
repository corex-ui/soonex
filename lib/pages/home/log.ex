defmodule Soonex.HomePage.Log do
  @moduledoc false

  use Phoenix.Component
  use Corex

  import Soonex.Layouts.Section, only: [block: 1]

  alias Soonex.Layouts.Shell

  attr(:posts, :list, default: [])

  def log(assigns) do
    posts =
      assigns.posts
      |> List.wrap()
      |> Enum.sort_by(& &1[:date], {:desc, DateTime})
      |> Enum.take(3)

    assigns = assign(assigns, :entries, posts)

    ~H"""
    <.block id="log" labelledby="soonex-log-heading" eyebrow="Log" layout={:open}>
      <:title>
        From the <span class="text-brand-text">shipping log</span>
      </:title>
      <:lede>
        Notes on the fork, the four rooms, and the September target.
      </:lede>
      <:actions>
        <.navigate to={Soonex.Public.path("/blog")} class="link ui-brand">
          All entries <.heroicon name="hero-arrow-up-right" />
        </.navigate>
      </:actions>
      <p :if={@entries == []} class="m-0 text-ink-muted">No posts yet.</p>
      <ol :if={@entries != []} class={Shell.log_list()}>
        <li :for={post <- @entries} class="py-6 first:pt-0 last:pb-0">
          <small :if={date_label(post)} class={Shell.eyebrow()}>{date_label(post)}</small>
          <h3 class={"#{Shell.card_title()} mt-1"}>
            <.navigate to={Soonex.Public.path(post.permalink)} class="link ui-nav">
              {post[:title] || "Untitled"}
            </.navigate>
          </h3>
          <p :if={post[:description]} class="lede mt-2 max-w-2xl">
            {post[:description]}
          </p>
        </li>
      </ol>
    </.block>
    """
  end

  defp date_label(%{date: %DateTime{} = date}), do: Calendar.strftime(date, "%d %B %Y")
  defp date_label(_), do: nil
end
