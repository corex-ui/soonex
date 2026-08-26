defmodule Soonex.HomePage.Principia do
  @moduledoc false

  use Phoenix.Component
  use Corex

  import Soonex.Layouts.Section, only: [block: 1]

  def principia(assigns) do
    ~H"""
    <.block
      id="principia"
      labelledby="soonex-principia-heading"
      eyebrow="Principia"
      tone={:surface}
      align={:center}
    >
      <:title>
        Tria <span class="text-brand-text">fundamenta</span>
      </:title>
      <:lede>
        Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur.
      </:lede>
      <dl class="grid grid-cols-1 gap-x-8 gap-y-16 lg:grid-cols-3">
        <div :for={{icon, title, body} <- pillars()} class="flex flex-col">
          <dt class="flex items-center gap-x-3 text-base/7 font-semibold text-ink">
            <span class="flex size-10 items-center justify-center border border-border bg-root text-brand-text">
              <.heroicon name={icon} class="size-5" />
            </span>
            {title}
          </dt>
          <dd class="mt-4 flex flex-auto flex-col text-base/7 text-ink-muted">
            <p class="m-0 flex-auto">{body}</p>
          </dd>
        </div>
      </dl>
    </.block>
    """
  end

  defp pillars do
    [
      {"hero-sparkles", "Lorem",
       "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."},
      {"hero-squares-2x2", "Ipsum",
       "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."},
      {"hero-shield-check", "Dolor",
       "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur."}
    ]
  end
end
