defmodule Soonex.Layouts.Root.Footer do
  @moduledoc false

  use Phoenix.Component
  use Corex

  attr(:copyright_holder, :string, required: true)

  def site_footer(assigns) do
    ~H"""
    <footer class="layout__footer">
      <div class="layout__footer__content">
        <div class="grid gap-space-xl lg:grid-cols-12 lg:gap-space-lg">
          <div class="flex flex-col gap-space lg:col-span-4">
            <span class="badge badge--accent w-fit">
              Coming soon · Q3 2026
            </span>
            <h2>
              Be there when Soonex ships.
            </h2>
            <p class="text-ink-muted max-w-prose">
              One email at launch. Optional build updates. No spam, no resale, ever.
            </p>
            <.navigate to={Soonex.Public.path("/") <> "#waitlist"} class="button button--accent w-fit">
              Join the waitlist
            </.navigate>
          </div>

          <nav
            class="grid grid-cols-2 gap-space-lg sm:grid-cols-4 lg:col-span-8"
            aria-label="Footer navigation"
          >
            <div class="flex min-w-0 flex-col gap-space-sm">
              <p class="ui-label uppercase tracking-widest text-ink-muted">
                Product
              </p>
              <ul class="m-0 flex list-none flex-col gap-space-sm p-0">
                <li>
                  <.navigate to={Soonex.Public.path("/") <> "#highlights"} class="link link--accent">
                    Highlights
                  </.navigate>
                </li>
                <li>
                  <.navigate to={Soonex.Public.path("/") <> "#scale"} class="link link--accent">
                    Scale
                  </.navigate>
                </li>
                <li>
                  <.navigate to={Soonex.Public.path("/") <> "#pricing"} class="link link--accent">
                    Pricing
                  </.navigate>
                </li>
                <li>
                  <.navigate to={Soonex.Public.path("/") <> "#faq"} class="link link--accent">
                    FAQ
                  </.navigate>
                </li>
                <li>
                  <.navigate to={Soonex.Public.path("/") <> "#waitlist"} class="link link--accent">
                    Waitlist
                  </.navigate>
                </li>
              </ul>
            </div>

            <div class="flex min-w-0 flex-col gap-space-sm">
              <p class="ui-label uppercase tracking-widest text-ink-muted">
                Resources
              </p>
              <ul class="m-0 flex list-none flex-col gap-space-sm p-0">
                <li>
                  <.navigate to={Soonex.Public.path("/tags")} class="link link--accent">
                    Tags
                  </.navigate>
                </li>
                <li>
                  <.navigate to="#" class="link link--accent">
                    GitHub
                  </.navigate>
                </li>
                <li>
                  <.navigate to={Soonex.Public.path("/docs")} class="link link--accent">
                    Documentation
                  </.navigate>
                </li>
                <li>
                  <.navigate to="#" class="link link--accent">
                    Changelog
                  </.navigate>
                </li>
                <li>
                  <.navigate to={Soonex.Public.path("/") <> "#highlights"} class="link link--accent">
                    Templates
                  </.navigate>
                </li>
              </ul>
            </div>

            <div class="flex min-w-0 flex-col gap-space-sm">
              <p class="ui-label uppercase tracking-widest text-ink-muted">
                Company
              </p>
              <ul class="m-0 flex list-none flex-col gap-space-sm p-0">
                <li>
                  <.navigate to="#" class="link link--accent">About</.navigate>
                </li>
                <li>
                  <.navigate to="#" class="link link--accent">
                    Contact
                  </.navigate>
                </li>
                <li>
                  <.navigate to="#" class="link link--accent">Press</.navigate>
                </li>
              </ul>
            </div>

            <div class="flex min-w-0 flex-col gap-space-sm">
              <p class="ui-label uppercase tracking-widest text-ink-muted">
                Legal
              </p>
              <ul class="m-0 flex list-none flex-col gap-space-sm p-0">
                <li>
                  <.navigate to="#" class="link link--accent">Privacy</.navigate>
                </li>
                <li>
                  <.navigate to="#" class="link link--accent">Terms</.navigate>
                </li>
                <li>
                  <.navigate to="#" class="link link--accent">
                    License
                  </.navigate>
                </li>
              </ul>
            </div>
          </nav>
        </div>

        <hr class="my-space-xl border-0 border-t border-border" />

        <div class="flex flex-col gap-space sm:flex-row sm:items-center sm:justify-between">
          <p class="text-ink-muted m-0 text-sm">
            © {Date.utc_today().year} {@copyright_holder} · MIT
          </p>
          <div
            class="flex flex-wrap items-center gap-space"
            aria-label="Social links"
          >
            <.navigate
              to="#"
              class="button button--circle button--ghost"
              aria_label="GitHub"
            >
              <.heroicon name="hero-code-bracket-square" />
            </.navigate>
            <.navigate
              to="#"
              class="button button--circle button--ghost"
              aria_label="X / Twitter"
            >
              <.heroicon name="hero-megaphone" />
            </.navigate>
            <.navigate
              to={Soonex.Public.path("/feed.xml")}
              class="button button--circle button--ghost"
              aria_label="RSS"
            >
              <.heroicon name="hero-rss" />
            </.navigate>
          </div>
        </div>
      </div>
    </footer>
    """
  end
end
