defmodule Soonex.HomePage.Showcase do
  @moduledoc false

  use Phoenix.Component
  use Corex

  alias Soonex.Layouts.Shell

  def showcase(assigns) do
    ~H"""
    <section
      id="showcase"
      data-section="showcase"
      class={"#{Shell.section_compact()} bg-root"}
      aria-label="Corex components in context"
    >
      <div class={Shell.stage_wide()}>
        <div class="soonex-showcase-grid">
          <article class={"#{Shell.frame()} p-6 sm:p-8"}>
            <p class={Shell.eyebrow()}>Actions</p>
            <div class="mt-6 flex min-h-32 flex-col justify-center gap-4">
              <div class="flex flex-wrap items-center gap-3">
                <span class={Shell.primary_button()}>Primary</span>
                <span class="button ui-ghost ui-size-sm">Secondary</span>
                <span class="badge ui-size-sm">Corex</span>
              </div>
            </div>
          </article>

          <article class={"#{Shell.frame()} p-6 sm:p-8"}>
            <p class={Shell.eyebrow()}>Forms</p>
            <div class="mt-6 flex min-h-32 flex-col justify-center gap-4">
              <.native_input
                type="email"
                name="showcase[email]"
                id="soonex-showcase-email"
                placeholder="you@company.com"
                class="native-input ui-size-sm ui-width-full"
                readonly
              >
                <:label>Email</:label>
              </.native_input>
              <.switch id="soonex-showcase-switch" name="showcase[notes]" checked class="switch ui-accent">
                <:label>Launch notes</:label>
              </.switch>
            </div>
          </article>

          <article class={"#{Shell.frame()} p-6 sm:p-8"}>
            <p class={Shell.eyebrow()}>Structure</p>
            <div class="mt-6 flex min-h-32 flex-col justify-center gap-4">
              <.tabs
                id="soonex-showcase-tabs"
                class="tabs tabs--wide ui-accent ui-width-full"
                value="tokens"
                items={tab_items()}
              />
            </div>
          </article>
        </div>
      </div>
    </section>
    """
  end

  defp tab_items do
    Corex.Content.new([
      %{value: "tokens", label: "Tokens", content: "Seeds and modes from config :corex_design."},
      %{value: "hooks", label: "Hooks", content: "Tabs, accordion, and selects hydrate on the client."},
      %{value: "a11y", label: "A11y", content: "Contrast, motion, and focus controls ship in the demo."}
    ])
  end
end
