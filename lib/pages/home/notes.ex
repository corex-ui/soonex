defmodule Soonex.HomePage.Notes do
  @moduledoc false

  use Phoenix.Component

  import Soonex.Layouts.Section, only: [block: 1]

  def notes(assigns) do
    assigns = assign(assigns, :featured, featured())
    assigns = assign(assigns, :supporting, supporting())

    ~H"""
    <.block
      id="notes"
      labelledby="soonex-notes-heading"
      eyebrow="Studios"
      tone={:surface}
      layout={:editorial}
    >
      <:title>
        Already on the <span class="text-brand-text">September list</span>
      </:title>
      <:lede>
        Founders, engineers, and designers putting Soonex on a calendar — not a backlog.
      </:lede>
      <blockquote class="soonex-note-feature m-0">
        <p class="soonex-quote m-0 text-pretty">“{@featured.quote}”</p>
        <footer class="mt-8">
          <cite class="not-italic text-sm font-semibold text-ink">{@featured.name}</cite>
          <span class="mt-1 block text-sm text-ink-muted">{@featured.role}</span>
        </footer>
      </blockquote>

      <ul class="soonex-note-rail mt-14">
        <li :for={voice <- @supporting}>
          <blockquote class="m-0">
            <p class="m-0 text-pretty text-lg/7">“{voice.quote}”</p>
            <footer class="mt-4">
              <cite class="not-italic text-sm font-semibold text-ink">{voice.name}</cite>
              <span class="mt-1 block text-sm text-ink-muted">{voice.role}</span>
            </footer>
          </blockquote>
        </li>
      </ul>
    </.block>
    """
  end

  defp featured do
    %{
      quote:
        "We had a date before we had a deck. Soonex put the waitlist and the countdown on the page the same afternoon.",
      name: "Amira N.",
      role: "Founder, Northline Studio"
    }
  end

  defp supporting do
    [
      %{
        quote:
          "One clone path, controls included, no second design system. We pointed the date and shipped.",
        name: "Jonas K.",
        role: "Staff engineer, Relay"
      },
      %{
        quote:
          "Four looks for the client review without rebuilding. They picked duo; we kept shipping.",
        name: "Leah M.",
        role: "Product designer, Fieldwork"
      }
    ]
  end
end
