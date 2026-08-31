defmodule Soonex.HomePage.Notes do
  @moduledoc false

  use Phoenix.Component
  use Corex

  import Soonex.Layouts.Section, only: [block: 1]

  def notes(assigns) do
    ~H"""
    <.block
      id="notes"
      labelledby="soonex-notes-heading"
      eyebrow="Studios"
      tone={:surface}
      layout={:open}
    >
      <:title>
        Already on the <span class="text-brand-text">September list</span>
      </:title>
      <:lede>
        Founders, engineers, and designers putting Soonex on a calendar.
      </:lede>

      <.carousel
        id="soonex-voices"
        class="carousel ui-brand ui-width-full soonex-voices-carousel"
        items={voices()}
        slides_per_page={1}
        spacing="1.5rem"
      >
        <:item :let={voice}>
          <blockquote class="soonex-voice-slide m-0">
            <p class="soonex-quote m-0 text-pretty">“{voice.quote}”</p>
            <footer class="mt-8 flex items-center gap-4">
              <.avatar
                id={voice.id}
                src={Soonex.Public.path(voice.src)}
                alt={voice.name}
                class="avatar ui-size-md"
              >
                <:fallback>{voice.initials}</:fallback>
              </.avatar>
              <div class="flex flex-col">
                <cite class="not-italic text-sm font-semibold text-ink">{voice.name}</cite>
                <span class="text-sm text-ink-muted">{voice.role}</span>
              </div>
            </footer>
          </blockquote>
        </:item>
        <:prev_trigger>
          <.heroicon name="hero-arrow-left" />
        </:prev_trigger>
        <:next_trigger>
          <.heroicon name="hero-arrow-right" />
        </:next_trigger>
      </.carousel>
    </.block>
    """
  end

  defp voices do
    [
      %{
        id: "soonex-voice-amira",
        src: "/images/people/amira.jpg",
        initials: "AN",
        quote:
          "We had a date before we had a deck. Soonex put the waitlist and the countdown on the page the same afternoon.",
        name: "Amira N.",
        role: "Founder, Northline Studio"
      },
      %{
        id: "soonex-voice-jonas",
        src: "/images/people/jonas.jpg",
        initials: "JK",
        quote:
          "One clone path, controls included, no second design system. We pointed the date and shipped the stills.",
        name: "Jonas K.",
        role: "Staff engineer, Relay"
      },
      %{
        id: "soonex-voice-leah",
        src: "/images/people/leah.jpg",
        initials: "LM",
        quote:
          "Four looks for the client review without rebuilding. They picked duo; we kept shipping.",
        name: "Leah M.",
        role: "Product designer, Fieldwork"
      }
    ]
  end
end
