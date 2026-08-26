defmodule Soonex.HomePage.Kalendarium do
  @moduledoc false

  use Phoenix.Component
  use Corex

  import Soonex.Layouts.Section, only: [block: 1]

  def kalendarium(assigns) do
    ~H"""
    <.block
      id="kalendarium"
      labelledby="soonex-kalendarium-heading"
      eyebrow="Kalendarium"
      tone={:root}
      layout={:sticky}
    >
      <:title>
        Tempora <span class="text-brand-text">ventura</span>
      </:title>
      <:lede>
        Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur.
      </:lede>
      <ol class="relative m-0 list-none border-s border-border p-0">
        <li :for={{moment, title, body} <- beats()} class="relative ps-10 pb-12 last:pb-0">
          <span class="absolute -start-[5px] top-1.5 size-2.5 rounded-full bg-[color:var(--color-brand)]"></span>
          <p class="m-0 font-mono text-sm tracking-wide text-brand-text">{moment}</p>
          <h3 class="display mt-2 text-xl font-semibold tracking-tight text-ink">{title}</h3>
          <p class="mt-3 max-w-2xl text-base/7 text-ink-muted">{body}</p>
        </li>
      </ol>
    </.block>
    """
  end

  defp beats do
    [
      {"Kal. Ian.", "Initium",
       "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore."},
      {"Id. Mart.", "Medius cursus",
       "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo."},
      {"Non. Iun.", "Proelium",
       "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla."},
      {"Prid. Sept.", "Finis",
       "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim."}
    ]
  end
end
