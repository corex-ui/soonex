defmodule Soonex.Layouts.Brand do
  @moduledoc false

  use Phoenix.Component
  use Corex

  attr(:class, :any, default: nil)
  attr(:to, :string, default: nil)

  def lockup(assigns) do
    assigns = assign(assigns, :to, assigns.to || Soonex.Public.path("/"))

    ~H"""
    <.navigate
      to={@to}
      type="href"
      class={["link ui-nav ui-size-md flex items-center gap-2 no-underline", @class]}
    >
      <.mark class="size-8 shrink-0" />
      <span class="display text-lg font-semibold tracking-tight text-ink">Soonex</span>
    </.navigate>
    """
  end

  attr(:class, :any, default: "size-8")

  def mark(assigns) do
    ~H"""
    <svg
      xmlns="http://www.w3.org/2000/svg"
      viewBox="0 0 32 32"
      fill="currentColor"
      class={@class}
      aria-hidden="true"
    >
      <path
        fill-rule="evenodd"
        d="M10 2h12a8 8 0 0 1 8 8v12a8 8 0 0 1-8 8H10a8 8 0 0 1-8-8V10a8 8 0 0 1 8-8Zm6 6.25 1.7 5.15 5.15 1.6-5.15 1.6L16 21.75l-1.7-5.15-5.15-1.6 5.15-1.6L16 8.25Z"
        clip-rule="evenodd"
      />
    </svg>
    """
  end
end
