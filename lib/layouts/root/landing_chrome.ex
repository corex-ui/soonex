defmodule Soonex.Layouts.Root.LandingChrome do
  @moduledoc false

  use Phoenix.Component
  use Corex

  attr(:countdown_start_ms, :integer, required: true)

  def landing_chrome(assigns) do
    ~H"""
    <div
      data-scroll-progress
      class="pointer-events-none fixed inset-x-0 top-0 z-[55] h-1 overflow-hidden bg-layer"
      aria-hidden="true"
    >
      <div
        data-scroll-progress-fill
        class="h-full w-full origin-left bg-[color:var(--color-accent)] will-change-transform"
        style="transform: scaleX(0)"
      >
      </div>
    </div>
    <div
      data-sticky-bar
      role="region"
      aria-label="Launch countdown"
      class="fixed inset-x-0 top-0 z-50 flex w-full justify-center px-space pt-1 motion-safe:will-change-[opacity,transform]"
      style="opacity: 0; transform: translate3d(0, -100%, 0); pointer-events: none;"
    >
      <div class="flex w-full max-w-4xl flex-col items-center gap-space-sm rounded-4xl rounded-t-none border border-t-0 border-border bg-layer px-size py-space-sm shadow-ui sm:flex-row sm:justify-center sm:gap-space-xl sm:py-space">
        <p class="ui-label max-sm:sr-only uppercase tracking-widest text-ink-muted">
          Launching in
        </p>
        <.timer
          id="soonex-sticky-countdown"
          countdown
          start_ms={@countdown_start_ms}
          target_ms={0}
          class="timer timer--accent timer--text-xs sm:timer--text-sm timer--rounded-xl"
        >
          <:day_label>Days</:day_label>
          <:hour_label>Hours</:hour_label>
          <:minute_label>Min</:minute_label>
          <:second_label>Sec</:second_label>
        </.timer>
        <.navigate to="#waitlist" class="button button--accent">
          Join the waitlist
        </.navigate>
      </div>
    </div>
    """
  end
end
