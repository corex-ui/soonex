defmodule Soonex.HomePage.LaunchBand do
  @moduledoc false

  use Phoenix.Component
  use Corex

  import Soonex.Layouts.Section, only: [block: 1]

  alias Soonex.Layouts.Shell

  def launch_band(assigns) do
    ~H"""
    <.block
      id="launch"
      section="launch"
      labelledby="soonex-launch-heading"
      eyebrow="Launch"
      tone={:surface}
    >
      <:title>
        Road to <span class="soonex-accent">{Soonex.Launch.year_label()}</span>
      </:title>
      <:lede>
        Four beats. Replace the dates in Soonex.Launch. The header countdown reads the same target.
      </:lede>
      <ol class="soonex-launch m-0 list-none p-0">
        <li
          :for={beat <- beats()}
          class={"#{Shell.panel()} soonex-launch-beat soonex-card-motion flex flex-col p-6 sm:p-8"}
          data-featured={if(beat.featured, do: "true")}
        >
          <p class="soonex-launch-moment m-0 font-mono text-sm tracking-wide text-brand-text">
            {beat.moment}
          </p>
          <h3 class="display mt-3 text-xl font-semibold tracking-tight text-ink sm:text-2xl">
            {beat.title}
          </h3>
          <p class="mt-3 flex-auto text-sm/6 text-ink-muted sm:text-base/7">{beat.body}</p>
        </li>
      </ol>
    </.block>
    """
  end

  defp beats do
    [
      %{
        moment: "12 March 2026",
        title: "First cut of the waitlist",
        featured: false,
        body:
          "Hero, form fields, and the toast path landed so a founder can see the success state before attaching a list."
      },
      %{
        moment: "1 June 2026",
        title: "Four skins, one markup tree",
        featured: false,
        body:
          "Neo, uno, duo, and leo stopped sharing one layout. Each theme now has a CSS file you can delete."
      },
      %{
        moment: "2 August 2026",
        title: "Journal and tags",
        featured: false,
        body:
          "Markdown posts, covers, and RSS joined the landing page so the launch log is part of the template."
      },
      %{
        moment: Soonex.Launch.year_label(),
        title: "Public launch",
        featured: true,
        body:
          "Replace this date in Soonex.Launch. The header countdown appears after the hero and counts down to the same instant."
      }
    ]
  end
end
