defmodule Soonex.HomePage.Principia do
  @moduledoc false

  use Phoenix.Component
  use Corex

  alias Soonex.Layouts.Shell

  def principia(assigns) do
    ~H"""
    <section
      id="principia"
      class={"#{Shell.section()} bg-root"}
      aria-labelledby="soonex-principia-heading"
    >
      <div class={"#{Shell.stage()} #{Shell.stack()}"}>
        <div class="flex max-w-2xl flex-col gap-size-md">
          <p class={Shell.eyebrow()}>Principia</p>
          <h2 id="soonex-principia-heading" class={Shell.section_heading()}>
            Tria <span class="text-brand-text">fundamenta</span>
          </h2>
          <p class={Shell.lede()}>
            Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur.
          </p>
        </div>

        <div class="grid grid-cols-1 gap-space-lg lg:grid-cols-3">
          <article
            :for={{num, title, body} <- pillars()}
            class={"#{Shell.panel()} flex flex-col gap-space-lg p-size"}
          >
            <p class="display m-0 text-5xl tracking-tighter text-brand-text">{num}</p>
            <h3 class="display m-0 text-2xl tracking-tight">{title}</h3>
            <p class="m-0 leading-relaxed text-ink-muted">{body}</p>
          </article>
        </div>
      </div>
    </section>
    """
  end

  defp pillars do
    [
      {"I", "Lorem",
       "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."},
      {"II", "Ipsum",
       "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."},
      {"III", "Dolor",
       "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur."}
    ]
  end
end
