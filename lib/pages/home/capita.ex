defmodule Soonex.HomePage.Capita do
  @moduledoc false

  use Phoenix.Component
  use Corex

  alias Soonex.Layouts.Shell

  def capita(assigns) do
    ~H"""
    <section
      id="capita"
      class={"#{Shell.section()} border-y border-border bg-surface"}
      aria-labelledby="soonex-capita-heading"
    >
      <div class={"#{Shell.stage()} #{Shell.stack()}"}>
        <div class="flex max-w-2xl flex-col gap-size-md">
          <p class={Shell.eyebrow()}>Capita</p>
          <h2 id="soonex-capita-heading" class={Shell.section_heading()}>
            Sex <span class="text-brand-text">argumenta</span>
          </h2>
          <p class={Shell.lede()}>
            At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum.
          </p>
        </div>

        <div class="grid grid-cols-1 gap-space-xl sm:grid-cols-2 xl:grid-cols-3">
          <article
            :for={{kicker, title, body} <- chapters()}
            class="flex flex-col gap-space border-t border-border pt-size"
          >
            <p class={Shell.eyebrow()}>{kicker}</p>
            <h3 class="display m-0 text-xl tracking-tight">{title}</h3>
            <p class="m-0 text-sm leading-relaxed text-ink-muted">{body}</p>
          </article>
        </div>
      </div>
    </section>
    """
  end

  defp chapters do
    [
      {"Caput I", "Sit amet consectetur",
       "Adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."},
      {"Caput II", "Ut enim ad minim",
       "Veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo."},
      {"Caput III", "Duis aute irure",
       "Dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla."},
      {"Caput IV", "Excepteur sint",
       "Occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit."},
      {"Caput V", "Nemo enim ipsam",
       "Voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur."},
      {"Caput VI", "Neque porro quisquam",
       "Est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit."}
    ]
  end
end
