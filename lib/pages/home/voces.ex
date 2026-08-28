defmodule Soonex.HomePage.Voces do
  @moduledoc false

  use Phoenix.Component
  use Corex

  import Soonex.Layouts.Section, only: [block: 1]

  alias Soonex.Layouts.Shell

  def voces(assigns) do
    assigns = assign(assigns, :voices, voices())

    ~H"""
    <.block
      id="voces"
      labelledby="soonex-voces-heading"
      eyebrow="Voices"
      tone={:root}
    >
      <:title>
        From studios <span class="text-brand-text">already forking</span>
      </:title>
      <:lede>
        Quotes from the people putting Soonex on a September calendar — not a component gallery.
      </:lede>
      <.carousel
        id="soonex-voces-carousel"
        class="carousel ui-brand ui-width-full max-w-none"
        items={@voices}
        loop
        orientation="horizontal"
        spacing="1.5rem"
        padding="2.5rem"
      >
        <:item :let={voice}>
          <blockquote class={"#{Shell.panel()} flex h-full min-h-72 flex-col justify-between gap-8 p-8 sm:p-10 lg:p-12"}>
            <p class="soonex-quote m-0 text-pretty">
              “{voice.quote}”
            </p>
            <footer class="flex items-center gap-4">
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
          <.heroicon name="hero-chevron-left" />
        </:prev_trigger>
        <:next_trigger>
          <.heroicon name="hero-chevron-right" />
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
        quote: "We didn’t need a design system. We needed a date on the page by Friday.",
        name: "Amira N.",
        role: "Founder, studio launch"
      },
      %{
        id: "soonex-voice-jonas",
        src: "/images/people/jonas.jpg",
        initials: "JK",
        quote: "I grepped for package.json. Then I made coffee.",
        name: "Jonas K.",
        role: "Staff engineer"
      },
      %{
        id: "soonex-voice-leah",
        src: "/images/people/leah.jpg",
        initials: "LM",
        quote: "I review with Template Options now. Four rooms, same building.",
        name: "Leah M.",
        role: "Product designer"
      }
    ]
  end
end
