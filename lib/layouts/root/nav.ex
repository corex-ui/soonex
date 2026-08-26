defmodule Soonex.Layouts.Root.Nav do
  @moduledoc false

  use Phoenix.Component
  use Corex

  alias Soonex.Layouts.Shell

  def site_nav(assigns) do
    assigns = assign(assigns, :menu_items, menu_items())

    ~H"""
    <header class="border-b border-border bg-root">
      <div class={"#{Shell.stage()} flex items-center justify-between gap-4 py-4"}>
        <.navigate to={Soonex.Public.path("/")} class="link ui-nav ui-size-sm font-semibold">
          Soonex
        </.navigate>

        <nav class="hidden items-center gap-x-6 lg:flex" aria-label="Primary">
          <.navigate
            :for={item <- desktop_links()}
            to={item.to}
            class="link ui-nav ui-size-sm"
          >
            {item.label}
          </.navigate>
        </nav>

        <div class="flex items-center gap-3">
          <.navigate
            to={Soonex.Public.path("/") <> "#epistula"}
            class="button ui-brand ui-solid ui-size-sm"
          >
            Join waitlist
          </.navigate>
          <.menu
            id="soonex-mobile-nav"
            class="menu ui-size-sm ui-width-fit lg:hidden"
            redirect
            aria_label="Open menu"
            items={@menu_items}
          >
            <:trigger>
              <.heroicon name="hero-bars-3" />
              <span class="sr-only">Open menu</span>
            </:trigger>
            <:indicator>
              <.heroicon name="hero-chevron-down" />
            </:indicator>
          </.menu>
        </div>
      </div>
    </header>
    """
  end

  defp desktop_links do
    [
      %{label: "Product", to: Soonex.Public.path("/") <> "#principia"},
      %{label: "Journal", to: Soonex.Public.path("/blog")},
      %{label: "Questions", to: Soonex.Public.path("/") <> "#quaestiones"}
    ]
  end

  defp menu_items do
    Corex.Tree.new([
      %{
        label: "Product",
        value: "principia",
        to: Soonex.Public.path("/") <> "#principia",
        redirect: :href
      },
      %{
        label: "Journal",
        value: "blog",
        to: Soonex.Public.path("/blog"),
        redirect: :href
      },
      %{
        label: "Questions",
        value: "quaestiones",
        to: Soonex.Public.path("/") <> "#quaestiones",
        redirect: :href
      },
      %{
        label: "Join waitlist",
        value: "epistula",
        to: Soonex.Public.path("/") <> "#epistula",
        redirect: :href
      }
    ])
  end
end
