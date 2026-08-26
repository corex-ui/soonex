defmodule Soonex.HomePage.Kalendarium do
  @moduledoc false

  use Phoenix.Component
  use Corex

  import Soonex.Layouts.Section, only: [block: 1]

  def kalendarium(assigns) do
    ~H"""
    <.block
      id="kalendarium"
      labelledby="soonex-kalendarium-heading"
      eyebrow="Calendar"
      tone={:surface}
    >
      <:title>
        Road to <span class="text-brand-text">1 September</span>
      </:title>
      <:lede>
        The date picker is the launch day object — not a booking backend.
      </:lede>
      <ol class="relative m-0 list-none border-s border-border p-0">
        <li :for={beat <- beats()} class="relative ps-10 pb-12 last:pb-0">
          <span class="absolute -start-[5px] top-1.5 size-2.5 rounded-full bg-brand"></span>
          <p class="m-0 font-mono text-sm tracking-wide text-brand-text">{beat.moment}</p>
          <h3 class="display mt-2 text-xl font-semibold tracking-tight text-ink">{beat.title}</h3>
          <p class="mt-3 max-w-2xl text-base/7 text-ink-muted">{beat.body}</p>
        </li>
      </ol>
      <div class="mt-12 max-w-sm">
        <.date_picker
          id="soonex-launch-day"
          name="launch[day]"
          class="date-picker ui-brand ui-width-full"
          value="2026-09-01"
        >
          <:label>Launch day</:label>
          <:trigger>
            <.heroicon name="hero-calendar" />
          </:trigger>
          <:prev_trigger>
            <.heroicon name="hero-chevron-left" class="icon" />
          </:prev_trigger>
          <:next_trigger>
            <.heroicon name="hero-chevron-right" class="icon" />
          </:next_trigger>
        </.date_picker>
      </div>
    </.block>
    """
  end

  defp beats do
    [
      %{
        moment: "8 May 2026",
        title: "Template notes",
        body: "How to overlay Corex, host fonts, and keep contrast calculated."
      },
      %{
        moment: "1 June 2026",
        title: "Shipping log",
        body: "Waitlist, countdown, and the Mix asset pipeline in production."
      },
      %{
        moment: "1 September 2026",
        title: "Public launch",
        body: "The date on the timer. Fork the repo and retint the brand before then."
      }
    ]
  end
end
