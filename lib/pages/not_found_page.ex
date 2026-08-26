defmodule Soonex.NotFoundPage do
  @moduledoc false

  use Tableau.Page,
    layout: Soonex.RootLayout,
    permalink: "/404.html",
    title: "Page not found",
    description: "The page you requested is not part of this static site.",
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
      <div class={"#{Shell.paper()} flex max-w-md flex-col gap-space-lg p-size sm:p-size-lg"}>
        <p class={Shell.eyebrow()}>404</p>
        <h1 id="soonex-not-found-heading" class="display m-0 text-4xl tracking-tight">
          Page not found
        </h1>
        <p class="m-0 leading-relaxed text-ink-muted">
          The URL may be mistyped, or the page may have moved. Try the home page.
        </p>
        <.navigate to={Soonex.Public.path("/")} class="button ui-accent ui-solid w-fit self-center">
          Back to home
        </.navigate>
      </div>
    </section>
    """
  end
end
