defmodule Soonex.HomePage.HowItWorks do
  @moduledoc false

  use Phoenix.Component
  use Corex

  import Soonex.Layouts.Section, only: [block: 1]

  def how_it_works(assigns) do
    ~H"""
    <.block
      id="spotlight"
      section="spotlight"
      labelledby="soonex-spotlight-heading"
      tone={:inverse}
      layout={:split}
      heading_size={:large}
    >
      <:title>
        Config-driven UI, shipped as static HTML.
      </:title>
      <:lede>
        Customize seeds, radius, and typography under config :corex_design, then edit HEEx content
        modules. Mix handles Corex design CSS, Tailwind, and esbuild — you do not maintain a
        parallel design system.
      </:lede>
      <.tabs
        id="soonex-how-tabs"
        class="tabs tabs--wide ui-accent ui-width-full"
        value="setup"
        items={tab_items()}
      >
        <:content :let={item}>
          <div class="flex flex-col gap-5">
            <p class="m-0 text-base/7">{item.meta.intro}</p>
            <ul class="m-0 flex list-none flex-col gap-3 p-0">
              <li :for={step <- item.meta.steps} class="flex items-start gap-3 text-sm/6">
                <.heroicon name="hero-check-circle" class="mt-0.5 size-4 shrink-0" />
                <span>{step}</span>
              </li>
            </ul>
            <.clipboard
              id={"soonex-how-copy-#{item.meta.id}"}
              class="clipboard ui-accent ui-size-sm ui-width-fit"
              value={item.meta.command}
            >
              <:label class="sr-only">{item.meta.command}</:label>
              <:copy>
                <.heroicon name="hero-clipboard" />
                <span>Copy {item.meta.command_label}</span>
              </:copy>
              <:copied>
                <.heroicon name="hero-check" />
                <span>Copied</span>
              </:copied>
            </.clipboard>
          </div>
        </:content>
      </.tabs>
    </.block>
    """
  end

  defp tab_items do
    Corex.Content.new([
      %{
        value: "setup",
        label: "Setup",
        content: "Setup",
        meta: %{
          id: "setup",
          intro:
            "Clone Soonex, install Hex dependencies, and build Corex design assets before you open the site locally.",
          steps: [
            "Run mix setup from the repo root — it fetches deps and runs mix corex.design.build.",
            "Start the dev server with mix server and open http://localhost:4999.",
            "Use Template Options to switch neo, uno, duo, or leo and toggle light/dark mode."
          ],
          command: "mix setup",
          command_label: "mix setup"
        }
      },
      %{
        value: "customize",
        label: "Customize",
        content: "Customize",
        meta: %{
          id: "customize",
          intro:
            "Brand the template through config :corex_design and HEEx content modules — not a parallel CSS framework.",
          steps: [
            "Edit seeds, radius, fonts, and typography under config :corex_design.",
            "Run mix corex.design.build to regenerate tokens and component CSS.",
            "Update copy in lib/pages/home and lib/layouts without touching skin files."
          ],
          command: "mix corex.design.build",
          command_label: "mix corex.design.build"
        }
      },
      %{
        value: "ship",
        label: "Ship",
        content: "Ship",
        meta: %{
          id: "ship",
          intro:
            "Tableau emits static HTML into _site/. Deploy the folder to GitHub Pages or any static host.",
          steps: [
            "Set SOONEX_PUBLIC_URL to your production origin before building.",
            "Run MIX_ENV=prod mix build to compile _site/ with prefixed asset paths.",
            "Wire the waitlist form to your provider — the demo toast flow is already in place."
          ],
          command: "MIX_ENV=prod mix build",
          command_label: "prod build"
        }
      }
    ])
  end
end
