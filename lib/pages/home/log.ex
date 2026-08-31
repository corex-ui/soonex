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
    assigns = assign(assigns, :voice, voice())

    ~H"""
    <.block id="log" labelledby="soonex-log-heading" eyebrow="Shipping log" layout={:open}>
      <:title>
        Ledger on the road to <span class="text-brand-text">September</span>
      </:title>
      <:lede>
        Public notes on the waitlist, the four looks, and the countdown.
      </:lede>
      <:actions>
        <.navigate to={Soonex.Public.path("/blog")} class="link ui-brand">
          All entries <.heroicon name="hero-arrow-up-right" />
        </.navigate>
      </:actions>

      <blockquote class="soonex-voice-rule m-0">
        <p class="soonex-quote m-0 text-pretty">“{@voice.quote}”</p>
        <footer class="mt-6">
          <cite class="not-italic text-sm font-semibold text-ink">{@voice.name}</cite>
          <span class="mt-1 block text-sm text-ink-muted">{@voice.role}</span>
        </footer>
      </blockquote>

      <p :if={@entries == []} class="m-0 mt-14 text-ink-muted">No posts yet.</p>
      <ol :if={@entries != []} class="soonex-ledger mt-14">
        <li :for={post <- @entries} class="soonex-ledger-entry">
          <div class="soonex-ledger-grid">
            <span :if={date_label(post)} class="soonex-mono-meta">{date_label(post)}</span>
            <div class="min-w-0">
              <h3 class={"#{Shell.card_title()} mt-0"}>
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
            </div>
          </div>
        </li>
      </ol>
    </.block>
    """
  end

  defp voice do
    %{
      quote:
        "We had a date before we had a deck. Soonex put the waitlist and the countdown on the page the same afternoon.",
      name: "Amira N.",
      role: "Founder, Northline Studio"
    }
  end

  defp date_label(%{date: %DateTime{} = date}), do: Calendar.strftime(date, "%d %B %Y")
  defp date_label(_), do: nil
end
