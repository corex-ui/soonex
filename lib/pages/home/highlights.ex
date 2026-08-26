defmodule Soonex.HomePage.Highlights do
  @moduledoc false

  use Phoenix.Component
  use Corex

  alias Soonex.Layouts.Shell

  attr(:posts, :list, default: [])

  def highlights(assigns) do
    posts =
      assigns.posts
      |> List.wrap()
      |> Enum.sort_by(& &1[:date], {:desc, DateTime})
      |> Enum.take(3)

    assigns =
      assigns
      |> assign(:tech, tech_items())
      |> assign(:highlight_posts, posts)

    ~H"""
    <section
      id="highlights"
      class={"#{Shell.section()} border-y border-border bg-surface"}
      aria-labelledby="soonex-highlights-heading"
    >
      <div class={"#{Shell.stage()} #{Shell.stack()}"}>
        <div class="mx-auto flex w-full max-w-2xl flex-col items-center gap-size-md text-center lg:mx-0 lg:items-start lg:text-start">
          <p class={Shell.eyebrow()}>Journal</p>
          <h2 id="soonex-highlights-heading" class={Shell.section_heading()}>
            Latest <span class="text-brand-text">cuts</span>
          </h2>
          <p class={Shell.lede()}>
            Recent posts from the template journal, plus the stack that prints the site.
          </p>
        </div>

        <div class="flex flex-col gap-size-sm py-size-sm">
          <.marquee
            id="soonex-tech-marquee"
            class="marquee ui-accent ui-width-full max-w-none"
            duration={32}
            spacing="3.5rem"
            pause_on_interaction={true}
            items={@tech}
          >
            <:item :let={item}>
              <span class="inline-flex h-11 items-center justify-center px-space-sm" title={item.name}>
                <img
                  src={Soonex.Public.path(item.src)}
                  alt={item.name}
                  height="44"
                  class="pointer-events-none h-11 w-auto object-contain"
                  loading="lazy"
                />
              </span>
            </:item>
          </.marquee>
        </div>

        <ul :if={@highlight_posts != []} class="m-0 list-none p-0">
          <li :for={post <- @highlight_posts}>
            <.navigate
              to={Soonex.Public.path(post.permalink)}
              class={"#{Shell.listing_row()} link ui-nav text-ink no-underline"}
            >
              <span class="font-mono text-sm tracking-wide text-brand-text">
                {post_date_label(post) || "Journal"}
              </span>
              <span class="min-w-0">
                <span class="display m-0 block text-xl tracking-tight text-ink">{post[:title] ||
                  "Untitled"}</span>
                <span :if={post[:description]} class="mt-space-xs block text-sm text-ink-muted">
                  {post[:description]}
                </span>
              </span>
              <.heroicon name="hero-arrow-right" />
            </.navigate>
          </li>
        </ul>

        <ul :if={@highlight_posts == []} class="m-0 list-none p-0">
          <li>
            <.navigate
              to={Soonex.Public.path("/blog")}
              class={"#{Shell.listing_row()} link ui-nav text-ink no-underline"}
            >
              <span class="font-mono text-sm tracking-wide text-brand-text">Journal</span>
              <span class="min-w-0">
                <span class="display m-0 block text-xl tracking-tight text-ink">
                  Open the journal
                </span>
                <span class="mt-space-xs block text-sm text-ink-muted">
                  Add Markdown files to _posts/ and they show up here.
                </span>
              </span>
              <.heroicon name="hero-arrow-right" />
            </.navigate>
          </li>
        </ul>
      </div>
    </section>
    """
  end

  defp post_date_label(%{date: %DateTime{} = date}), do: Calendar.strftime(date, "%Y-%m-%d")
  defp post_date_label(_), do: nil

  defp tech_items do
    [
      %{name: "Elixir", src: "/images/tech/elixir.svg"},
      %{name: "Phoenix", src: "/images/tech/phoenix.svg"},
      %{name: "Tableau", src: "/images/tech/tableau.jpg"},
      %{name: "Tailwind", src: "/images/tech/tailwind.svg"},
      %{name: "Hex", src: "/images/tech/hex.svg"},
      %{name: "TypeScript", src: "/images/tech/typescript.svg"},
      %{name: "Zag.js", src: "/images/tech/zag.webp"},
      %{name: "Ecto", src: "/images/tech/ecto.png"}
    ]
  end
end
