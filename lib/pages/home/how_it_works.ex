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
      />
      <div class="mt-8 flex justify-start">
        <.clipboard
          id="soonex-how-copy"
          class="clipboard ui-accent ui-solid ui-width-fit ui-size-sm"
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
