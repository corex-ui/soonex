defmodule Soonex.HomePage.Socii do
  @moduledoc false

  use Phoenix.Component
  use Corex

  import Soonex.Layouts.Section, only: [block: 1]

  def socii(assigns) do
    assigns = assign(assigns, :tech, tech_items())

    ~H"""
    <.block
      id="socii"
      labelledby="soonex-socii-heading"
      eyebrow="Stack"
      tone={:surface}
      align={:center}
      compact
    >
      <:title>
        Built on the Elixir <span class="text-brand-text">toolchain</span>
      </:title>
      <:lede>
        Mix installs Corex hooks. Tableau ships the static site. Tailwind tokens follow the theme.
      </:lede>
      <.marquee
        id="soonex-tech-marquee"
        class="marquee ui-accent ui-width-full max-w-none"
        duration={32}
        spacing="3.5rem"
        pause_on_interaction={true}
        items={@tech}
      >
        <:item :let={item}>
          <span class="inline-flex h-11 items-center justify-center px-2" title={item.name}>
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
    </.block>
    """
  end

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
