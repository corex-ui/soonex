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
      id="acta"
      class={"#{Shell.section()} bg-root"}
      aria-labelledby="soonex-highlights-heading"
    >
      <div class={"#{Shell.stage()} #{Shell.stack()}"}>
        <div class="flex max-w-2xl flex-col gap-size-md">
          <p class={Shell.eyebrow()}>Acta</p>
          <h2 id="soonex-highlights-heading" class={Shell.section_heading()}>
            Recentiora <span class="text-brand-text">scripta</span>
          </h2>
          <p class={Shell.lede()}>
            Quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi.
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
                {post_date_label(post) || "Acta"}
              </span>
              <span class="min-w-0">
                <span class="display m-0 block text-xl tracking-tight text-ink">{post[:title] ||
                  "Lorem ipsum"}</span>
                <span :if={post[:description]} class="mt-space-xs block text-sm text-ink-muted">
                  {post[:description]}
                </span>
              </span>
              <.heroicon name="hero-arrow-right" />
            </.navigate>
          </li>
        </ul>

        <p class="m-0 text-sm">
          <.navigate to={Soonex.Public.path("/blog")} class="link ui-brand">
            Omnia acta
          </.navigate>
        </p>
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
