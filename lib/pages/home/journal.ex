defmodule Soonex.HomePage.Journal do
  @moduledoc false

  use Phoenix.Component
  use Corex

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
      tone={:surface}
      heading_size={:large}
    >
      <:title>
        Notes from the build.
      </:title>
      <:lede>
        Short dispatches on design tokens, accessibility, and shipping static sites with Phoenix
        tooling.
      </:lede>
      <:actions>
        <.navigate to={Soonex.Public.path("/blog")} class="link ui-accent">
          Read the journal <.heroicon name="hero-arrow-up-right" />
        </.navigate>
      </:actions>
      <div :if={@highlight_posts == []} class={"#{Shell.panel()} text-ink-muted"}>
        <p class="m-0 text-sm/6">No posts yet.</p>
      </div>
      <div
        :if={@highlight_posts != []}
        class="grid grid-cols-1 gap-6 md:grid-cols-3"
      >
        <article
          :for={post <- @highlight_posts}
          class={"#{Shell.tile()} soonex-card-motion relative h-full bg-root"}
        >
          <div :if={post[:image]} class="relative aspect-[16/10] overflow-hidden">
            <img
              src={Soonex.Public.path(post[:image])}
              alt=""
              width="1600"
              height="1000"
              loading="lazy"
              decoding="async"
              class="absolute inset-0 size-full object-cover"
            />
          </div>
          <div class="flex flex-1 flex-col p-6 sm:p-8">
            <p :if={date_label(post)} class={Shell.eyebrow()}>{date_label(post)}</p>
            <h3 class="display mt-3 text-xl font-medium tracking-tight text-ink">
              <.navigate
                to={Soonex.Public.path(post.permalink)}
                class="after:absolute after:inset-0"
              >
                {post[:title] || "Untitled"}
              </.navigate>
            </h3>
            <p :if={post[:description]} class="mt-3 flex-auto text-sm/6 text-ink-muted">
              {post[:description]}
            </p>
            <p class="mt-6 flex items-center gap-1 text-sm/6 font-medium text-ink" aria-hidden="true">
              Read post <.heroicon name="hero-arrow-up-right" class="size-4" />
            </p>
          </div>
        </article>
      </div>
    </.block>
    """
  end

  defp date_label(%{date: %DateTime{} = date}), do: Calendar.strftime(date, "%d %B %Y")
  defp date_label(_), do: nil
end
