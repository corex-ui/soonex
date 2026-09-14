defmodule Soonex.Layouts.Root.Footer do
  @moduledoc false

  use Phoenix.Component
  use Corex

  import Soonex.CookieConsent, only: [cookie_dialog: 1]
  import Soonex.Layouts.Brand, only: [lockup: 1]

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
    <footer class="soonex-footer mt-auto border-t border-border bg-root py-16 sm:py-20">
      <div class={Shell.stage()}>
        <div class="grid grid-cols-1 gap-12 lg:grid-cols-12 lg:gap-16">
          <div class="lg:col-span-4">
            <.lockup />
            <p class="mt-4 text-sm/6 text-ink-muted">
              Tableau + Corex coming-soon template.
            </p>
            <p class="mt-1 text-sm/6 text-ink-muted">Accessible Phoenix UI</p>
          </div>
          <div class="grid grid-cols-2 gap-8 sm:grid-cols-3 lg:col-span-8">
            <div>
              <p class="m-0 text-sm/6 font-medium text-ink">Product</p>
              <ul class="mt-4 flex list-none flex-col gap-3 p-0">
                <li>
                  <.navigate
                    to={Soonex.Public.path("/") <> "#capabilities"}
                    class="link ui-nav ui-size-sm"
                  >
                    Capabilities
                  </.navigate>
                </li>
                <li>
                  <.navigate
                    to={Soonex.Public.path("/") <> "#spotlight"}
                    class="link ui-nav ui-size-sm"
                  >
                    How it works
                  </.navigate>
                </li>
                <li>
                  <.navigate to={Soonex.Public.path("/") <> "#scale"} class="link ui-nav ui-size-sm">
                    Scale
                  </.navigate>
                </li>
              </ul>
            </div>
            <div>
              <p class="m-0 text-sm/6 font-medium text-ink">Journal</p>
              <ul class="mt-4 flex list-none flex-col gap-3 p-0">
                <li>
                  <.navigate to={Soonex.Public.path("/blog")} class="link ui-nav ui-size-sm">
                    All posts
                  </.navigate>
                </li>
                <li>
                  <.navigate to={Soonex.Public.path("/tags")} class="link ui-nav ui-size-sm">
                    Tags
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
              <p class="m-0 text-sm/6 font-medium text-ink">Elsewhere</p>
              <ul class="mt-4 flex list-none flex-col gap-3 p-0">
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
                <li>
                  <.navigate
                    to={Soonex.Public.path("/") <> "#waitlist"}
                    class="link ui-nav ui-size-sm"
                  >
                    Waitlist
                  </.navigate>
                </li>
              </ul>
            </div>
          </div>
        </div>

        <div class="mt-16 flex flex-col gap-4 border-t border-border pt-8 sm:flex-row sm:items-center sm:justify-between">
          <div class="flex flex-col gap-2">
            <p class="m-0 text-sm/6 text-ink-muted">
              © {Date.utc_today().year} {@copyright_holder}
            </p>
            <p class="m-0 text-xs/6 text-ink-muted">{Soonex.Layouts.Media.credits()}</p>
            <div class="flex flex-wrap items-center gap-x-4 gap-y-2">
              <.navigate
                to={Soonex.Public.path("/privacy/")}
                class="link ui-nav ui-size-sm text-ink-muted"
              >
                Privacy
              </.navigate>
              <.cookie_dialog />
            </div>
          </div>
          <.navigate to="#main-content" class="link ui-nav ui-size-sm text-ink-muted">
            Back to top ↑
          </.navigate>
        </div>
      </div>
    </footer>
    """
  end
end
