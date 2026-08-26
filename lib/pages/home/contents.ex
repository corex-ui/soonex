defmodule Soonex.HomePage.Contents do
  @moduledoc false

  use Phoenix.Component
  use Corex

  alias Soonex.Layouts.Shell

  def contents(assigns) do
    ~H"""
    <section
      id="index"
      class={"#{Shell.section()} border-y border-border bg-surface"}
      aria-labelledby="soonex-index-heading"
    >
      <div class={"#{Shell.stage()} grid grid-cols-1 gap-size-xl lg:grid-cols-[minmax(0,0.8fr)_minmax(0,1.2fr)]"}>
        <div class="flex flex-col gap-size-md">
          <p class={Shell.eyebrow()}>Index</p>
          <h2 id="soonex-index-heading" class={Shell.section_heading()}>
            Capita <span class="text-brand-text">huius paginae</span>
          </h2>
          <p class={Shell.lede()}>
            Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus.
          </p>
        </div>

        <ol class="m-0 flex list-none flex-col p-0">
          <li :for={{n, href, title, blurb} <- entries()} class="border-t border-border last:border-b">
            <.navigate
              to={href}
              class="link ui-nav flex items-baseline justify-between gap-space-lg py-space-xl text-ink no-underline"
            >
              <span class="flex min-w-0 flex-col gap-space-xs">
                <span class="font-mono text-xs tracking-widest text-brand-text">{n}</span>
                <span class="display text-2xl tracking-tight">{title}</span>
                <span class="text-sm text-ink-muted">{blurb}</span>
              </span>
              <.heroicon name="hero-arrow-down" />
            </.navigate>
          </li>
        </ol>
      </div>
    </section>
    """
  end

  defp entries do
    [
      {"I", "#principia", "Principia", "Lorem ipsum dolor sit amet, consectetur."},
      {"II", "#capita", "Capita", "Sed do eiusmod tempor incididunt ut labore."},
      {"III", "#kalendarium", "Kalendarium", "Ut enim ad minim veniam quis nostrud."},
      {"IV", "#voces", "Voces", "Duis aute irure dolor in reprehenderit."},
      {"V", "#acta", "Acta", "Excepteur sint occaecat cupidatat non proident."},
      {"VI", "#quaestiones", "Quaestiones", "Sunt in culpa qui officia deserunt."},
      {"VII", "#epistula", "Epistula", "Mollit anim id est laborum."}
    ]
  end
end
