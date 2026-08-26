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
        class="h-full w-full origin-left bg-brand will-change-transform"
        style="transform: scaleX(0)"
      >
      </div>
    </div>
    <div
      data-sticky-bar
      role="region"
      aria-label="Launch countdown"
      inert
      aria-hidden="true"
      class="pointer-events-none fixed inset-x-0 top-3 z-50 flex -translate-y-full justify-center px-6 transition-transform duration-200 ease-out data-[shown]:translate-y-0"
    >
      <div class="pointer-events-auto flex w-fit max-w-full flex-wrap items-center justify-center gap-3 rounded-xl border border-border bg-surface px-3 py-2 shadow-sm sm:gap-4 sm:px-4">
        <.timer
          id="soonex-sticky-countdown"
          countdown
          start_ms={@countdown_start_ms}
          target_ms={0}
          class="timer ui-success ui-rounded-md ui-size-sm"
        >
          <:day_label>Days</:day_label>
          <:hour_label>Hours</:hour_label>
          <:minute_label>Min</:minute_label>
          <:second_label>Sec</:second_label>
        </.timer>
        <.navigate
          to={Soonex.Public.path("/") <> "#epistula"}
          class="button ui-brand ui-solid ui-size-sm shrink-0"
        >
          Join waitlist
        </.navigate>
      </div>
    </div>
    """
  end
end
