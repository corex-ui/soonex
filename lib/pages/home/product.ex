defmodule Soonex.HomePage.Product do
  @moduledoc false

  use Phoenix.Component
  use Corex

  import Soonex.Layouts.Section, only: [block: 1]

  alias Soonex.Layouts.Shell

  def product(assigns) do
    assigns = assign(assigns, :snippet, snippet())

    ~H"""
    <.block id="product" labelledby="soonex-product-heading" eyebrow="Product" layout={:open}>
      <:title>
        What you <span class="text-brand-text">fork</span>
      </:title>
      <:lede>
        A waitlist landing, a shipping log, a countdown, and four themes. You replace the stills and
        the date.
      </:lede>
      <.tabs
        id="soonex-product-tabs"
        class="tabs ui-brand ui-size-md ui-width-full"
        indicator
        value="waitlist"
        items={product_tabs()}
      />

      <div class="mt-10 flex flex-col gap-6 border-t border-border pt-10 lg:flex-row lg:items-end lg:gap-8">
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

      <dl class={"#{Shell.lanes()} mt-12 border-t border-border pt-10"}>
        <div :for={lane <- lanes()} class="flex flex-col gap-2 sm:flex-row sm:items-baseline sm:gap-8">
          <dt class="soonex-card-title m-0 min-w-28">{lane.name}</dt>
          <dd class="m-0 flex flex-1 flex-col gap-3 sm:flex-row sm:items-baseline sm:justify-between">
            <p class="lede m-0">{lane.body}</p>
            <.navigate :if={lane.cta} to="#waitlist" class={lane.cta_class}>
              {lane.cta}
            </.navigate>
          </dd>
        </div>
      </dl>
    </.block>
    """
  end

  defp product_tabs do
    Corex.Content.new([
      %{
        value: "waitlist",
        label: "Waitlist",
        content:
          "Email, role, interests, team size, and a launch toast. The same fields sit on the hero still and at the end of the page."
      },
      %{
        value: "journal",
        label: "Journal",
        content:
          "Markdown posts with covers, tags, and a client pager. Add a file, rebuild, and the log updates."
      },
      %{
        value: "themes",
        label: "Themes",
        content:
          "neo, uno, duo, and leo share one near-white field. Type, radius, and brand do the rest."
      },
      %{
        value: "a11y",
        label: "Accessibility",
        content:
          "Zoom, contrast, motion, focus, and underline — stored on this device. The dialog ships with the template."
      }
    ])
  end

  defp lanes do
    [
      %{
        name: "Solo",
        body: "One theme, the waitlist, and the log. Enough to put a date on the page.",
        cta: nil,
        cta_class: nil
      },
      %{
        name: "Studio",
        body: "Four rooms, real stills, and a shipping log you can hand to a client.",
        cta: "Join waitlist",
        cta_class: "button ui-brand ui-solid ui-size-sm w-fit shrink-0"
      },
      %{
        name: "Agency",
        body: "The same fork, with accessibility on and a clone path the team can repeat.",
        cta: nil,
        cta_class: nil
      }
    ]
  end

  defp snippet do
    "git clone https://github.com/corex-ui/soonex.git"
  end
end
