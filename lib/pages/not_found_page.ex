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
      class={"#{Shell.section()} flex min-h-dvh flex-col items-center justify-center bg-root text-center"}
      aria-labelledby="soonex-not-found-heading"
    >
      <div class={Shell.stage()}>
        <div class={"#{Shell.panel()} mx-auto flex max-w-lg flex-col items-center gap-6 px-8 py-16"}>
          <p class={Shell.eyebrow()}>404</p>
          <h1 id="soonex-not-found-heading" class="display m-0 text-4xl font-semibold tracking-tight">
            Non inventus
          </h1>
          <p class="m-0 max-w-sm text-base/7 text-ink-muted">
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Haec via non est.
          </p>
          <div class="mt-4 flex flex-wrap items-center justify-center gap-4">
            <.navigate to={Soonex.Public.path("/")} class="button ui-brand ui-solid ui-size-md">
              Ad initium
            </.navigate>
            <.navigate to={Soonex.Public.path("/blog")} class="button ui-ghost ui-size-md">
              Acta
            </.navigate>
          </div>
        </div>
      </div>
    </section>
    """
  end
end
