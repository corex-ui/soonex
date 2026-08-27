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
        Soonex is a static Tableau site with Corex controls already on the page. No LiveView events,
        no npm, no forked component CSS.
      </:lede>
      <.tabs
        id="soonex-product-tabs"
        class="tabs tabs--wide ui-brand ui-size-md"
        indicator
        value="overview"
        items={product_tabs()}
      />

      <div class={"#{Shell.panel()} mt-12 p-6 sm:p-8"}>
        <div class="flex flex-col gap-6 lg:flex-row lg:items-end lg:gap-8">
          <div class="min-w-0 lg:max-w-sm">
            <p class={Shell.eyebrow()}>Quick start</p>
            <p class="mt-2 text-sm/6 text-ink-muted sm:text-base/7">
              Clone the template, then run mix setup and mix soonex.server.
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
          "A waitlist landing page, a Markdown journal, countdown chrome, and the Corex controls already wired on this page. Photography, copy, and the launch date are yours to replace."
      },
      %{
        value: "themes",
        label: "Themes",
        content:
          "neo, uno, duo, and leo live in config. Template Options switches them on this device so they read as four products, not four tints. Host CSS retunes layout; it does not copy Corex recipes."
      },
      %{
        value: "mix",
        label: "Mix",
        content:
          "Mix, Tailwind, and esbuild already in the project are enough. There is no package.json and no Lenis. Host scripts bind the header, the waitlist toast, and journal pagination on the client."
      }
    ])
  end

  defp snippet do
    "git clone https://github.com/corex-ui/soonex.git"
  end
end
