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
    <footer class="mt-auto border-t border-border bg-surface py-16 sm:py-24">
      <div class={Shell.stage()}>
        <div class="xl:grid xl:grid-cols-3 xl:gap-8">
          <div class="max-w-md">
            <p class={Shell.eyebrow()}>Soonex</p>
            <p class="mt-6 text-sm/6 text-ink-muted">
              Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
            </p>
          </div>
          <div class="mt-16 grid grid-cols-2 gap-8 sm:grid-cols-3 xl:col-span-2 xl:mt-0">
            <div>
              <p class="m-0 text-sm/6 font-semibold text-ink">Paginae</p>
              <ul class="mt-6 flex list-none flex-col gap-4 p-0">
                <li>
                  <.navigate
                    to={Soonex.Public.path("/") <> "#principia"}
                    class="link ui-nav ui-size-sm"
                  >
                    Principia
                  </.navigate>
                </li>
                <li>
                  <.navigate to={Soonex.Public.path("/") <> "#officia"} class="link ui-nav ui-size-sm">
                    Officia
                  </.navigate>
                </li>
                <li>
                  <.navigate
                    to={Soonex.Public.path("/") <> "#quaestiones"}
                    class="link ui-nav ui-size-sm"
                  >
                    Quaestiones
                  </.navigate>
                </li>
                <li>
                  <.navigate
                    to={Soonex.Public.path("/") <> "#epistula"}
                    class="link ui-nav ui-size-sm"
                  >
                    Epistula
                  </.navigate>
                </li>
              </ul>
            </div>
            <div>
              <p class="m-0 text-sm/6 font-semibold text-ink">Acta</p>
              <ul class="mt-6 flex list-none flex-col gap-4 p-0">
                <li>
                  <.navigate to={Soonex.Public.path("/blog")} class="link ui-nav ui-size-sm">
                    Omnia acta
                  </.navigate>
                </li>
                <li>
                  <.navigate to={Soonex.Public.path("/tags")} class="link ui-nav ui-size-sm">
                    Notae
                  </.navigate>
                </li>
                <li>
                  <.navigate to={Soonex.Public.path("/feed.xml")} class="link ui-nav ui-size-sm">
                    RSS
                  </.navigate>
                </li>
              </ul>
            </div>
            <div>
              <p class="m-0 text-sm/6 font-semibold text-ink">Alia</p>
              <ul class="mt-6 flex list-none flex-col gap-4 p-0">
                <li>
                  <.navigate to={@github} class="link ui-nav ui-size-sm" external>
                    GitHub
                  </.navigate>
                </li>
                <li>
                  <.navigate to={@hexdocs} class="link ui-nav ui-size-sm" external>
                    Hexdocs
                  </.navigate>
                </li>
              </ul>
            </div>
          </div>
        </div>

        <div class="mt-16 flex flex-col gap-4 border-t border-border pt-8 sm:flex-row sm:items-center sm:justify-between">
          <p class="m-0 text-sm/6 text-ink-muted">
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
