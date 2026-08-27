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
        Lorem ipsum <span class="text-brand-text">dolor sit amet</span>
      </:title>
      <:lede>
        Consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
      </:lede>
      <ul class="grid grid-cols-1 gap-10 sm:grid-cols-3 sm:gap-8">
        <li :for={feature <- features()} class="flex flex-col">
          <.tooltip id={feature.tooltip_id} class="tooltip">
            <:trigger>
              <span class="display text-4xl font-semibold tracking-tight text-brand-text sm:text-5xl">
                {feature.index}
              </span>
              <span class="sr-only">{feature.title}</span>
            </:trigger>
            <:content>{feature.tip}</:content>
          </.tooltip>
          <h3 class="display mt-5 text-xl font-semibold tracking-tight text-ink">
            {feature.title}
          </h3>
          <p class="mt-3 text-sm/6 text-ink-muted sm:text-base/7">{feature.body}</p>
        </li>
      </ul>

      <div class={"#{Shell.panel()} mt-16 p-6 sm:p-8"}>
        <div class="flex flex-col gap-6 lg:flex-row lg:items-end lg:gap-8">
          <div class="min-w-0 lg:max-w-sm">
            <p class={Shell.eyebrow()}>Quick start</p>
            <p class="mt-2 text-sm/6 text-ink-muted sm:text-base/7">
              Clone the template, then run mix setup and mix soonex.server.
            </p>
          </div>
          <.clipboard
            id="soonex-theme-snippet"
            class="clipboard ui-brand ui-width-full ui-size-md min-w-0 flex-1"
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

  defp features do
    [
      %{
        index: "01",
        tooltip_id: "soonex-feature-tokens",
        tip: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
        title: "Lorem ipsum dolor",
        body:
          "Sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
      },
      %{
        index: "02",
        tooltip_id: "soonex-feature-themes",
        tip: "Ut enim ad minim veniam, quis nostrud exercitation ullamco.",
        title: "Ut enim ad minim",
        body:
          "Veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
      },
      %{
        index: "03",
        tooltip_id: "soonex-feature-mix",
        tip: "Duis aute irure dolor in reprehenderit in voluptate velit.",
        title: "Duis aute irure",
        body:
          "Dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur."
      }
    ]
  end

  defp snippet do
    "git clone https://github.com/corex-ui/soonex.git"
  end
end
