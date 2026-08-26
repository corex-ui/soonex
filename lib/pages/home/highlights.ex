defmodule Soonex.HomePage.Highlights do
  @moduledoc false

  use Phoenix.Component
  use Corex

  import Soonex.Layouts.Section, only: [block: 1]

  alias Soonex.Layouts.Shell

  attr(:posts, :list, default: [])

  def highlights(assigns) do
    posts =
      assigns.posts
      |> List.wrap()
      |> Enum.sort_by(& &1[:date], {:desc, DateTime})
      |> Enum.take(6)

    assigns = assign(assigns, :highlight_posts, posts)

    ~H"""
    <.block
      id="acta"
      labelledby="soonex-highlights-heading"
      eyebrow="Journal"
      tone={:root}
    >
      <:title>
        Latest <span class="text-brand-text">notes</span>
      </:title>
      <:lede>
        Shipping log for the template. Cards move in a carousel; the full index lives on /blog.
      </:lede>
      <:actions>
        <.navigate to={Soonex.Public.path("/blog")} class="link ui-brand">
          All posts <.heroicon name="hero-arrow-up-right" />
        </.navigate>
      </:actions>
      <div :if={@highlight_posts == []} class={"#{Shell.panel()} p-8 text-ink-muted"}>
        <p class="m-0">No posts yet.</p>
      </div>
      <.carousel
        :if={@highlight_posts != []}
        id="soonex-acta-carousel"
        class="carousel ui-brand ui-width-full max-w-none"
        items={@highlight_posts}
        spacing="1.5rem"
      >
        <:item :let={post}>
          <article class="flex h-full min-h-56 flex-col border border-border bg-surface p-8">
            <p :if={date_label(post)} class={Shell.eyebrow()}>{date_label(post)}</p>
            <h3 class="display mt-2 text-xl font-semibold tracking-tight text-ink">
              {post[:title] || "Untitled"}
            </h3>
            <p :if={post[:description]} class="mt-3 flex-auto text-sm/6 text-ink-muted">
              {post[:description]}
            </p>
            <.navigate
              to={Soonex.Public.path(post.permalink)}
              class="link ui-brand mt-6 w-fit"
            >
              Read <.heroicon name="hero-arrow-up-right" />
            </.navigate>
          </article>
        </:item>
        <:prev_trigger>
          <.heroicon name="hero-arrow-left" />
        </:prev_trigger>
        <:next_trigger>
          <.heroicon name="hero-arrow-right" />
        </:next_trigger>
      </.carousel>
    </.block>
    """
  end

  defp date_label(%{date: %DateTime{} = date}), do: Calendar.strftime(date, "%d %B %Y")
  defp date_label(_), do: nil
end
