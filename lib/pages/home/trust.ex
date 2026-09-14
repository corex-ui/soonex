defmodule Soonex.HomePage.Trust do
  @moduledoc false

  use Phoenix.Component
  use Corex

  alias Soonex.Layouts.Shell

  def trust(assigns) do
    assigns = assign(assigns, :items, trust_items())

    ~H"""
    <section
      id="trust"
      data-section="trust"
      class={"#{Shell.section_compact()} border-y border-border bg-surface"}
      aria-label="Built with"
    >
      <div class={Shell.stage()}>
        <p class="m-0 text-center text-sm/6 text-ink-muted">
          Built with the stack you already ship
        </p>
        <ul class="mt-6 flex list-none flex-wrap items-center justify-center gap-3 p-0">
          <li :for={item <- @items}>
            <span class="badge ui-size-sm">{item}</span>
          </li>
        </ul>
      </div>
    </section>
    """
  end

  defp trust_items do
    ["Corex", "Phoenix LiveView", "Tableau", "Tailwind CSS", "Elixir", "Hex"]
  end
end
