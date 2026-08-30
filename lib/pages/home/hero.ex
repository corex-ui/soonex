defmodule Soonex.HomePage.Hero do
  @moduledoc false

  use Phoenix.Component
  use Corex

  import Soonex.Layouts.Media, only: [photo: 1]

  alias Soonex.Layouts.Shell

  def hero(assigns) do
    ~H"""
    <header class={Shell.section_hero()} aria-labelledby="soonex-headline" data-hero-boundary>
      <div class="absolute inset-0">
        <.photo
          src="/images/photos/hero.jpg"
          alt="Sunlit studio with long work tables and hanging task lamps"
          width={1600}
          height={1200}
          class="absolute inset-0 size-full"
          loading="eager"
        />
        <div class="soonex-hero-wash absolute inset-0"></div>
      </div>

      <div class={"#{Shell.stage()} relative z-[1] w-full py-16 sm:py-24"}>
        <div class="grid grid-cols-1 items-end gap-12 lg:grid-cols-12 lg:items-center lg:gap-10">
          <div class="flex w-full flex-col justify-center lg:col-span-6" data-hero>
            <h1 id="soonex-headline" class="text-pretty">
              Soonex
              <span class="text-brand-text">
                ships <span class="whitespace-nowrap">1 September</span>.
              </span>
            </h1>

            <p class={"#{Shell.lede()} max-w-lg"}>
              Reserve a seat for launch day. Waitlist, shipping log, countdown, and four looks —
              ready when the date hits.
            </p>

            <div class="mt-10 flex flex-wrap items-center gap-x-6 gap-y-4">
              <.navigate to="#waitlist" class="button ui-brand ui-solid ui-size-md">
                Join waitlist
              </.navigate>
              <.navigate to={Soonex.Public.path("/blog")} class="button ui-ghost ui-size-md">
                Read the log <.heroicon name="hero-arrow-up-right" />
              </.navigate>
            </div>
          </div>

          <div class="lg:col-span-6">
            <div class="soonex-waitlist-object w-full max-w-md lg:ml-auto">
              <p class="soonex-card-title m-0">Reserve a September seat</p>
              <p class="lede mt-2 text-sm/6">
                Tell us who you are. We write when the countdown ends.
              </p>

              <form
                id="soonex-hero-waitlist-form"
                class="mt-5 flex w-full flex-col gap-4"
                data-waitlist-toast-title="You're on the list"
                data-waitlist-toast-description="We'll email you before 1 September."
              >
                <div class="soonex-waitlist-join flex w-full flex-col gap-3 sm:flex-row sm:items-end">
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

                  <button type="submit" class="button ui-brand ui-solid ui-size-md sm:w-auto">
                    Join waitlist
                  </button>
                </div>

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
              </form>

              <div class="mt-5 flex items-center gap-3 border-t border-border pt-5">
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
                  240 studios already on the list for <span class="whitespace-nowrap">1 September</span>.
                </p>
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
