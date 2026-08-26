defmodule Soonex.Layouts.Root.LandingChrome do
  @moduledoc false

  use Phoenix.Component
  use Corex

  attr(:countdown_start_ms, :integer, required: true)

  def landing_chrome(assigns) do
    ~H"""
    <div
      data-scroll-progress
      class="pointer-events-none fixed inset-x-0 top-0 z-[55] h-0.5 overflow-hidden bg-border"
      aria-hidden="true"
    >
      <div
        data-scroll-progress-fill
        class="h-full w-full origin-left bg-[color:var(--color-brand)] will-change-transform"
        style="transform: scaleX(0)"
      >
      </div>
    </div>
    <div
      data-sticky-bar
      role="region"
      aria-label="Lorem ipsum"
      class="fixed inset-x-0 top-0 z-50 flex w-full justify-center border-b border-border bg-surface/90 px-space-md py-space-sm backdrop-blur-md motion-safe:will-change-[opacity,transform]"
      style="opacity: 0; transform: translate3d(0, -100%, 0); pointer-events: none;"
    >
      <div class="flex w-full max-w-7xl flex-col items-center gap-space-sm sm:flex-row sm:justify-between">
        <p class="ui-label max-sm:sr-only m-0 uppercase tracking-widest text-ink-muted">
          Tempus fugit
        </p>
        <.timer
          id="soonex-sticky-countdown"
          countdown
          start_ms={@countdown_start_ms}
          target_ms={0}
          class="timer ui-success ui-rounded-md ui-size-sm"
        >
          <:day_label>Dies</:day_label>
          <:hour_label>Horae</:hour_label>
          <:minute_label>Min</:minute_label>
          <:second_label>Sec</:second_label>
        </.timer>
        <.navigate
          to={Soonex.Public.path("/") <> "#epistula"}
          class="button ui-brand ui-solid ui-size-sm"
        >
          Scribe nomen
        </.navigate>
      </div>
    </div>
    """
  end
end
