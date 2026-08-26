defmodule Soonex.HomePage.Kalendarium do
  @moduledoc false

  use Phoenix.Component
  use Corex

  alias Soonex.Layouts.Shell

  def kalendarium(assigns) do
    ~H"""
    <section
      id="kalendarium"
      class={"#{Shell.section()} bg-root"}
      aria-labelledby="soonex-kalendarium-heading"
    >
      <div class={"#{Shell.stage()} #{Shell.stack()}"}>
        <div class="flex max-w-2xl flex-col gap-size-md">
          <p class={Shell.eyebrow()}>Kalendarium</p>
          <h2 id="soonex-kalendarium-heading" class={Shell.section_heading()}>
            Tempora <span class="text-brand-text">ventura</span>
          </h2>
          <p class={Shell.lede()}>
            Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias.
          </p>
        </div>

        <ol class="m-0 grid list-none grid-cols-1 gap-0 p-0 md:grid-cols-2 xl:grid-cols-4">
          <li
            :for={{moment, title, body} <- beats()}
            class={"#{Shell.panel()} flex flex-col gap-space p-size md:-ml-px md:first:ml-0"}
          >
            <p class="font-mono text-sm tracking-wide text-brand-text">{moment}</p>
            <h3 class="display m-0 text-xl tracking-tight">{title}</h3>
            <p class="m-0 text-sm leading-relaxed text-ink-muted">{body}</p>
          </li>
        </ol>
      </div>
    </section>
    """
  end

  defp beats do
    [
      {"Kal. Ian.", "Initium", "Lorem ipsum dolor sit amet, consectetur adipiscing elit."},
      {"Id. Mart.", "Medius cursus", "Sed do eiusmod tempor incididunt ut labore et dolore."},
      {"Non. Iun.", "Proelium", "Ut enim ad minim veniam, quis nostrud exercitation."},
      {"Prid. Sept.", "Finis", "Duis aute irure dolor in reprehenderit in voluptate velit."}
    ]
  end
end
