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
            <p class="soonex-quote display m-0 text-balance text-2xl font-semibold leading-snug tracking-tight text-ink sm:text-3xl lg:text-4xl">
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
        quote:
          "We forked on a Thursday, swapped the stills Friday, and the waitlist toast was already the one we wanted to ship.",
        name: "Amira N.",
        role: "Founder, studio launch"
      },
      %{
        id: "soonex-voice-jonas",
        src: "/images/people/jonas.jpg",
        initials: "JK",
        quote:
          "No package.json, no LiveView pager, no forked Corex CSS. Mix setup and the controls are the upstream ones.",
        name: "Jonas K.",
        role: "Staff engineer"
      },
      %{
        id: "soonex-voice-leah",
        src: "/images/people/leah.jpg",
        initials: "LM",
        quote:
          "neo, uno, duo, and leo finally feel like four products. Template Options is how we review with clients.",
        name: "Leah M.",
        role: "Product designer"
      }
    ]
  end
end
