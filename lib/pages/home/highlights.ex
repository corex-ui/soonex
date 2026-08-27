defmodule Soonex.HomePage.Highlights do
  @moduledoc false

  use Phoenix.Component
  use Corex

  import Soonex.Layouts.Media, only: [photo: 1]
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
        Veniam quis <span class="text-brand-text">nostrud</span>
      </:title>
      <:lede>
        Consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
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
          <article class={"#{Shell.frame()} flex h-full min-h-80 flex-col overflow-hidden"}>
            <div :if={cover(post)} class="relative aspect-[16/10] overflow-hidden">
              <.photo
                src={cover(post).src}
                alt={cover(post).alt}
                width={1400}
                height={900}
              />
            </div>
            <div class="flex flex-1 flex-col p-8">
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
            </div>
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

  defp cover(post) do
    src = post[:image]

    if is_binary(src) and src != "" do
      %{src: src, alt: post[:image_alt] || post[:title] || "Journal cover"}
    end
  end

  defp date_label(%{date: %DateTime{} = date}), do: Calendar.strftime(date, "%d %B %Y")
  defp date_label(_), do: nil
end
