defmodule Soonex.HomePage.Hero do
  @moduledoc false

  use Phoenix.Component
  use Corex

  attr(:countdown_ms, :integer, required: true)

  def hero(assigns) do
    headline = "Write Elixir, ship a static build."

    assigns =
      assigns
      |> Phoenix.Component.assign(:hero_headline, headline)

    ~H"""
    <header
      class="relative flex min-h-dvh flex-col justify-center px-space py-size-xl"
      aria-labelledby="soonex-headline"
      data-hero-boundary
    >
      <div class="pointer-events-none absolute inset-0 overflow-hidden" aria-hidden="true">
        <div
          class="absolute inset-0 bg-[length:var(--spacing-size-lg)_var(--spacing-size-lg)] bg-[linear-gradient(var(--color-border)_1px,transparent_1px),linear-gradient(90deg,var(--color-border)_1px,transparent_1px)] opacity-20"
          data-parallax
        >
        </div>
      </div>

      <div
        class="relative z-[1] mx-auto flex w-full min-w-0 max-w-4xl flex-col items-center gap-space-lg text-center"
        data-hero
      >
        <h1
          id="soonex-headline"
          class="m-0 text-5xl md:text-7xl lg:text-8xl tracking-tight leading-[0.95] text-balance"
        >
          <%= for word <- String.split(@hero_headline, " ") do %>
            <span class="inline-block" data-hero-word>{word}&nbsp;</span>
          <% end %>
        </h1>

        <div class="flex max-w-xl flex-col gap-space-sm text-balance">
          <h2 class="m-0 max-w-xl font-sans !text-base !font-normal leading-snug text-ink-muted md:!text-lg">
            <span class="text-ink-brand">Tableau</span>{" "} compiles HEEx to static files.
          </h2>
          <h3 class="m-0 max-w-xl font-sans !text-base !font-normal leading-snug text-ink-muted md:!text-lg">
            <span class="text-ink-brand">Corex</span>{" "} covers components, tokens, Markdown, themes, and MCP for your editor.
          </h3>
        </div>

        <.timer
          id="soonex-hero-countdown"
          countdown
          start_ms={@countdown_ms}
          target_ms={0}
          class="timer timer--accent timer--text-lg sm:timer--text-xl md:timer--text-2xl lg:timer--text-5xl timer--rounded-xl"
        >
          <:day_label>Days</:day_label>
          <:hour_label>Hours</:hour_label>
          <:minute_label>Min</:minute_label>
          <:second_label>Sec</:second_label>
        </.timer>

        <div class="flex w-full flex-col items-center gap-space-sm sm:flex-row sm:justify-center">
          <.navigate to="#waitlist" class="button button--accent">
            Join the waitlist
          </.navigate>
          <.navigate to={Soonex.Public.path("/docs")} class="button button--ghost">
            Read the documentation <.heroicon name="hero-arrow-up-right" />
          </.navigate>
        </div>
      </div>
    </header>

    <div data-hero-sentinel aria-hidden="true" class="pointer-events-none h-px w-full shrink-0"></div>
    """
  end
end
