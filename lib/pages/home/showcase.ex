defmodule Soonex.HomePage.Showcase do
  @moduledoc false

  use Phoenix.Component
  use Corex

  import Soonex.Layouts.Section, only: [block: 1]

  alias Soonex.Layouts.Shell

  def showcase(assigns) do
    assigns = assign(assigns, :config_snippet, config_snippet())

    ~H"""
    <.block
      id="preview"
      section="preview"
      labelledby="soonex-preview-heading"
      eyebrow="Live preview"
      tone={:photo}
      photo="/images/photos/texture.jpg"
    >
      <:title>
        Real components, not screenshots.
      </:title>
      <:lede>
        Every control on this page is a Corex component rendered to static HTML and hydrated in
        the browser. Switch themes in Template Options and watch the whole page follow.
      </:lede>

      <div class={"#{Shell.frame()} shadow-2xl"}>
        <div class="grid grid-cols-1 lg:grid-cols-12">
          <div class="flex flex-col border-b border-border p-8 sm:p-10 lg:col-span-5 lg:border-b-0 lg:border-r">
            <p class={Shell.eyebrow()}>One config</p>
            <h3 class="display mt-3 text-2xl font-medium tracking-tight text-ink">
              Brand once, everywhere.
            </h3>
            <p class="mt-3 text-sm/6 text-ink-muted sm:text-base/7">
              Seeds, radius, and type scale live in a single block. Rebuild and every button,
              field, and panel picks up the change.
            </p>
            <pre class="code code--wide mt-8 overflow-x-auto p-4 text-xs/6 sm:text-sm/6"><code>{@config_snippet}</code></pre>
            <.clipboard
              id="soonex-preview-copy"
              class="clipboard ui-accent ui-size-sm ui-width-fit mt-6"
              value="mix corex.design.build"
            >
              <:label class="sr-only">mix corex.design.build</:label>
              <:copy>
                <.heroicon name="hero-clipboard" />
                <span>Copy build command</span>
              </:copy>
              <:copied>
                <.heroicon name="hero-check" />
                <span>Copied</span>
              </:copied>
            </.clipboard>
          </div>

          <div class="flex flex-col gap-8 p-8 sm:p-10 lg:col-span-7">
            <div class="flex flex-wrap items-center justify-between gap-4">
              <p class={Shell.eyebrow()}>Live UI</p>
              <div class="flex flex-wrap items-center gap-2">
                <span class="badge ui-size-sm">WCAG AA</span>
                <span class="badge ui-size-sm">Light and dark</span>
              </div>
            </div>

            <.tabs
              id="soonex-preview-tabs"
              class="tabs tabs--wide ui-accent ui-width-full"
              value="tokens"
              items={tab_items()}
            >
              <:content :let={item}>
                <div class="flex flex-col gap-4">
                  <p class="m-0 text-base/7">{item.meta.intro}</p>
                  <ul class="m-0 flex list-none flex-col gap-3 p-0">
                    <li :for={point <- item.meta.points} class="flex items-start gap-3 text-sm/6">
                      <.heroicon name="hero-check-circle" class="mt-0.5 size-4 shrink-0" />
                      <span>{point}</span>
                    </li>
                  </ul>
                </div>
              </:content>
            </.tabs>

            <div class="grid grid-cols-1 gap-5 sm:grid-cols-2">
              <.native_input
                type="email"
                name="preview[email]"
                id="soonex-preview-email"
                placeholder="you@company.com"
                class="native-input ui-size-sm ui-width-full"
                readonly
              >
                <:label>Work email</:label>
              </.native_input>
              <.switch
                id="soonex-preview-switch"
                name="preview[notes]"
                checked
                class="switch ui-accent"
              >
                <:label>Send launch notes</:label>
              </.switch>
            </div>

            <div class="flex flex-wrap items-center gap-3 border-t border-border pt-6">
              <span class={Shell.primary_button()}>Join waitlist</span>
              <span class="button ui-ghost ui-size-sm">Maybe later</span>
            </div>
          </div>
        </div>
      </div>
    </.block>
    """
  end

  defp tab_items do
    Corex.Content.new([
      %{
        value: "tokens",
        label: "Tokens",
        content: "Tokens",
        meta: %{
          intro: "Colors are generated from a handful of seeds, so contrast holds in every mode.",
          points: [
            "Light and dark palettes regenerate from the same seeds.",
            "Ink, surface, and accent pairs are checked for readable contrast.",
            "Four starting themes: neo, uno, duo, and leo."
          ]
        }
      },
      %{
        value: "hooks",
        label: "Interactivity",
        content: "Interactivity",
        meta: %{
          intro:
            "Static pages still get real widgets, with no Phoenix server running behind them.",
          points: [
            "Tabs, accordion, select, timer, and marquee hydrate on the client.",
            "Keyboard and screen reader behavior comes from Zag state machines.",
            "Hooks load lazily, so the first paint stays light."
          ]
        }
      },
      %{
        value: "a11y",
        label: "Accessibility",
        content: "Accessibility",
        meta: %{
          intro: "Visitors can tune the page to how they read, and it remembers their choice.",
          points: [
            "Text size, contrast, motion, focus ring, and link underline controls.",
            "Preferences persist locally with no account or backend.",
            "The test suite runs axe against the home page in headless Chrome."
          ]
        }
      }
    ])
  end

  defp config_snippet do
    """
    config :corex_design,
      default_theme: :neo,
      themes: %{
        neo: %{seeds: %{accent: "#7c5cff"}}
      }
    """
    |> String.trim()
  end
end
