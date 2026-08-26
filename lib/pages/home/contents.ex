defmodule Soonex.HomePage.Contents do
  @moduledoc false

  use Phoenix.Component

  import Soonex.Layouts.Rows, only: [data_rows: 1]
  import Soonex.Layouts.Section, only: [block: 1]

  def contents(assigns) do
    ~H"""
    <.block id="index" labelledby="soonex-index-heading" eyebrow="Index" tone={:root} layout={:sticky}>
      <:title>
        Capita <span class="text-brand-text">huius paginae</span>
      </:title>
      <:lede>
        Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime.
      </:lede>
      <.data_rows id="soonex-index-list" items={entries()} icon="hero-arrow-down" />
    </.block>
    """
  end

  defp entries do
    Corex.Content.new([
      %{
        label: "I",
        content: "Tria fundamenta lorem ipsum dolor sit amet.",
        meta: %{href: "#principia", title: "Principia", icon: "hero-arrow-down"}
      },
      %{
        label: "II",
        content: "Sex argumenta sed do eiusmod tempor incididunt.",
        meta: %{href: "#capita", title: "Capita", icon: "hero-arrow-down"}
      },
      %{
        label: "III",
        content: "Tria officia ut enim ad minim veniam quis.",
        meta: %{href: "#officia", title: "Officia", icon: "hero-arrow-down"}
      },
      %{
        label: "IV",
        content: "Tempora ventura duis aute irure dolor.",
        meta: %{href: "#kalendarium", title: "Kalendarium", icon: "hero-arrow-down"}
      },
      %{
        label: "V",
        content: "Testimonia brevia excepteur sint occaecat.",
        meta: %{href: "#voces", title: "Voces", icon: "hero-arrow-down"}
      },
      %{
        label: "VI",
        content: "Recentiora scripta sunt in culpa qui officia.",
        meta: %{href: "#acta", title: "Acta", icon: "hero-arrow-down"}
      },
      %{
        label: "VII",
        content: "Saepe quaeruntur mollit anim id est laborum.",
        meta: %{href: "#quaestiones", title: "Quaestiones", icon: "hero-arrow-down"}
      },
      %{
        label: "VIII",
        content: "Scribe nomen tuum ad epistulam lorem.",
        meta: %{href: "#epistula", title: "Epistula", icon: "hero-arrow-down"}
      }
    ])
  end
end
