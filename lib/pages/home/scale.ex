defmodule Soonex.HomePage.Scale do
  @moduledoc false

  use Phoenix.Component
  use Corex

  alias Soonex.Layouts.Shell

  attr(:stats_components, :integer, required: true)

  def scale(assigns) do
    ~H"""
    <section
      id="scale"
      class={"#{Shell.section()} bg-root"}
      aria-labelledby="home-numbers-heading"
    >
      <div class={"#{Shell.stage()} #{Shell.stack()}"}>
        <p id="home-numbers-heading" class={Shell.eyebrow()}>
          Metrics
        </p>

        <div class="grid grid-cols-1 gap-space-lg sm:grid-cols-2 xl:grid-cols-4">
          <div class={"#{Shell.paper()} flex flex-col gap-space p-size"}>
            <span class="display m-0 text-5xl tracking-tighter text-ink sm:text-6xl">
              {@stats_components}<span class="text-brand-text">+</span>
            </span>
            <span class="text-sm font-semibold uppercase tracking-[0.14em] text-ink">
              Components
            </span>
            <p class="m-0 text-sm text-ink-muted">
              Corex pieces available to compose the launch page.
            </p>
          </div>
          <div class={"#{Shell.paper()} flex flex-col gap-space p-size"}>
            <span class="display m-0 text-5xl tracking-tighter text-ink sm:text-6xl">
              50<span class="text-brand-text">+</span>
            </span>
            <span class="text-sm font-semibold uppercase tracking-[0.14em] text-ink">
              Tokens
            </span>
            <p class="m-0 text-sm text-ink-muted">
              Color, space, and type scales from Corex Design.
            </p>
          </div>
          <div class={"#{Shell.paper()} flex flex-col gap-space p-size"}>
            <span class="display m-0 text-5xl tracking-tighter text-ink sm:text-6xl">
              100<span class="text-brand-text">%</span>
            </span>
            <span class="text-sm font-semibold uppercase tracking-[0.14em] text-ink">
              Static
            </span>
            <p class="m-0 text-sm text-ink-muted">
              Tableau build output you can host anywhere.
            </p>
          </div>
          <div class={"#{Shell.paper()} flex flex-col gap-space p-size"}>
            <span class="display m-0 text-5xl tracking-tighter text-ink sm:text-6xl">
              A<span class="text-brand-text">11y</span>
            </span>
            <span class="text-sm font-semibold uppercase tracking-[0.14em] text-ink">
              First
            </span>
            <p class="m-0 text-sm text-ink-muted">
              Corex components and an axe check on the home page.
            </p>
          </div>
        </div>
      </div>
    </section>
    """
  end
end
