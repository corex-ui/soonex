defmodule Soonex.HomePage.Voces do
  @moduledoc false

  use Phoenix.Component
  use Corex

  import Soonex.Layouts.Section, only: [block: 1]

  def voces(assigns) do
    ~H"""
    <.block id="voces" labelledby="soonex-voces-heading" eyebrow="Voces" tone={:surface}>
      <:title>
        Testimonia <span class="text-brand-text">brevia</span>
      </:title>
      <:lede>
        Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi.
      </:lede>
      <div class="grid grid-cols-1 gap-8 lg:grid-cols-3">
        <blockquote class="flex flex-col justify-between border border-border bg-root p-8 lg:col-span-2 lg:p-10">
          <p class="display m-0 text-2xl font-semibold leading-snug tracking-tight text-ink sm:text-3xl">
            “{featured().quote}”
          </p>
          <.voice_footer voice={featured()} />
        </blockquote>
        <div class="flex flex-col gap-8">
          <blockquote
            :for={voice <- supporting()}
            class="flex flex-1 flex-col justify-between border border-border bg-root p-8"
          >
            <p class="display m-0 text-lg font-semibold leading-snug tracking-tight text-ink">
              “{voice.quote}”
            </p>
            <.voice_footer voice={voice} />
          </blockquote>
        </div>
      </div>
    </.block>
    """
  end

  attr(:voice, :map, required: true)

  defp voice_footer(assigns) do
    ~H"""
    <footer class="mt-8 flex items-center gap-4">
      <.avatar id={@voice.id} src="" alt="" class="avatar ui-brand ui-solid ui-size-md">
        <:fallback>
          <span class="text-xs font-semibold">{@voice.initials}</span>
        </:fallback>
      </.avatar>
      <div class="flex flex-col">
        <cite class="not-italic text-sm font-semibold text-ink">{@voice.name}</cite>
        <span class="text-sm text-ink-muted">{@voice.role}</span>
      </div>
    </footer>
    """
  end

  defp featured do
    %{
      id: "soonex-avatar-aulus",
      initials: "AL",
      quote:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
      name: "Aulus Lorem",
      role: "Magister ipsum"
    }
  end

  defp supporting do
    [
      %{
        id: "soonex-avatar-gaius",
        initials: "GD",
        quote:
          "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip.",
        name: "Gaius Dolor",
        role: "Scriba sit amet"
      },
      %{
        id: "soonex-avatar-lucia",
        initials: "LM",
        quote: "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore.",
        name: "Lucia Magna",
        role: "Orator aliqua"
      }
    ]
  end
end
