defmodule Soonex.HomePage.Journal do
  @moduledoc false

  use Phoenix.Component
  use Corex

  import Soonex.Layouts.Media, only: [photo: 1]
  import Soonex.Layouts.Section, only: [block: 1]

  alias Soonex.Layouts.Shell

  attr(:posts, :list, default: [])

  def journal(assigns) do
    posts =
      assigns.posts
      |> List.wrap()
      |> Enum.sort_by(& &1[:date], {:desc, DateTime})
      |> Enum.take(3)

    assigns = assign(assigns, :highlight_posts, posts)

    ~H"""
    <.block
      id="journal"
      section="journal"
      labelledby="soonex-journal-heading"
      eyebrow="Journal"
      tone={:root}
    >
      <:title>
        Shipping notes, <span class="soonex-accent">not a lorem feed.</span>
      </:title>
      <:lede>
        Posts are Markdown under _posts. The home grid is a short reading list; the index paginates
        the rest.
      </:lede>
      <:actions>
        <.navigate to={Soonex.Public.path("/blog")} class="link ui-brand">
          All posts <.heroicon name="hero-arrow-up-right" />
        </.navigate>
      </:actions>
      <div :if={@highlight_posts == []} class={"#{Shell.panel()} p-8 text-ink-muted"}>
        <p class="m-0">No posts yet.</p>
      </div>
      <div
        :if={@highlight_posts != []}
        class="soonex-journal grid grid-cols-1 gap-4 sm:grid-cols-2 lg:grid-cols-3"
      >
        <article
          :for={post <- @highlight_posts}
          class={"#{Shell.frame()} soonex-card-motion flex h-full flex-col overflow-hidden"}
        >
          <div :if={cover(post)} class="relative aspect-[16/10] overflow-hidden">
            <.photo
              src={cover(post).src}
              alt={cover(post).alt}
              width={1400}
              height={900}
            />
          </div>
          <div class="flex flex-1 flex-col p-6 sm:p-8">
            <p :if={date_label(post)} class={Shell.eyebrow()}>{date_label(post)}</p>
            <h3 class="display mt-2 text-xl font-semibold tracking-tight text-ink">
              {post[:title] || "Untitled"}
            </h3>
            <p :if={post[:description]} class="mt-3 flex-auto text-sm/6 text-ink-muted">
              {post[:description]}
            </p>
            <.navigate
              to={Soonex.Public.path(post.permalink)}
              class="button ui-ghost ui-brand ui-size-sm mt-6 w-fit"
            >
              Read more <.heroicon name="hero-arrow-up-right" />
            </.navigate>
          </div>
        </article>
      </div>
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
