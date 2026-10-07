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
      eyebrow="Workflow"
      tone={:inverse}
      layout={:split}
      heading_size={:large}
    >
      <:title>
        From clone to live in an afternoon.
      </:title>
      <:lede>
        Three steps, all in Mix. No Node toolchain, no parallel design system, and nothing to
        maintain beyond your config and your copy.
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
            "Clone the repo, fetch Hex dependencies, and build the design assets in one command.",
          steps: [
            "Run mix setup from the repo root. It fetches deps and builds Corex design CSS.",
            "Start the dev server with mix server and open localhost:4999.",
            "Try neo, uno, duo, or leo and light or dark mode from Template Options."
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
          intro: "Make it yours with one config block and plain HEEx content modules.",
          steps: [
            "Set seeds, radius, fonts, and type scale under config :corex_design.",
            "Run mix corex.design.build to regenerate tokens and component CSS.",
            "Edit section copy in lib/pages/home and the launch date in Soonex.Launch."
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
            "Build static HTML into _site/ and publish it to GitHub Pages or any static host.",
          steps: [
            "Set SOONEX_PUBLIC_URL to your production origin.",
            "Run MIX_ENV=prod mix build to produce _site/ with prefixed asset paths.",
            "Point the waitlist form at your email provider and go live."
          ],
          command: "MIX_ENV=prod mix build",
          command_label: "prod build"
        }
      }
    ])
  end
end
