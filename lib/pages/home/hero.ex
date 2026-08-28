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
      data-hero-boundary
    >
      <div class={Shell.stage()}>
        <div class="grid grid-cols-1 items-center gap-10 lg:grid-cols-12 lg:gap-16">
          <div class="flex w-full flex-col justify-center lg:col-span-5" data-hero>
            <h1 id="soonex-headline" class="text-pretty">
              Soonex <span class="text-brand-text">ships 1 September.</span>
            </h1>

            <p class={"#{Shell.lede()} max-w-lg"}>
              A waitlist you can fork. Four themes in config. A journal. A countdown. Controls you
              didn’t have to invent.
            </p>

            <div class="mt-10 flex flex-wrap items-center gap-x-6 gap-y-4">
              <.navigate to="#epistula" class="button ui-brand ui-solid ui-size-md">
                Join waitlist
              </.navigate>
              <.navigate to={Soonex.Public.path("/blog")} class="button ui-ghost ui-size-md">
                Read the log <.heroicon name="hero-arrow-up-right" />
              </.navigate>
            </div>

            <div class="mt-10 flex items-center gap-4">
              <div class="soonex-avatars">
                <.avatar
                  :for={person <- people()}
                  id={person.id}
                  src={Soonex.Public.path(person.src)}
                  alt={person.alt}
                  class="avatar ui-size-sm"
                >
                  <:fallback>{person.initials}</:fallback>
                </.avatar>
              </div>
              <p class="m-0 max-w-xs text-sm/6 text-ink-muted">
                Studios already cloning the repo for a 1 September launch.
              </p>
            </div>
          </div>

          <div class="lg:col-span-7">
            <div class={"#{Shell.frame()} relative min-h-[22rem] sm:min-h-[28rem] lg:min-h-[32rem]"}>
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
      %{
        id: "soonex-hero-avatar-amira",
        src: "/images/people/amira.jpg",
        alt: "Amira N.",
        initials: "AN"
      },
      %{
        id: "soonex-hero-avatar-jonas",
        src: "/images/people/jonas.jpg",
        alt: "Jonas K.",
        initials: "JK"
      },
      %{
        id: "soonex-hero-avatar-leah",
        src: "/images/people/leah.jpg",
        alt: "Leah M.",
        initials: "LM"
      }
    ]
  end
end
