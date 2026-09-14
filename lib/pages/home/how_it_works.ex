defmodule Soonex.HomePage.HowItWorks do
  @moduledoc false

  use Phoenix.Component
  use Corex

  import Soonex.Layouts.Section, only: [block: 1]

  def how_it_works(assigns) do
    ~H"""
    <.block
      id="how-it-works"
      section="how-it-works"
      labelledby="soonex-how-heading"
      eyebrow="How it works"
      tone={:surface}
    >
      <:title>
        From clone to launch in three commands.
      </:title>
      <:lede>
        Mix handles dependencies, Corex design CSS, Tailwind, and esbuild. You edit config and
        content — not a parallel design system.
      </:lede>
      <.tabs
        id="soonex-how-tabs"
        class="tabs tabs--wide ui-brand ui-width-full"
        value="setup"
        items={tab_items()}
      />
      <div class="mt-8 flex justify-start">
        <.clipboard
          id="soonex-how-copy"
          class="clipboard ui-brand ui-solid ui-width-fit ui-size-sm"
          value="mix setup"
        >
          <:label class="sr-only">mix setup</:label>
          <:copy>
            <.heroicon name="hero-clipboard" />
            <span>Copy mix setup</span>
          </:copy>
          <:copied>
            <.heroicon name="hero-check" />
            <span>Copied</span>
          </:copied>
        </.clipboard>
      </div>
    </.block>
    """
  end

  defp tab_items do
    Corex.Content.new([
      %{
        value: "setup",
        label: "Setup",
        content:
          "Run mix setup to fetch Hex deps and build Corex design assets from config :corex_design."
      },
      %{
        value: "customize",
        label: "Customize",
        content:
          "Edit seeds, radius, and typography in config/config.exs, then mix corex.design.build. Update HEEx in lib/pages/home for copy."
      },
      %{
        value: "ship",
        label: "Ship",
        content:
          "Run MIX_ENV=prod mix build to emit _site/. Deploy to GitHub Pages or any static host."
      }
    ])
  end
end
