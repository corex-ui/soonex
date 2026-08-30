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
    <.block
      id="log"
      labelledby="soonex-log-heading"
      eyebrow="Shipping log"
      tone={:surface}
      layout={:open}
    >
      <:title>
        Ledger on the road to <span class="text-brand-text">September</span>
      </:title>
      <:lede>
        Public notes on the waitlist, the four looks, and the countdown. The full index lives on the
        log.
      </:lede>
      <:actions>
        <.navigate to={Soonex.Public.path("/blog")} class="link ui-brand">
          All entries <.heroicon name="hero-arrow-up-right" />
        </.navigate>
      </:actions>
      <p :if={@entries == []} class="m-0 text-ink-muted">No posts yet.</p>
      <ol :if={@entries != []} class="soonex-ledger">
        <li :for={post <- @entries} class="soonex-ledger-entry">
          <small :if={date_label(post)} class={Shell.eyebrow()}>{date_label(post)}</small>
          <h3 class={"#{Shell.card_title()} mt-2"}>
            <.navigate to={Soonex.Public.path(post.permalink)} class="link ui-nav">
              {post[:title] || "Untitled"}
            </.navigate>
          </h3>
          <p :if={post[:description]} class="lede mt-2 max-w-3xl">
            {post[:description]}
          </p>
          <.navigate
            to={Soonex.Public.path(post.permalink)}
            class="button ui-ghost ui-brand ui-size-sm mt-5 w-fit"
          >
            Read more <.heroicon name="hero-arrow-up-right" />
          </.navigate>
        </li>
      </ol>
    </.block>
    """
  end

  defp date_label(%{date: %DateTime{} = date}), do: Calendar.strftime(date, "%d %B %Y")
  defp date_label(_), do: nil
end
