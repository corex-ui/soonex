defmodule Soonex.HomePage.Logos do
  @moduledoc false

  use Phoenix.Component
  use Corex

  def logos(assigns) do
    assigns = assign(assigns, :tech, tech_items())

    ~H"""
    <section
      id="logos"
      data-section="logos"
      class="soonex-section soonex-section--compact scroll-mt-24 w-full bg-root py-10 sm:py-12"
      aria-label="Built with"
    >
      <p class="soonex-logos-label mx-auto mb-6 max-w-7xl px-6 text-center text-sm/6 text-ink-muted lg:px-8">
        The same stack you already ship with
      </p>
      <.marquee
        id="soonex-tech-marquee"
        class="marquee ui-width-full"
        duration={20}
        spacing="2rem"
        pause_on_interaction
        items={@tech}
      >
        <:item :let={item}>
          <span class="soonex-tech-chip">
            <img
              src={Soonex.Public.path(item.src)}
              alt=""
              width="32"
              height="32"
            />
            <span>{item.name}</span>
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
      %{name: "Tailwind", src: "/images/tech/tailwindcss.svg"},
      %{name: "HTML5", src: "/images/tech/html5.svg"},
      %{name: "JavaScript", src: "/images/tech/javascript.svg"},
      %{name: "TypeScript", src: "/images/tech/typescript.svg"},
      %{name: "Hex", src: "/images/tech/hex.svg"}
    ]
  end
end
