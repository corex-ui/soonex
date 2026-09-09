defmodule Soonex.HomePage.Voices do
  @moduledoc false

  use Phoenix.Component

  import Soonex.Layouts.Media, only: [photo: 1]
  import Soonex.Layouts.Section, only: [block: 1]

  alias Soonex.Layouts.Shell

  def voices(assigns) do
    ~H"""
    <.block
      id="voices"
      section="voices"
      labelledby="soonex-voices-heading"
      eyebrow="Voices"
      tone={:root}
    >
      <:title>
        Real workflows, <span class="soonex-accent">not a component tour.</span>
      </:title>
      <:lede>
        These quotes are placeholders. Keep the grid. Skins restyle the cards; the markup stays.
      </:lede>
      <ul class="soonex-voices m-0 grid list-none grid-cols-1 gap-4 p-0 lg:grid-cols-3">
        <li :for={voice <- voice_items()} class="min-w-0">
          <blockquote class={"#{Shell.panel()} soonex-card-motion soonex-voice flex h-full flex-col p-6 sm:p-8"}>
            <p class="soonex-quote display m-0 flex-1 text-pretty text-lg font-semibold leading-snug tracking-tight text-ink sm:text-xl">
              “{voice.quote}”
            </p>
            <footer class="mt-8 flex items-center gap-3">
              <.photo
                src={voice.src}
                alt={voice.name}
                width={72}
                height={72}
                class="soonex-avatar soonex-avatar-lg"
              />
              <div class="flex min-w-0 flex-col">
                <cite class="not-italic text-sm font-semibold text-ink">{voice.name}</cite>
                <span class="text-sm text-ink-muted">{voice.role}</span>
              </div>
            </footer>
          </blockquote>
        </li>
      </ul>
    </.block>
    """
  end

  defp voice_items do
    [
      %{
        src: "/images/people/amira.jpg",
        quote:
          "We forked Soonex on a Thursday and had a waitlist on a custom domain before the weekend. The skins were the part we did not have to argue about.",
        name: "Amira N.",
        role: "Founder, studio launch"
      },
      %{
        src: "/images/people/jonas.jpg",
        quote:
          "I changed the launch date in one module, ran mix corex.design.build after a seed tweak, and the contrast still held. That is the whole job.",
        name: "Jonas K.",
        role: "Staff engineer"
      },
      %{
        src: "/images/people/leah.jpg",
        quote:
          "Leo does not look like a recolor of neo. That is the bar. If a theme switch is invisible, the template failed.",
        name: "Leah M.",
        role: "Product designer"
      }
    ]
  end
end
