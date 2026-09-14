defmodule Soonex.Theme do
  @moduledoc false

  @themes ~w(neo)
  @default_theme "neo"

  def themes, do: @themes

  def default_theme, do: @default_theme

  def head_script do
    script =
      "<script>document.documentElement.setAttribute(\"data-theme\", \"#{@default_theme}\");</script>"

    Phoenix.HTML.raw(script)
  end

  def current(assigns) do
    case Map.get(assigns, :theme) do
      t when t in @themes -> t
      _ -> @default_theme
    end
  end

  def select_items, do: Corex.List.new([])
end
