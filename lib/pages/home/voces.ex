defmodule Soonex.HomePage.Voces do
  @moduledoc false

  use Phoenix.Component
  use Corex

  alias Soonex.Layouts.Shell

  def voces(assigns) do
    ~H"""
    <section
      id="voces"
      class={"#{Shell.section()} border-y border-border bg-surface"}
      aria-labelledby="soonex-voces-heading"
    >
      <div class={"#{Shell.stage()} #{Shell.stack()}"}>
        <div class="flex max-w-2xl flex-col gap-size-md">
          <p class={Shell.eyebrow()}>Voces</p>
          <h2 id="soonex-voces-heading" class={Shell.section_heading()}>
            Testimonia <span class="text-brand-text">brevia</span>
          </h2>
          <p class={Shell.lede()}>
            Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis.
          </p>
        </div>

        <div class="grid grid-cols-1 gap-space-lg lg:grid-cols-3">
          <blockquote
            :for={{quote, name, role} <- voices()}
            class={"#{Shell.panel()} flex flex-col justify-between gap-size p-size"}
          >
            <p class="display m-0 text-xl leading-snug tracking-tight text-ink">“{quote}”</p>
            <footer class="flex flex-col gap-space-xs">
              <cite class="not-italic font-medium text-ink">{name}</cite>
              <span class="text-sm text-ink-muted">{role}</span>
            </footer>
          </blockquote>
        </div>
      </div>
    </section>
    """
  end

  defp voices do
    [
      {"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor.",
       "Aulus Lorem", "Magister ipsum"},
      {"Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip.",
       "Gaius Dolor", "Scriba sit amet"},
      {"Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore.",
       "Lucia Magna", "Orator aliqua"}
    ]
  end
end
