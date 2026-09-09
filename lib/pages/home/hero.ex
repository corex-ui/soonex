defmodule Soonex.HomePage.Hero do
  @moduledoc false

  use Phoenix.Component
  use Corex

  import Soonex.Layouts.Media, only: [photo: 1]

  alias Soonex.Layouts.Shell

  def hero(assigns) do
    ~H"""
    <header
      class={"#{Shell.section_hero()} bg-root"}
      aria-labelledby="soonex-headline"
      data-section="hero"
      data-hero-boundary
    >
      <div class={Shell.stage()}>
        <div class="soonex-hero-grid">
          <div class="soonex-hero-copy" data-hero-copy data-hero>
            <p class="soonex-launch-badge">
              <span class="badge ui-brand ui-size-sm">Launching {Soonex.Launch.year_label()}</span>
            </p>

            <h1
              id="soonex-headline"
              class="soonex-hero-heading display mt-6 text-pretty text-5xl font-semibold tracking-tight text-ink sm:text-6xl lg:text-7xl"
            >
              A launch page you can <span class="soonex-accent">actually ship.</span>
            </h1>

            <p class={"#{Shell.lede()} soonex-hero-lede"}>
              Soonex is a Tableau + Corex template: waitlist, journal, countdown chrome, and four
              skins that do not look like recolors. Fork it, replace the copy, and go live.
            </p>

            <div class="soonex-hero-actions mt-10 flex flex-wrap items-center gap-x-6 gap-y-4">
              <.navigate to="#waitlist" class="button ui-brand ui-solid ui-size-lg">
                Join waitlist
              </.navigate>
              <.navigate to={Soonex.Public.path("/blog")} class="button ui-ghost ui-size-lg">
                Read the journal <.heroicon name="hero-arrow-up-right" />
              </.navigate>
            </div>

            <form
              id="soonex-hero-waitlist-form"
              class="soonex-hero-form mt-8 flex w-full max-w-md flex-col gap-3 sm:flex-row sm:items-end"
              data-hero-form
              data-waitlist-toast-title="You're on the list"
              data-waitlist-toast-description="This demo form does not collect addresses. The live template wires the same toast."
            >
              <.native_input
                type="email"
                name="waitlist[email]"
                id="soonex-hero-waitlist-email"
                required
                autocomplete="email"
                placeholder="you@studio.dev"
                class="native-input ui-size-md ui-width-full min-w-0 flex-1"
              >
                <:label class="sr-only">Email</:label>
              </.native_input>
              <button type="submit" class="button ui-brand ui-solid ui-size-md shrink-0">
                Join
              </button>
            </form>

            <div class="soonex-hero-proof mt-8 flex items-center gap-4">
              <ul class="soonex-avatars m-0 list-none p-0">
                <li :for={person <- people()}>
                  <.photo
                    src={person.src}
                    alt={person.alt}
                    width={72}
                    height={72}
                    class="soonex-avatar"
                    loading="eager"
                  />
                </li>
              </ul>
              <p class="m-0 max-w-xs text-sm/6 text-ink-muted">
                Built for founders who want a finished waitlist, not another component demo.
              </p>
            </div>
          </div>

          <div class="soonex-hero-visual" data-hero-visual>
            <div class={"#{Shell.frame()} soonex-hero-frame relative min-h-[22rem] lg:min-h-[32rem]"}>
              <.photo
                src="/images/photos/hero.jpg"
                alt="Sunlit studio with long work tables and hanging task lamps"
                width={1600}
                height={1200}
                class="absolute inset-0 size-full"
                loading="eager"
              />
            </div>
          </div>
        </div>
      </div>
    </header>

    <div data-hero-sentinel aria-hidden="true" class="pointer-events-none h-px w-full shrink-0"></div>
    """
  end

  defp people do
    [
      %{src: "/images/people/amira.jpg", alt: "Amira N."},
      %{src: "/images/people/jonas.jpg", alt: "Jonas K."},
      %{src: "/images/people/leah.jpg", alt: "Leah M."}
    ]
  end
end
