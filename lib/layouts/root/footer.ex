defmodule Soonex.Layouts.Root.Footer do
  @moduledoc false

  use Phoenix.Component
  use Corex

  @github "https://github.com/corex-ui/soonex"
  @hexdocs "https://hexdocs.pm/corex"

  attr(:copyright_holder, :string, required: true)

  def site_footer(assigns) do
    assigns =
      assigns
      |> assign(:github, @github)
      |> assign(:hexdocs, @hexdocs)

    ~H"""
    <footer class="px-space py-size-lg">
      <div class="mx-auto flex w-fit max-w-[min(100%,56rem)] flex-col gap-space-xl rounded-4xl border border-border bg-surface px-size py-size shadow-ui sm:px-size-lg sm:py-size-lg">
        <div class="grid gap-x-size-xl gap-y-space-xl sm:grid-cols-2 lg:grid-cols-3">
          <div class="flex flex-col gap-space">
            <p class="m-0 text-sm font-semibold uppercase tracking-[0.18em] text-brand-text">
              Soonex
            </p>
            <p class="m-0 max-w-sm text-sm leading-relaxed text-ink-muted">
              Tableau static site template with Corex components, tokens, and MCP—fork it, ship it, stay free.
            </p>
            <p class="m-0 text-sm text-ink-muted">Open source · MIT</p>
          </div>

          <div class="flex flex-col gap-space-sm">
            <p class="m-0 text-sm font-semibold text-ink">Explore</p>
            <.navigate to={Soonex.Public.path("/") <> "#highlights"} class="link ui-nav ui-size-sm">
              Highlights
            </.navigate>
            <.navigate to={Soonex.Public.path("/") <> "#faq"} class="link ui-nav ui-size-sm">
              FAQ
            </.navigate>
            <.navigate to={Soonex.Public.path("/") <> "#waitlist"} class="link ui-nav ui-size-sm">
              Waitlist
            </.navigate>
            <.navigate to={Soonex.Public.path("/blog")} class="link ui-nav ui-size-sm">
              Blog
            </.navigate>
            <.navigate to={Soonex.Public.path("/tags")} class="link ui-nav ui-size-sm">
              Tags
            </.navigate>
          </div>

          <div class="flex flex-col gap-space-sm">
            <p class="m-0 text-sm font-semibold text-ink">Resources</p>
            <.navigate
              to={Soonex.Public.path("/blog/using-the-soonex-template/")}
              class="link ui-nav ui-size-sm"
            >
              Documentation
            </.navigate>
            <.navigate to={Soonex.Public.path("/feed.xml")} class="link ui-nav ui-size-sm">
              RSS
            </.navigate>
          </div>
        </div>

        <div class="flex flex-col gap-space border-t border-border pt-space-lg sm:flex-row sm:items-center sm:justify-between">
          <div class="flex flex-wrap items-center gap-space-sm">
            <.navigate to={@github} class="button ui-ghost ui-size-sm" external>
              <svg
                aria-hidden="true"
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 102 102"
                stroke-width="1.5"
                stroke="currentColor"
                class="icon"
              >
                <path
                  fill-rule="evenodd"
                  clip-rule="evenodd"
                  d="M48.854 0C21.839 0 0 22 0 49.217c0 21.756 13.993 40.172 33.405 46.69 2.427.49 3.316-1.059 3.316-2.362 0-1.141-.08-5.052-.08-9.127-13.59 2.934-16.42-5.867-16.42-5.867-2.184-5.704-5.42-7.17-5.42-7.17-4.448-3.015.324-3.015.324-3.015 4.934.326 7.523 5.052 7.523 5.052 4.367 7.496 11.404 5.378 14.235 4.074.404-3.178 1.699-5.378 3.074-6.6-10.839-1.141-22.243-5.378-22.243-24.283 0-5.378 1.94-9.778 5.014-13.2-.485-1.222-2.184-6.275.486-13.038 0 0 4.125-1.304 13.426 5.052a46.97 46.97 0 0 1 12.214-1.63c4.125 0 8.33.571 12.213 1.63 9.302-6.356 13.427-5.052 13.427-5.052 2.67 6.763.97 11.816.485 13.038 3.155 3.422 5.015 7.822 5.015 13.2 0 18.905-11.404 23.06-22.324 24.283 1.78 1.548 3.316 4.481 3.316 9.126 0 6.6-.08 11.897-.08 13.526 0 1.304.89 2.853 3.316 2.364 19.412-6.52 33.405-24.935 33.405-46.691C97.707 22 75.788 0 48.854 0z"
                  fill="currentColor"
                />
              </svg>
              GitHub
              <.heroicon name="hero-arrow-top-right-on-square" />
            </.navigate>
            <.navigate to={@hexdocs} class="button ui-ghost ui-size-sm" external>
              <img
                src={Soonex.Public.path("/images/tech/hex.svg")}
                alt=""
                class="icon size-[1.1em] object-contain"
                width="18"
                height="18"
              />
              Hexdocs
              <.heroicon name="hero-arrow-top-right-on-square" />
            </.navigate>
          </div>

          <div class="flex flex-col gap-space sm:flex-row sm:items-center sm:gap-space-lg">
            <p class="m-0 text-sm text-ink-muted">
              © {Date.utc_today().year} {@copyright_holder}
            </p>
            <.navigate
              to={Soonex.Public.path("/") <> "#waitlist"}
              class="button ui-brand ui-solid ui-size-sm w-fit"
            >
              Join the waitlist
            </.navigate>
          </div>
        </div>
      </div>
    </footer>
    """
  end
end
