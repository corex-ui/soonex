defmodule Soonex.Layouts.Brand do
  @moduledoc false

  use Phoenix.Component
  use Corex

  attr(:class, :any, default: nil)
  attr(:to, :string, default: nil)

  def lockup(assigns) do
    assigns = assign_new(assigns, :to, fn -> Soonex.Public.path("/") end)

    ~H"""
    <.navigate
      to={@to}
      class={["link ui-nav ui-size-sm flex items-center gap-2 no-underline", @class]}
    >
      <.mark class="size-6 shrink-0" />
      <span class="display text-sm font-semibold tracking-tight text-ink">Soonex</span>
    </.navigate>
    """
  end

  attr(:class, :any, default: "size-6")

  def mark(assigns) do
    ~H"""
    <svg
      xmlns="http://www.w3.org/2000/svg"
      viewBox="0 0 32 32"
      fill="none"
      class={@class}
      aria-hidden="true"
    >
      <path
        d="M23 7.35c0-2.1-1.82-3.6-4.55-3.6H12.4C9.28 3.75 7.15 5.8 7.15 8.7c0 2.65 2.05 4.55 5.1 4.75h7.2c1.08 0 1.95.82 1.95 1.85s-.87 1.85-1.95 1.85H12.4c-3.9 0-7 2.95-7 6.6 0 3.55 2.9 6.25 7 6.25h6.7c3.15 0 5.5-2 5.5-4.65"
        stroke="currentColor"
        stroke-width="2.7"
        stroke-linecap="round"
        stroke-linejoin="round"
      />
      <path
        d="M21.15 4.2 26.7 2.3l1.05 4.55-2.8-.9-1.4 1.4-1.8-1.8 1.4-1.4z"
        fill="currentColor"
      />
    </svg>
    """
  end
end
