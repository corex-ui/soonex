defmodule Soonex.HomePage.Log do
  @moduledoc false

  use Phoenix.Component
  use Corex

  import Soonex.Layouts.Media, only: [photo: 1]
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
    <.block id="log" labelledby="soonex-log-heading" eyebrow="Shipping log" layout={:open}>
      <:title>
        What we shipped on the <span class="text-brand-text">road to September</span>
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
      <ol :if={@entries != []} class={Shell.log_list()}>
        <li
          :for={post <- @entries}
          class="grid grid-cols-1 gap-6 py-8 first:pt-0 last:pb-0 sm:grid-cols-12 sm:items-start"
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
            <h3 class={"#{Shell.card_title()} mt-1"}>
              <.navigate to={Soonex.Public.path(post.permalink)} class="link ui-nav">
                {post[:title] || "Untitled"}
              </.navigate>
            </h3>
            <p :if={post[:description]} class="lede mt-2 max-w-2xl">
              {post[:description]}
            </p>
            <.navigate
              to={Soonex.Public.path(post.permalink)}
              class="button ui-ghost ui-brand ui-size-sm mt-4 w-fit"
            >
              Read more <.heroicon name="hero-arrow-up-right" />
            </.navigate>
          </div>
        </li>
      </ol>
    </.block>
    """
  end

  defp cover(post) do
    src = post[:image]

    if is_binary(src) and src != "" do
      %{src: src, alt: post[:image_alt] || post[:title] || "Log cover"}
    end
  end

  defp date_label(%{date: %DateTime{} = date}), do: Calendar.strftime(date, "%d %B %Y")
  defp date_label(_), do: nil
end
