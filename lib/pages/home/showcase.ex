defmodule Soonex.HomePage.Showcase do
  @moduledoc false

  use Phoenix.Component
  use Corex

  alias Soonex.Layouts.Shell

  def showcase(assigns) do
    assigns = assign(assigns, :config_snippet, config_snippet())

    ~H"""
    <section
      id="preview"
      data-section="preview"
      class={"#{Shell.section()} bg-root"}
      aria-labelledby="soonex-preview-heading"
    >
      <div class={Shell.stage()}>
        <p class={Shell.eyebrow()}>Preview</p>
        <h2 id="soonex-preview-heading" class={Shell.section_heading_lg()}>
          Corex components on a static launch page.
        </h2>
        <p class={Shell.lede_wide()}>
          The same tokens, buttons, tabs, and forms you use in LiveView — rendered by Tableau and
          hydrated on the client. Switch themes in Template Options to see all four Corex palettes.
        </p>

        <div class={"#{Shell.frame()} #{Shell.body_tight()} overflow-hidden"}>
          <div class="grid grid-cols-1 lg:grid-cols-12">
            <div class="border-b border-border p-8 sm:p-10 lg:col-span-5 lg:border-b-0 lg:border-r">
              <p class={Shell.eyebrow()}>Config</p>
              <p class="mt-3 text-sm/6 text-ink-muted">
                Seeds and typography live in one place. Rebuild with
                <code class="code">mix corex.design.build</code>.
              </p>
              <.clipboard
                id="soonex-preview-copy"
                class="clipboard ui-accent ui-size-sm ui-width-fit mt-8"
                value={"mix corex.design.build"}
              >
                <:label class="sr-only">mix corex.design.build</:label>
                <:copy>
                  <.heroicon name="hero-clipboard" />
                  <span>Copy command</span>
                </:copy>
                <:copied>
                  <.heroicon name="hero-check" />
                  <span>Copied</span>
                </:copied>
              </.clipboard>
              <pre class="code code--wide mt-6 overflow-x-auto p-4 text-xs/6 sm:text-sm/6"><code>{@config_snippet}</code></pre>
            </div>

            <div class="p-8 sm:p-10 lg:col-span-7">
              <p class={Shell.eyebrow()}>Live UI</p>
              <div class="mt-6 flex flex-wrap items-center gap-3">
                <span class={Shell.primary_button()}>Join waitlist</span>
                <span class="button ui-ghost ui-size-sm">Secondary</span>
                <span class="badge ui-size-sm">Accessible</span>
              </div>
              <div class="mt-8">
                <.tabs
                  id="soonex-preview-tabs"
                  class="tabs tabs--wide ui-accent ui-width-full"
                  value="tokens"
                  items={tab_items()}
                />
              </div>
              <div class="mt-8 grid grid-cols-1 gap-4 sm:grid-cols-2">
                <.native_input
                  type="email"
                  name="preview[email]"
                  id="soonex-preview-email"
                  placeholder="you@company.com"
                  class="native-input ui-size-sm ui-width-full"
                  readonly
                >
                  <:label>Email</:label>
                </.native_input>
                <.switch id="soonex-preview-switch" name="preview[notes]" checked class="switch ui-accent">
                  <:label>Launch notes</:label>
                </.switch>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    """
  end

  defp tab_items do
    Corex.Content.new([
      %{
        value: "tokens",
        label: "Tokens",
        content: "Light and dark palettes regenerate from seeds in config :corex_design."
      },
      %{
        value: "hooks",
        label: "Hooks",
        content: "Tabs, accordion, marquee, and forms hydrate without a Phoenix app server."
      },
      %{
        value: "a11y",
        label: "A11y",
        content: "Contrast, motion, and focus controls ship in the accessibility panel."
      }
    ])
  end

  defp config_snippet do
    """
    config :corex_design,
      default_theme: :neo,
      themes: %{neo: %{seeds: %{...}}}
    """
    |> String.trim()
  end
end
