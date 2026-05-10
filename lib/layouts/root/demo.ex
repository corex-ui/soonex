defmodule Soonex.Layouts.Root.Demo do
  @moduledoc false

  use Phoenix.Component
  use Corex

  attr(:mode, :any, required: true)

  def demo_site_controls(assigns) do
    ~H"""
    <div
      role="region"
      aria-label="Demo site controls"
      class="fixed bottom-space end-space z-50 flex flex-col items-end gap-space"
    >
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
        <:trigger class="button button--sm">
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
                class="select select--sm w-full min-w-0"
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

              <.toggle_group
                id="mode-switcher"
                class="toggle-group toggle-group--sm toggle-group--duo toggle-group--circle"
                multiple={false}
                deselectable={true}
                value={Soonex.Mode.toggle_value(@mode)}
                dir="ltr"
                on_value_change_client="corex:set-mode"
              >
                <:label class="sr-only">Color mode</:label>
                <:item
                  value="dark"
                  aria_label="Toggle color mode"
                >
                  {Soonex.Mode.dual_icon()}
                </:item>
              </.toggle_group>
            </div>
          </div>
        </:content>
      </.floating_panel>
      <.navigate
        to="https://corex.gigalixirapp.com/templates"
        class="button button--accent button--sm"
        external
      >
        Made with Corex <.heroicon name="hero-arrow-down-tray" />
      </.navigate>
    </div>
    """
  end
end
