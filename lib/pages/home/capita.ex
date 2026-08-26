defmodule Soonex.HomePage.Capita do
  @moduledoc false

  use Phoenix.Component
  use Corex

  import Soonex.Layouts.Section, only: [block: 1]

  alias Soonex.Layouts.Shell

  def capita(assigns) do
    ~H"""
    <.block id="capita" labelledby="soonex-capita-heading" eyebrow="Capita" tone={:root}>
      <:title>
        Sex <span class="text-brand-text">argumenta</span>
      </:title>
      <:lede>
        At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti.
      </:lede>
      <div class="grid grid-cols-1 gap-px overflow-hidden border border-border bg-border sm:grid-cols-2 lg:grid-cols-3">
        <article
          :for={{featured?, kicker, title, body} <- chapters()}
          class={"flex flex-col bg-surface p-8 #{if featured?, do: "sm:col-span-2 lg:row-span-2"}"}
        >
          <p class={Shell.eyebrow()}>{kicker}</p>
          <h3 class="display mt-2 text-xl font-semibold tracking-tight text-ink sm:text-2xl">
            {title}
          </h3>
          <p class="mt-4 flex-auto text-sm/6 text-ink-muted sm:text-base/7">{body}</p>
          <div :if={featured?} class={"#{Shell.panel()} mt-8 bg-root"}>
            <div class="flex items-center gap-2 border-b border-border px-3 py-2">
              <span class="size-2 rounded-full bg-border"></span>
              <span class="size-2 rounded-full bg-border"></span>
              <span class="size-2 rounded-full bg-border"></span>
              <span class="ms-2 font-mono text-xs text-ink-muted">lorem.ipsum</span>
            </div>
            <pre class="m-0 overflow-x-auto p-4 font-mono text-xs leading-6 text-ink-muted">sed do eiusmod tempor incididunt
    ut labore et dolore magna aliqua
    quis nostrud exercitation ullamco</pre>
          </div>
        </article>
      </div>
    </.block>
    """
  end

  defp chapters do
    [
      {true, "Caput I", "Sit amet consectetur",
       "Adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."},
      {false, "Caput II", "Ut enim ad minim",
       "Veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo."},
      {false, "Caput III", "Duis aute irure",
       "Dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla."},
      {false, "Caput IV", "Excepteur sint",
       "Occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit."},
      {false, "Caput V", "Nemo enim ipsam",
       "Voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur."}
    ]
  end
end
