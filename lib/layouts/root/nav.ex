defmodule Soonex.Layouts.Root.Nav do
  @moduledoc false

  use Phoenix.Component
  use Corex

  import Soonex.Layouts.Brand, only: [lockup: 1]

  alias Soonex.Layouts.Shell
  alias Soonex.Public

  attr(:page_path, :string, default: "/")

  def site_nav(assigns) do
    assigns = assign(assigns, :nav_select_items, nav_select_items())

    ~H"""
    <header class="sticky top-0 z-50 border-b border-border bg-root/95 backdrop-blur-sm">
      <div class={"#{Shell.stage()} flex items-center justify-between gap-4 py-4"}>
        <div class="flex min-w-0 items-center gap-3">
          <.select
            id="soonex-mobile-nav"
            class="select ui-size-sm ui-width-fit lg:hidden"
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
            translation={%Corex.Select.Translation{placeholder: "Menu"}}
            items={@nav_select_items}
          >
            <:trigger>
              <.heroicon name="hero-bars-3" />
            </:trigger>
          </.select>
          <.lockup />
        </div>

        <nav class="hidden items-center gap-x-8 lg:flex" aria-label="Primary">
          <.navigate
            :for={item <- desktop_links()}
            to={item.to}
            class={nav_link_class(@page_path, item)}
          >
            {item.label}
          </.navigate>
        </nav>

        <.navigate to={Public.path("/") <> "#waitlist"} class="button ui-brand ui-solid ui-size-sm">
          Join waitlist
        </.navigate>
      </div>
    </header>
    """
  end

  defp nav_link_class(page_path, item) do
    current? = nav_current?(page_path, item)

    [
      "link ui-nav ui-size-sm",
      if(current?, do: "text-ink", else: "text-ink-muted hover:text-ink")
    ]
  end

  defp nav_current?(page_path, %{id: :journal}) do
    String.starts_with?(page_path, "/blog") or String.starts_with?(page_path, "/tags")
  end

  defp nav_current?(_page_path, _item), do: false

  defp desktop_links do
    [
      %{id: :product, label: "Product", to: Public.path("/") <> "#features"},
      %{id: :how, label: "How it works", to: Public.path("/") <> "#how-it-works"},
      %{id: :pricing, label: "Plans", to: Public.path("/") <> "#pricing"},
      %{id: :journal, label: "Journal", to: Public.path("/blog")},
      %{id: :questions, label: "FAQ", to: Public.path("/") <> "#questions"}
    ]
  end

  defp nav_select_items do
    Corex.List.new([
      %{label: "Product", value: "features", to: Public.path("/") <> "#features", redirect: :href},
      %{
        label: "How it works",
        value: "how",
        to: Public.path("/") <> "#how-it-works",
        redirect: :href
      },
      %{label: "Plans", value: "pricing", to: Public.path("/") <> "#pricing", redirect: :href},
      %{label: "Journal", value: "blog", to: Public.path("/blog"), redirect: :href},
      %{label: "FAQ", value: "questions", to: Public.path("/") <> "#questions", redirect: :href},
      %{label: "Join waitlist", value: "waitlist", to: Public.path("/") <> "#waitlist", redirect: :href}
    ])
  end
end
