defmodule Soonex.HomePage.Officia do
  @moduledoc false

  use Phoenix.Component
  use Corex

  import Soonex.Layouts.Section, only: [block: 1]

  alias Soonex.Layouts.Shell

  def officia(assigns) do
    ~H"""
    <.block
      id="officia"
      labelledby="soonex-officia-heading"
      eyebrow="Plans"
      tone={:root}
    >
      <:title>
        Sed do eiusmod <span class="text-brand-text">tempor</span>
      </:title>
      <:lede>
        Consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
      </:lede>
      <div class="grid grid-cols-1 gap-4 sm:grid-cols-3">
        <article :for={plan <- plans()} class={"#{Shell.panel()} flex flex-col p-6 sm:p-8"}>
          <p class={Shell.eyebrow()}>{plan.name}</p>
          <h3 class="display mt-2 text-xl font-semibold tracking-tight text-ink">{plan.headline}</h3>
          <p class="mt-3 flex-auto text-sm/6 text-ink-muted sm:text-base/7">{plan.body}</p>
        </article>
      </div>
      <div class={"#{Shell.panel()} mt-4 overflow-hidden p-4 sm:p-6"}>
        <.data_table
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
    </.block>
    """
  end

  defp plans do
    [
      %{
        name: "Launch",
        headline: "Lorem ipsum dolor",
        body: "Sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore."
      },
      %{
        name: "Studio",
        headline: "Ut enim ad minim",
        body: "Veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo."
      },
      %{
        name: "Agency",
        headline: "Duis aute irure",
        body: "Dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla."
      }
    ]
  end

  defp plan_rows do
    [
      %{
        id: "lorem",
        feature: "Lorem ipsum",
        launch: "Dolor",
        studio: "Sit amet",
        agency: "Consectetur"
      },
      %{
        id: "ipsum",
        feature: "Adipiscing elit",
        launch: "Sed do",
        studio: "Eiusmod",
        agency: "Tempor"
      },
      %{
        id: "dolor",
        feature: "Incididunt ut",
        launch: "Labore",
        studio: "Et dolore",
        agency: "Magna aliqua"
      },
      %{
        id: "sit",
        feature: "Ut enim ad",
        launch: "Minim",
        studio: "Veniam",
        agency: "Quis nostrud"
      },
      %{
        id: "amet",
        feature: "Exercitation",
        launch: "Ullamco",
        studio: "Laboris",
        agency: "Nisi ut"
      }
    ]
  end
end
