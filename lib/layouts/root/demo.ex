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
        size={%{width: 220, height: 96}}
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
          <.heroicon name="hero-cog-6-tooth" /> Options
        </:trigger>
        <:title>Display</:title>
        <:close_trigger>
          <.heroicon name="hero-x-mark" />
        </:close_trigger>
        <:content>
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
        </:content>
      </.floating_panel>
      <.navigate
        to="https://hexdocs.pm/corex"
        class="button ui-accent ui-solid ui-size-sm"
        external
      >
        Corex docs <.heroicon name="hero-arrow-up-right" />
      </.navigate>
    </div>
    """
  end
end
