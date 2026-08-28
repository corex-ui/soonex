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
        <div class="grid grid-cols-1 items-stretch gap-10 lg:grid-cols-12 lg:gap-8">
          <div class="flex w-full flex-col justify-center lg:col-span-5" data-hero>
            <h1 id="soonex-headline" class="text-pretty">
              Soonex
              <span class="text-brand-text">ships <span class="whitespace-nowrap">1 September</span>.</span>
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
          </div>

          <div class="lg:col-span-7">
            <div class={"#{Shell.frame()} relative min-h-[28rem] lg:min-h-[36rem]"}>
              <.photo
                src="/images/photos/hero.jpg"
                alt="Sunlit studio with long work tables and hanging task lamps"
                width={1600}
                height={1200}
                class="absolute inset-0 size-full"
                loading="eager"
              />
              <div class="relative z-[1] flex min-h-[28rem] flex-col justify-between gap-6 p-4 sm:p-6 lg:min-h-[36rem]">
                <div class="flex flex-1 items-center justify-center">
                  <div class={"#{Shell.panel()} w-full max-w-md p-5 sm:p-6"}>
                    <small class={Shell.eyebrow()}>Waitlist</small>
                    <h2 class="mt-1 text-pretty">
                      Reserve a September seat
                    </h2>
                    <p class="lede mt-2">
                      This demo does not collect addresses. Submit still shows the launch toast.
                    </p>

                    <form
                      id="soonex-hero-waitlist-form"
                      class="mt-5 flex w-full flex-col items-stretch gap-4"
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
                        class="native-input ui-size-md ui-width-full"
                      >
                        <:label class="sr-only">Email</:label>
                      </.native_input>

                      <.radio_group
                        id="soonex-hero-role"
                        name="waitlist[role]"
                        class="radio-group ui-brand ui-width-full"
                        value="founder"
                        items={[
                          %{value: "founder", label: "Founder"},
                          %{value: "engineer", label: "Engineer"},
                          %{value: "designer", label: "Designer"}
                        ]}
                      >
                        <:label><span class="sr-only">I am a</span></:label>
                      </.radio_group>

                      <.switch
                        id="soonex-hero-notes"
                        name="waitlist[notes]"
                        checked
                        class="switch ui-brand"
                      >
                        <:label>Email me launch notes</:label>
                      </.switch>

                      <button type="submit" class="button ui-brand ui-solid ui-size-md w-full">
                        Join waitlist
                      </button>
                    </form>
                  </div>
                </div>

                <div class={"#{Shell.panel()} flex w-full max-w-md items-center gap-4 self-center p-3 sm:px-4 sm:py-3"}>
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
                    Studios already cloning the repo for a
                    <span class="whitespace-nowrap">1 September</span>
                    launch.
                  </p>
                </div>
              </div>
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
