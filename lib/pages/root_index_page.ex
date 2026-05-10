defmodule Soonex.RootIndexPage do
  @moduledoc false

  use Tableau.Page,
    layout: Soonex.RootLayout,
    permalink: "/",
    title: "Soonex",
    page_kind: :home,
    sitemap: %{priority: 1.0, changefreq: "weekly"}

  use Phoenix.Component

  def template(assigns), do: Soonex.HomePage.template(assigns)
end
