defmodule Soonex.HomePage.Voces do
  @moduledoc false

  use Phoenix.Component
  use Corex

  import Soonex.Layouts.Media, only: [photo: 1]
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
        From teams who <span class="text-brand-text">ship static first</span>
      </:title>
      <:lede>
        Quotes ride a carousel. Portraits are Unsplash. That is what the component is for.
      </:lede>
      <.carousel
        id="soonex-voces-carousel"
        class="carousel ui-brand ui-width-full max-w-none"
        items={@voices}
        loop
        spacing="1.5rem"
      >
        <:item :let={voice}>
          <blockquote class={"#{Shell.frame()} grid h-full min-h-72 grid-cols-1 overflow-hidden sm:grid-cols-5"}>
            <div class="relative min-h-56 sm:col-span-2 sm:min-h-full">
              <.photo
                src={voice.src}
                alt={voice.name}
                width={800}
                height={800}
                class="absolute inset-0 size-full"
              />
            </div>
            <div class="flex flex-col justify-between gap-8 p-8 sm:col-span-3 lg:p-10">
              <p class="soonex-quote display m-0 text-xl font-semibold leading-snug tracking-tight text-ink sm:text-2xl lg:text-3xl">
                “{voice.quote}”
              </p>
              <footer class="flex flex-col">
                <cite class="not-italic text-sm font-semibold text-ink">{voice.name}</cite>
                <span class="text-sm text-ink-muted">{voice.role}</span>
              </footer>
            </div>
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
        src: "/images/people/amira.jpg",
        quote:
          "We published the waitlist in a day. The brand overlay in config was the only design file we needed.",
        name: "Amira N.",
        role: "Founder, studio launch"
      },
      %{
        src: "/images/people/jonas.jpg",
        quote:
          "No npm for Corex hooks meant the Mix pipeline stayed the source of truth. Theme switch actually retints.",
        name: "Jonas K.",
        role: "Staff engineer"
      },
      %{
        src: "/images/people/leah.jpg",
        quote:
          "The header countdown stays gone until you pass the hero. That is the kind of paper cut a launch site cannot show.",
        name: "Leah M.",
        role: "Product designer"
      }
    ]
  end
end
