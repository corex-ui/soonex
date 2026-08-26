defmodule Soonex.Layouts.Root.Footer do
  @moduledoc false

  use Phoenix.Component
  use Corex

  alias Soonex.Layouts.Shell

  @github "https://github.com/corex-ui/soonex"
  @hexdocs "https://hexdocs.pm/corex"

  attr(:copyright_holder, :string, required: true)

  def site_footer(assigns) do
    assigns =
      assigns
      |> assign(:github, @github)
      |> assign(:hexdocs, @hexdocs)

    ~H"""
    <footer class="mt-auto border-t border-border bg-surface py-size-md sm:py-size-lg lg:py-size-xl">
      <div class={"#{Shell.stage()} flex flex-col gap-space-xl"}>
        <div class="grid gap-x-size-xl gap-y-space-xl sm:grid-cols-2 lg:grid-cols-4">
          <div class="flex flex-col gap-space lg:col-span-2">
            <p class={Shell.eyebrow()}>Soonex</p>
            <p class="m-0 max-w-md text-sm leading-relaxed text-ink-muted">
              Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
            </p>
          </div>

          <div class="flex flex-col gap-space-sm">
            <p class="m-0 text-sm font-semibold text-ink">Paginae</p>
            <.navigate to={Soonex.Public.path("/") <> "#principia"} class="link ui-nav ui-size-sm">
              Principia
            </.navigate>
            <.navigate to={Soonex.Public.path("/") <> "#quaestiones"} class="link ui-nav ui-size-sm">
              Quaestiones
            </.navigate>
            <.navigate to={Soonex.Public.path("/") <> "#epistula"} class="link ui-nav ui-size-sm">
              Epistula
            </.navigate>
            <.navigate to={Soonex.Public.path("/blog")} class="link ui-nav ui-size-sm">
              Acta
            </.navigate>
            <.navigate to={Soonex.Public.path("/tags")} class="link ui-nav ui-size-sm">
              Notae
            </.navigate>
          </div>

          <div class="flex flex-col gap-space-sm">
            <p class="m-0 text-sm font-semibold text-ink">Alia</p>
            <.navigate to={Soonex.Public.path("/feed.xml")} class="link ui-nav ui-size-sm">
              RSS
            </.navigate>
            <.navigate to={@github} class="link ui-nav ui-size-sm" external>
              GitHub
            </.navigate>
            <.navigate to={@hexdocs} class="link ui-nav ui-size-sm" external>
              Hexdocs
            </.navigate>
          </div>
        </div>

        <div class="flex flex-col gap-space border-t border-border pt-space-lg sm:flex-row sm:items-center sm:justify-between">
          <p class="m-0 text-sm text-ink-muted">
            © {Date.utc_today().year} {@copyright_holder} · Lorem ipsum
          </p>
          <.navigate
            to={Soonex.Public.path("/") <> "#epistula"}
            class="button ui-brand ui-solid ui-size-sm w-fit"
          >
            Scribe nomen
          </.navigate>
        </div>
      </div>
    </footer>
    """
  end
end
