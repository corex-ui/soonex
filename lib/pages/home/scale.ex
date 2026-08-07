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
      class={"#{Shell.section()} home__numbers-section bg-ui-muted"}
      aria-labelledby="home-numbers-heading"
    >
      <div class={"#{Shell.stage()} home-stack flex flex-col items-center text-center lg:items-stretch lg:text-start"}>
        <p
          id="home-numbers-heading"
          class="m-0 text-sm font-semibold uppercase tracking-[0.18em] text-brand-text"
        >
          Lorem ipsum metrics
        </p>

        <div class="home__numbers rounded-xl border border-border bg-root">
          <div class="home__numbers__cell">
            <span class="home__numbers__value">
              {@stats_components}<span class="home__numbers__value__suffix">+</span>
            </span>
            <span class="home__numbers__label">Lorem</span>
            <p class="home__numbers__hint">
              Ipsum dolor sit amet, consectetur adipiscing elit sed do.
            </p>
          </div>
          <div class="home__numbers__cell">
            <span class="home__numbers__value">
              50<span class="home__numbers__value__suffix">+</span>
            </span>
            <span class="home__numbers__label">Ipsum</span>
            <p class="home__numbers__hint">
              Eiusmod tempor incididunt ut labore et dolore magna.
            </p>
          </div>
          <div class="home__numbers__cell">
            <span class="home__numbers__value">
              100<span class="home__numbers__value__suffix">%</span>
            </span>
            <span class="home__numbers__label">Dolor</span>
            <p class="home__numbers__hint">
              Ut enim ad minim veniam, quis nostrud exercitation.
            </p>
          </div>
          <div class="home__numbers__cell">
            <span class="home__numbers__value">
              A<span class="home__numbers__value__suffix">11y</span>
            </span>
            <span class="home__numbers__label">Sit amet</span>
            <p class="home__numbers__hint">
              Ullamco laboris nisi ut aliquip ex ea commodo consequat.
            </p>
          </div>
        </div>
      </div>
    </section>
    """
  end
end
