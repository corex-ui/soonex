defmodule Soonex.HomePage.Kalendarium do
  @moduledoc false

  use Phoenix.Component
  use Corex

  import Soonex.Layouts.Media, only: [photo: 1]
  import Soonex.Layouts.Section, only: [block: 1]

  alias Soonex.Layouts.Shell

  def kalendarium(assigns) do
    ~H"""
    <.block
      id="kalendarium"
      labelledby="soonex-kalendarium-heading"
      eyebrow="Calendar"
      tone={:surface}
    >
      <:title>
        Road to <span class="text-brand-text">1 September</span>
      </:title>
      <:lede>
        Sticky beats, not a wall of cards. Open a note when you need the extra pass.
      </:lede>
      <div class={"#{Shell.frame()} relative mb-12 min-h-48 overflow-hidden"}>
        <.photo
          src="/images/covers/shipping.jpg"
          alt="A laptop on a wooden desk with a code editor open"
          width={1400}
          height={900}
          class="absolute inset-0 size-full"
        />
      </div>
      <ol class="relative m-0 list-none border-s border-border p-0">
        <li :for={beat <- beats()} class="relative ps-10 pb-12 last:pb-0">
          <span class="absolute -start-[5px] top-6 size-2.5 bg-brand [border-radius:var(--radius-full)]"></span>
          <div class="soonex-sticky-beat border-b border-border bg-surface py-4">
            <p class="m-0 font-mono text-sm tracking-wide text-brand-text">{beat.moment}</p>
            <h3 class="display mt-2 text-xl font-semibold tracking-tight text-ink sm:text-2xl">
              {beat.title}
            </h3>
          </div>
          <div class="mt-6 flex min-w-0 flex-col gap-4">
            <p class="m-0 text-base/7 text-ink-muted">{beat.lede}</p>
            <div :if={beat.facts != []} class={"#{Shell.chip_row()} mt-1"}>
              <span :for={fact <- beat.facts} class="badge ui-accent ui-ghost ui-size-sm">
                {fact.label}: {fact.content}
              </span>
            </div>
            <.collapsible
              id={beat.note_id}
              class="collapsible ui-brand ui-size-sm ui-width-full"
            >
              <:trigger>Notes from this pass</:trigger>
              <:closed>
                <.heroicon name="hero-chevron-right" />
              </:closed>
              <:content>
                <p :for={para <- beat.notes} class="m-0 text-sm/6 text-ink-muted">{para}</p>
                <nav
                  :if={beat.links != []}
                  class="mt-4 flex flex-wrap items-center gap-x-6 gap-y-3"
                  aria-label={"Links for #{beat.title}"}
                >
                  <.navigate :for={link <- beat.links} to={link.to} class="link ui-brand">
                    {link.label}
                  </.navigate>
                </nav>
              </:content>
            </.collapsible>
          </div>
        </li>
      </ol>
    </.block>
    """
  end

  defp beats do
    product = Soonex.Public.path("/") <> "#principia"
    waitlist = Soonex.Public.path("/") <> "#epistula"
    journal = Soonex.Public.path("/blog")
    questions = Soonex.Public.path("/") <> "#quaestiones"

    [
      %{
        note_id: "soonex-kal-fork",
        moment: "12 March 2026",
        title: "Fork Tableau, keep Corex upstream",
        lede:
          "Soonex starts as a static Tableau site. Mix, Tailwind, and esbuild are already in the project. The waitlist and countdown land first so the page has a date.",
        facts: [
          %{label: "Stack", content: "Tableau plus Corex"},
          %{label: "npm", content: "None"},
          %{label: "Target", content: "1 September"}
        ],
        notes: [
          "Host CSS only retunes layout. Theme overlays may set seeds, colors, radius, fonts, and typography — not scale, duration, or opacity.",
          "The clone strip on Product is the same git URL you run locally after mix setup."
        ],
        links: [
          %{label: "See the product", to: product},
          %{label: "Join waitlist", to: waitlist}
        ]
      },
      %{
        note_id: "soonex-kal-journal",
        moment: "8 May 2026",
        title: "Journal, tags, and covers",
        lede:
          "Posts are Markdown. Add a file, rebuild, and the cover, date, and title show up. Tags stay optional. The index pager slices cards in the browser.",
        facts: [
          %{label: "Posts", content: "Six shipping-log entries"},
          %{label: "Pager", content: "Corex client events"},
          %{label: "LiveView", content: "Not used"}
        ],
        notes: [
          "The home journal band is a short reading list. The index paginates the rest without a full-page reload.",
          "Keep permalinks stable when you rewrite titles so existing links still resolve."
        ],
        links: [
          %{label: "Read the journal", to: journal},
          %{label: "Questions", to: questions}
        ]
      },
      %{
        note_id: "soonex-kal-themes",
        moment: "14 July 2026",
        title: "Four themes that feel like four products",
        lede:
          "neo, uno, duo, and leo push paper, ink, brand, and radius apart. Template Options switches them on this device. Controls share one height and pick up a Soonex corner language.",
        facts: [
          %{label: "Themes", content: "neo, uno, duo, leo"},
          %{label: "CSS fork", content: "None"},
          %{label: "Tokens", content: "--ctl-radius, --ctl-size"}
        ],
        notes: [
          "Triggers and fields host --ctl-radius, --ctl-space, --ctl-size, and --ctl-text. There is no ui-input utility in Corex.",
          "Reduced motion lives in Accessibility. Scroll reveal and card lift stop under data-motion=reduce."
        ],
        links: [
          %{label: "See the product", to: product},
          %{label: "Compare plans", to: Soonex.Public.path("/") <> "#officia"}
        ]
      },
      %{
        note_id: "soonex-kal-a11y",
        moment: "18 August 2026",
        title: "Accessibility pass before launch",
        lede:
          "The person-in-circle control opens zoom, contrast, motion, cursor, focus, and link underline for this device. Choices persist in local storage.",
        facts: [
          %{label: "Dialog", content: "Corex accessibility"},
          %{label: "Persist", content: "localStorage"},
          %{label: "Reset", content: "Returns defaults"}
        ],
        notes: [
          "The condensed header and progress bar stay as chrome when motion is reduced.",
          "axe on the home document is the test gate before Pages deploy."
        ],
        links: [
          %{label: "Questions", to: questions},
          %{label: "Join waitlist", to: waitlist}
        ]
      },
      %{
        note_id: "soonex-kal-launch",
        moment: "1 September 2026",
        title: "Public notes, public template",
        lede:
          "Launch day is the countdown target in this demo. Change the date in the home template when you have a real one. Days, hours, minutes, and seconds stay on one row.",
        facts: [
          %{label: "Day", content: "1 September"},
          %{label: "Status", content: "Public"},
          %{label: "Notes", content: "Journal"}
        ],
        notes: [
          "Wire the waitlist fields to your list later — email, role, interests, team size, and launch notes are already named.",
          "Keep CI green before Pages deploys so a broken push never reaches the public CDN."
        ],
        links: [
          %{label: "Join waitlist", to: waitlist},
          %{label: "Read the journal", to: journal}
        ]
      }
    ]
  end
end
