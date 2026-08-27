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
        class="marquee ui-width-full max-w-none"
        duration={20}
        spacing="2rem"
        pause_on_interaction
        items={@tech}
      >
        <:item :let={item}>
          <span class="inline-flex h-10 w-10 items-center justify-center" title={item.name}>
            <img
              src={Soonex.Public.path(item.src)}
              alt={item.name}
              height="40"
              width="40"
              class="pointer-events-none h-10 w-10 object-contain"
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
