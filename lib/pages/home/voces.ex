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
        Lorem ipsum <span class="text-brand-text">dolor sit amet</span>
      </:title>
      <:lede>
        Consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
      </:lede>
      <.carousel
        id="soonex-voces-carousel"
        class="carousel ui-brand ui-width-full max-w-none"
        items={@voices}
        loop
        spacing="1.5rem"
      >
        <:item :let={voice}>
          <blockquote class={"#{Shell.frame()} grid h-full min-h-80 grid-cols-1 overflow-hidden sm:grid-cols-5 sm:items-stretch"}>
            <div class="relative min-h-64 sm:col-span-2 sm:min-h-[28rem]">
              <.photo
                src={voice.src}
                alt={voice.name}
                width={800}
                height={800}
                class="absolute inset-0 size-full"
              />
            </div>
            <div class="flex min-h-0 flex-col justify-center gap-8 p-8 sm:col-span-3 lg:p-12">
              <p class="soonex-quote display m-0 flex-1 text-balance text-3xl font-semibold leading-snug tracking-tight text-ink sm:text-4xl">
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
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        name: "Amira N.",
        role: "Founder, studio launch"
      },
      %{
        src: "/images/people/jonas.jpg",
        quote:
          "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
        name: "Jonas K.",
        role: "Staff engineer"
      },
      %{
        src: "/images/people/leah.jpg",
        quote:
          "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
        name: "Leah M.",
        role: "Product designer"
      }
    ]
  end
end
