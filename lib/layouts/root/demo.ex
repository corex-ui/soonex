defmodule Soonex.Layouts.Root.Demo do
  @moduledoc false

  use Phoenix.Component
  use Corex

  import Soonex.Accessibility, only: [accessibility_panel: 1]

  attr(:mode, :any, required: true)

  def demo_site_controls(assigns) do
    ~H"""
    <div
      role="region"
      aria-label="Demo site controls"
      class="fixed bottom-space end-space z-50 flex flex-col items-end gap-space"
    >
      <.accessibility_panel />
      <.floating_panel
        id="site-controls"
        class="floating-panel"
        dir="ltr"
        size={%{width: 250, height: 120}}
        positioning={
          %Corex.Positioning{
            placement: "bottom-end",
            offset: %Corex.Offset{main_axis: 120, cross_axis: -10}
          }
        }
        resizable={false}
        translation={%Corex.FloatingPanel.Translation{close: "Close"}}
      >
        <:trigger class="button ui-size-sm">
          <.heroicon name="hero-cog-6-tooth" /> Template Options
        </:trigger>
        <:title>Template Options</:title>
        <:close_trigger>
          <.heroicon name="hero-x-mark" />
        </:close_trigger>
        <:content>
          <div class="flex flex-col gap-size">
            <div class="flex flex-row items-end gap-space">
              <.select
                id="theme-switcher"
                class="select ui-size-sm w-full min-w-0"
                dir="ltr"
                items={Soonex.Theme.select_items()}
                value={[]}
                close_on_select={false}
                update_trigger={false}
                on_value_change_client="corex:set-theme"
                translation={%Corex.Select.Translation{placeholder: "Theme"}}
              >
                <:label>Theme</:label>
                <:trigger>
                  <.heroicon name="hero-chevron-down" />
                </:trigger>
                <:item_indicator>
                  <.heroicon name="hero-check" />
                </:item_indicator>
              </.select>

              <.toggle
                id="mode-switcher"
                class="toggle ui-size-sm"
                data-toggle-dual-label
                pressed={@mode == "dark"}
                dir="ltr"
                on_pressed_change_client="corex:set-mode"
              >
                <span class="sr-only">Color mode</span>
                <span>
                  <.heroicon name="hero-moon" />
                </span>
                <span data-pressed>
                  <.heroicon name="hero-sun" />
                </span>
              </.toggle>
            </div>
          </div>
        </:content>
      </.floating_panel>
      <.navigate
        to="https://corex.gigalixirapp.com/templates"
        class="button ui-accent ui-solid ui-size-sm"
        external
      >
        Made with Corex <.heroicon name="hero-arrow-down-tray" />
      </.navigate>
    </div>
    """
  end
end
