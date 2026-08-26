defmodule Soonex.NotFoundPage do
  @moduledoc false

  use Tableau.Page,
    layout: Soonex.RootLayout,
    permalink: "/404.html",
    title: "Non inventus",
    description: "Lorem ipsum dolor sit amet — haec pagina non invenitur.",
    page_kind: :not_found,
    sitemap: %{priority: 0.2, changefreq: "yearly"}

  use Phoenix.Component
  use Corex

  alias Soonex.Layouts.Shell

  def template(assigns) do
    ~H"""
    <section
      class="flex min-h-dvh flex-col items-center justify-center gap-space-lg px-space-md py-size-xl text-center"
      aria-labelledby="soonex-not-found-heading"
    >
      <div class={"#{Shell.panel()} flex max-w-md flex-col gap-space-lg p-size sm:p-size-lg"}>
        <p class={Shell.eyebrow()}>404</p>
        <h1 id="soonex-not-found-heading" class="display m-0 text-4xl tracking-tight">
          Non inventus
        </h1>
        <p class="m-0 leading-relaxed text-ink-muted">
          Lorem ipsum dolor sit amet, consectetur adipiscing elit. Haec via non est.
        </p>
        <.navigate to={Soonex.Public.path("/")} class="button ui-accent ui-solid w-fit self-center">
          Ad initium
        </.navigate>
      </div>
    </section>
    """
  end
end
