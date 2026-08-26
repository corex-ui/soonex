defmodule Soonex.HomePage.Socii do
  @moduledoc false

  use Phoenix.Component
  use Corex

  def socii(assigns) do
    assigns = assign(assigns, :tech, tech_items())

    ~H"""
    <section id="socii" class="scroll-mt-24 w-full bg-root py-10 sm:py-12" aria-label="Toolchain">
      <.marquee
        id="soonex-tech-marquee"
        class="marquee ui-accent ui-width-full max-w-none"
        duration={32}
        spacing="3.5rem"
        pause_on_interaction={true}
        items={@tech}
      >
        <:item :let={item}>
          <span class="inline-flex h-10 items-center justify-center px-2" title={item.name}>
            <img
              src={Soonex.Public.path(item.src)}
              alt={item.name}
              height="32"
              width="32"
              class="pointer-events-none h-8 w-auto object-contain"
              loading="lazy"
            />
          </span>
        </:item>
      </.marquee>
    </section>
    """
  end

  defp tech_items do
    [
      %{name: "Elixir", src: "/images/tech/elixir.svg"},
      %{name: "Phoenix", src: "/images/tech/phoenixframework.svg"},
      %{name: "Tableau", src: "/images/tech/tableau.svg"},
      %{name: "Tailwind", src: "/images/tech/tailwindcss.svg"},
      %{name: "Hex", src: "/images/tech/hex.svg"},
      %{name: "TypeScript", src: "/images/tech/typescript.svg"},
      %{name: "Zag", src: "/images/tech/zag.svg"},
      %{name: "Ecto", src: "/images/tech/ecto-mark.svg"}
    ]
  end
end
