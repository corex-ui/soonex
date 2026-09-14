defmodule Soonex.HomePage.Logos do
  @moduledoc false

  use Phoenix.Component
  use Corex

  alias Soonex.Layouts.Shell

  def logos(assigns) do
    assigns = assign(assigns, :tech, tech_items())

    ~H"""
    <section
      id="logos"
      data-section="logos"
      class={"#{Shell.section_compact()} border-y border-border bg-root"}
      aria-label="Built with"
    >
      <div class={Shell.stage()}>
        <.marquee
          id="soonex-tech-marquee"
          class="marquee ui-width-full"
          duration={28}
          spacing="2.5rem"
          pause_on_interaction
          items={@tech}
        >
          <:item :let={item}>
            <img src={Soonex.Public.path(item.src)} alt="" width="32" height="32" />
            <span>{item.name}</span>
          </:item>
        </.marquee>
      </div>
    </section>
    """
  end

  defp tech_items do
    [
      %{name: "Elixir", src: "/images/tech/elixir.svg"},
      %{name: "Phoenix", src: "/images/tech/phoenixframework.svg"},
      %{name: "Tableau", src: "/images/tech/tableau.svg"},
      %{name: "Tailwind", src: "/images/tech/tailwindcss.svg"},
      %{name: "HTML5", src: "/images/tech/html5.svg"},
      %{name: "JavaScript", src: "/images/tech/javascript.svg"},
      %{name: "TypeScript", src: "/images/tech/typescript.svg"},
      %{name: "Hex", src: "/images/tech/hex.svg"}
    ]
  end
end
