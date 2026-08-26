defmodule Soonex.HomePage.Officia do
  @moduledoc false

  use Phoenix.Component
  use Corex

  import Soonex.Layouts.Section, only: [block: 1]

  def officia(assigns) do
    ~H"""
    <.block
      id="officia"
      labelledby="soonex-officia-heading"
      eyebrow="Plans"
      tone={:root}
    >
      <:title>
        Pick a <span class="text-brand-text">starting shape</span>
      </:title>
      <:lede>
        Same template, three ways to ship it. The table is the product — not a widget gallery.
      </:lede>
      <.tabs
        id="soonex-officia"
        class="tabs tabs--wide ui-brand ui-size-md mx-auto w-full max-w-none"
        indicator
        multiple={false}
        collapsible={false}
        value="compare"
        items={offices()}
      >
        <:trigger :let={item}>{item.label}</:trigger>
        <:content :let={item}>
          <div class="flex flex-col gap-6 text-start">
            <p class="display m-0 text-2xl font-semibold tracking-tight text-ink">
              {item.meta.headline}
            </p>
            <p class="m-0 max-w-2xl text-base/7 text-ink-muted">{item.content}</p>
            <.data_table
              :if={item.meta[:table]}
              id="soonex-plan-table"
              class="data-table ui-brand ui-size-sm ui-width-full max-w-none max-h-none"
              rows={plan_rows()}
            >
              <:col :let={row} label="Feature">{row.feature}</:col>
              <:col :let={row} label="Launch">{row.launch}</:col>
              <:col :let={row} label="Studio">{row.studio}</:col>
              <:col :let={row} label="Agency">{row.agency}</:col>
            </.data_table>
          </div>
        </:content>
      </.tabs>
    </.block>
    """
  end

  defp offices do
    Corex.Content.new([
      %{
        value: "compare",
        label: "Compare",
        content: "What you keep when you fork Soonex. Nothing here is billed — it is a map.",
        meta: %{headline: "Launch, Studio, Agency", table: true}
      },
      %{
        value: "launch",
        label: "Launch",
        content:
          "Waitlist, countdown, four theme overlays, and a journal. Enough to publish before the product exists.",
        meta: %{headline: "Ship the site first"}
      },
      %{
        value: "studio",
        label: "Studio",
        content:
          "Keep the overlays and add your own bands. Swap the waitlist for a real backend when you have one.",
        meta: %{headline: "Own the chrome"}
      }
    ])
  end

  defp plan_rows do
    [
      %{
        id: "themes",
        feature: "Theme overlays",
        launch: "Brand seed",
        studio: "Full maps",
        agency: "Full maps + scales"
      },
      %{
        id: "waitlist",
        feature: "Waitlist",
        launch: "Email",
        studio: "Email + role",
        agency: "Email, tags, team size"
      },
      %{
        id: "journal",
        feature: "Journal",
        launch: "Index",
        studio: "Index + tags",
        agency: "Index, tags, RSS"
      },
      %{
        id: "npm",
        feature: "npm for Corex",
        launch: "None",
        studio: "None",
        agency: "None"
      },
      %{
        id: "a11y",
        feature: "Accessibility dialog",
        launch: "Yes",
        studio: "Yes",
        agency: "Yes"
      }
    ]
  end
end
