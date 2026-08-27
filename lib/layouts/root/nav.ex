defmodule Soonex.Layouts.Root.Nav do
  @moduledoc false

  use Phoenix.Component
  use Corex

  import Soonex.Layouts.Brand, only: [lockup: 1]

  alias Soonex.Layouts.Shell

  attr(:countdown_start_ms, :integer, required: true)
  attr(:page_path, :string, default: "/")

  def site_nav(assigns) do
    assigns = assign(assigns, :menu_items, menu_items())

    ~H"""
    <header
      data-site-header
      class="sticky top-0 z-50 border-b border-transparent bg-root py-3 transition-[border-color] duration-200 ease-out data-[condensed]:border-border"
    >
      <div
        data-scroll-progress
        class="pointer-events-none absolute inset-x-0 top-0 z-[1] h-px overflow-hidden bg-border"
        aria-hidden="true"
      >
        <div
          data-scroll-progress-fill
          class="h-full w-full origin-left bg-brand will-change-transform"
          style="transform: scaleX(0)"
        >
        </div>
      </div>

      <div data-header-bar class={"#{Shell.stage()} relative flex items-center justify-between gap-4"}>
        <.lockup />

        <nav class="hidden items-center gap-x-6 lg:flex" aria-label="Primary">
          <.navigate
            :for={item <- desktop_links()}
            to={item.to}
            class={nav_link_class(@page_path, item)}
          >
            {item.label}
          </.navigate>
        </nav>

        <div class="flex items-center gap-3">
          <div
            id="soonex-header-countdown"
            data-header-countdown
            inert
            aria-hidden="true"
            class="invisible max-md:hidden"
          >
            <div class="flex items-center gap-3">
              <.timer
                id="soonex-header-timer"
                countdown
                start_ms={@countdown_start_ms}
                target_ms={0}
                class="timer ui-success ui-rounded-md ui-size-sm"
              >
                <:day_label>Days</:day_label>
                <:hour_label>Hours</:hour_label>
                <:minute_label>Min</:minute_label>
                <:second_label>Sec</:second_label>
              </.timer>
            </div>
          </div>
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

  defp nav_link_class(page_path, item) do
    current? = nav_current?(page_path, item)

    [
      "link ui-nav ui-size-sm relative after:absolute after:inset-x-0 after:-bottom-1 after:h-px after:origin-left after:bg-brand after:transition-transform",
      if(current?, do: "after:scale-x-100", else: "after:scale-x-0 hover:after:scale-x-100")
    ]
  end

  defp nav_current?(page_path, %{id: :journal}) do
    String.starts_with?(page_path, "/blog") or String.starts_with?(page_path, "/tags")
  end

  defp nav_current?(_page_path, _item), do: false

  defp desktop_links do
    [
      %{id: :product, label: "Product", to: Soonex.Public.path("/") <> "#principia"},
      %{id: :journal, label: "Journal", to: Soonex.Public.path("/blog")},
      %{id: :questions, label: "Questions", to: Soonex.Public.path("/") <> "#quaestiones"}
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
