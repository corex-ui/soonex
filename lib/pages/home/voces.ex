defmodule Soonex.HomePage.Voces do
  @moduledoc false

  use Phoenix.Component
  use Corex

  import Soonex.Layouts.Section, only: [block: 1]

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
        Quotes ride a carousel. That is what the component is for.
      </:lede>
      <.carousel
        id="soonex-voces-carousel"
        class="carousel ui-brand ui-width-full max-w-none"
        items={@voices}
        loop
        spacing="1.5rem"
      >
        <:item :let={voice}>
          <blockquote class="flex h-full min-h-56 flex-col justify-between border border-border bg-surface p-8 lg:p-10">
            <p class="display m-0 text-xl font-semibold leading-snug tracking-tight text-ink sm:text-2xl">
              “{voice.quote}”
            </p>
            <footer class="mt-8 flex items-center gap-4">
              <.avatar id={voice.id} src="" alt="" class="avatar ui-brand ui-solid ui-size-md">
                <:fallback>
                  <span class="text-xs font-semibold">{voice.initials}</span>
                </:fallback>
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
        id: "soonex-avatar-amira",
        initials: "AN",
        quote:
          "We published the waitlist in a day. The brand overlay in config was the only design file we needed.",
        name: "Amira N.",
        role: "Founder, studio launch"
      },
      %{
        id: "soonex-avatar-jonas",
        initials: "JK",
        quote:
          "No npm for Corex hooks meant the Mix pipeline stayed the source of truth. Theme switch actually retints.",
        name: "Jonas K.",
        role: "Staff engineer"
      },
      %{
        id: "soonex-avatar-leah",
        initials: "LM",
        quote:
          "The header countdown stays gone until you pass the hero. That is the kind of paper cut a launch site cannot show.",
        name: "Leah M.",
        role: "Product designer"
      }
    ]
  end
end
