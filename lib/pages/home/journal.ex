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
    >
      <:title>
        Notes from building with Corex.
      </:title>
      <:lede>
        Markdown posts under _posts. The index paginates; the home page shows the latest three.
      </:lede>
      <:actions>
        <.navigate to={Soonex.Public.path("/blog")} class="link ui-brand">
          All posts <.heroicon name="hero-arrow-up-right" />
        </.navigate>
      </:actions>
      <div :if={@highlight_posts == []} class={"#{Shell.panel()} text-ink-muted"}>
        <p class="m-0">No posts yet.</p>
      </div>
      <div
        :if={@highlight_posts != []}
        class="grid grid-cols-1 gap-6 sm:grid-cols-2 lg:grid-cols-3"
      >
        <article :for={post <- @highlight_posts} class={"#{Shell.frame()} flex h-full flex-col"}>
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

  defp date_label(%{date: %DateTime{} = date}), do: Calendar.strftime(date, "%d %B %Y")
  defp date_label(_), do: nil
end
