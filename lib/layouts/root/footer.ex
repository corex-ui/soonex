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
    <footer class="soonex-footer mt-auto border-t border-border bg-surface py-16 sm:py-24">
      <div class={Shell.stage()}>
        <div class="xl:grid xl:grid-cols-3 xl:gap-8">
          <div class="max-w-md">
            <.lockup />
            <p class="mt-6 text-sm/6 text-ink-muted">
              A Tableau + Corex launch template: waitlist, journal, and four skins you can tell apart.
            </p>
          </div>
          <div class="mt-16 grid grid-cols-2 gap-8 sm:grid-cols-3 xl:col-span-2 xl:mt-0">
            <div>
              <p class="m-0 text-sm/6 font-semibold text-ink">Product</p>
              <ul class="mt-6 flex list-none flex-col gap-4 p-0">
                <li>
                  <.navigate
                    to={Soonex.Public.path("/") <> "#features"}
                    class="link ui-nav ui-size-sm"
                  >
                    Features
                  </.navigate>
                </li>
                <li>
                  <.navigate to={Soonex.Public.path("/") <> "#pricing"} class="link ui-nav ui-size-sm">
                    Plans
                  </.navigate>
                </li>
                <li>
                  <.navigate
                    to={Soonex.Public.path("/") <> "#questions"}
                    class="link ui-nav ui-size-sm"
                  >
                    Questions
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
            <div>
              <p class="m-0 text-sm/6 font-semibold text-ink">Journal</p>
              <ul class="mt-6 flex list-none flex-col gap-4 p-0">
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
              <p class="m-0 text-sm/6 font-semibold text-ink">Elsewhere</p>
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
          <.navigate
            to={Soonex.Public.path("/") <> "#waitlist"}
            class="button ui-brand ui-solid ui-size-sm w-fit"
          >
            Join waitlist
          </.navigate>
        </div>
      </div>
    </footer>
    """
  end
end
