defmodule Soonex.Layouts.Root.Nav do
  @moduledoc false

  use Phoenix.Component
  use Corex

  import Soonex.Layouts.Brand, only: [lockup: 1]

  alias Soonex.Layouts.Shell

  attr(:countdown_start_ms, :integer, required: true)
  attr(:page_path, :string, default: "/")

  def site_nav(assigns) do
    assigns = assign(assigns, :nav_select_items, nav_select_items())

    ~H"""
    <header
      data-site-header
      class="soonex-framer-nav sticky top-0 z-50 border-b border-transparent py-3 data-[condensed]:border-border"
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
        <div class="flex min-w-0 items-center gap-3">
          <.select
            id="soonex-mobile-nav"
            class="select ui-size-sm ui-width-fit soonex-nav-select lg:hidden"
            redirect
            update_trigger={false}
            positioning={
              %Corex.Positioning{
                placement: "bottom-start",
                same_width: false,
                gutter: 8,
                fit_viewport: true,
                strategy: "fixed"
              }
            }
            translation={%Corex.Select.Translation{placeholder: "Open menu"}}
            items={@nav_select_items}
          >
            <:trigger>
              <.heroicon name="hero-bars-3" />
            </:trigger>
          </.select>
          <.lockup />
        </div>

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
            to={Soonex.Public.path("/") <> "#waitlist"}
            class="button ui-brand ui-solid ui-size-md"
          >
            Join waitlist
          </.navigate>
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

  defp nav_current?(page_path, %{id: :log}) do
    String.starts_with?(page_path, "/blog") or String.starts_with?(page_path, "/tags")
  end

  defp nav_current?(_page_path, _item), do: false

  defp desktop_links do
    [
      %{id: :product, label: "Product", to: Soonex.Public.path("/") <> "#product"},
      %{id: :looks, label: "Looks", to: Soonex.Public.path("/") <> "#looks"},
      %{id: :log, label: "Log", to: Soonex.Public.path("/blog")},
      %{id: :questions, label: "Questions", to: Soonex.Public.path("/") <> "#questions"}
    ]
  end

  defp nav_select_items do
    Corex.List.new([
      %{
        label: "Product",
        value: "product",
        to: Soonex.Public.path("/") <> "#product",
        redirect: :href
      },
      %{
        label: "Looks",
        value: "looks",
        to: Soonex.Public.path("/") <> "#looks",
        redirect: :href
      },
      %{
        label: "Log",
        value: "blog",
        to: Soonex.Public.path("/blog"),
        redirect: :href
      },
      %{
        label: "Questions",
        value: "questions",
        to: Soonex.Public.path("/") <> "#questions",
        redirect: :href
      },
      %{
        label: "Join waitlist",
        value: "waitlist",
        to: Soonex.Public.path("/") <> "#waitlist",
        redirect: :href
      }
    ])
  end
end
