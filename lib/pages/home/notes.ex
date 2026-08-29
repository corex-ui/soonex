defmodule Soonex.HomePage.Notes do
  @moduledoc false

  use Phoenix.Component
  use Corex

  import Soonex.Layouts.Section, only: [block: 1]

  def notes(assigns) do
    assigns = assign(assigns, :featured, featured())
    assigns = assign(assigns, :supporting, supporting())

    ~H"""
    <.block id="notes" labelledby="soonex-notes-heading" eyebrow="Studio" layout={:editorial}>
      <:title>
        Notes from studios <span class="text-brand-text">already forking</span>
      </:title>
      <:lede>
        Short lines from people putting Soonex on a September calendar.
      </:lede>
      <blockquote class="m-0">
        <p class="soonex-quote m-0 text-pretty">“{@featured.quote}”</p>
        <footer class="mt-8 flex items-center gap-4">
          <.avatar
            id={@featured.id}
            src={Soonex.Public.path(@featured.src)}
            alt={@featured.name}
            class="avatar ui-size-md"
          >
            <:fallback>{@featured.initials}</:fallback>
          </.avatar>
          <div class="flex flex-col">
            <cite class="not-italic text-sm font-semibold text-ink">{@featured.name}</cite>
            <span class="text-sm text-ink-muted">{@featured.role}</span>
          </div>
        </footer>
      </blockquote>

      <ul class="mt-12 flex list-none flex-col gap-10 p-0">
        <li :for={voice <- @supporting}>
          <blockquote class="m-0">
            <p class="m-0 text-pretty text-lg/7">{voice.quote}</p>
            <footer class="mt-4 flex items-center gap-3">
              <.avatar
                id={voice.id}
                src={Soonex.Public.path(voice.src)}
                alt={voice.name}
                class="avatar ui-size-sm"
              >
                <:fallback>{voice.initials}</:fallback>
              </.avatar>
              <div class="flex flex-col">
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

  defp featured do
    %{
      id: "soonex-voice-amira",
      src: "/images/people/amira.jpg",
      initials: "AN",
      quote: "We needed a date on the page before the deck was done.",
      name: "Amira N.",
      role: "Founder"
    }
  end

  defp supporting do
    [
      %{
        id: "soonex-voice-jonas",
        src: "/images/people/jonas.jpg",
        initials: "JK",
        quote: "Static site, controls included, one clone path.",
        name: "Jonas K.",
        role: "Staff engineer"
      },
      %{
        id: "soonex-voice-leah",
        src: "/images/people/leah.jpg",
        initials: "LM",
        quote: "Four rooms for a client review without a second build.",
        name: "Leah M.",
        role: "Product designer"
      }
    ]
  end
end
