defmodule Soonex.HomePage.Contents do
  @moduledoc false

  use Phoenix.Component
  use Corex

  import Soonex.Layouts.Section, only: [block: 1]

  alias Soonex.Layouts.Shell

  def contents(assigns) do
    assigns = assign(assigns, :snippet, snippet())

    ~H"""
    <.block
      id="principia"
      labelledby="soonex-principia-heading"
      eyebrow="Product"
      tone={:root}
    >
      <:title>
        Fork once. <span class="text-brand-text">Theme in config.</span>
      </:title>
      <:lede>
        Static on purpose. Tableau builds the pages. Corex runs the controls. You replace the stills
        and the date.
      </:lede>
      <.tabs
        id="soonex-product-tabs"
        class="tabs ui-brand ui-size-md ui-width-full"
        indicator
        value="overview"
        items={product_tabs()}
      />

      <div class={"#{Shell.panel()} mt-12 p-6 sm:p-8"}>
        <div class="flex flex-col gap-6 lg:flex-row lg:items-end lg:gap-8">
          <div class="min-w-0 lg:max-w-xs">
            <small class={Shell.eyebrow()}>Clone</small>
            <p class="lede mt-2">
              mix setup, then mix soonex.server.
            </p>
          </div>
          <.clipboard
            id="soonex-theme-snippet"
            class="clipboard ui-brand ui-solid ui-width-full ui-size-md min-w-0 flex-1"
            value={@snippet}
          >
            <:label>Clone</:label>
            <:copy>
              <.heroicon name="hero-clipboard" />
              <span>Copy</span>
            </:copy>
            <:copied>
              <.heroicon name="hero-check" />
              <span>Copied</span>
            </:copied>
          </.clipboard>
        </div>
      </div>
    </.block>
    """
  end

  defp product_tabs do
    Corex.Content.new([
      %{
        value: "overview",
        label: "Overview",
        content:
          "Static on purpose. Tableau builds the pages. Corex runs the controls. You replace the stills and the date."
      },
      %{
        value: "themes",
        label: "Themes",
        content:
          "neo, uno, duo, and leo share one near-white field. Type, radius, and brand do the rest. Template Options is the client review."
      },
      %{
        value: "mix",
        label: "Mix",
        content:
          "Mix, Tailwind, esbuild. There is no package.json. Host CSS retunes layout. Recipes stay upstream."
      }
    ])
  end

  defp snippet do
    "git clone https://github.com/corex-ui/soonex.git"
  end
end
