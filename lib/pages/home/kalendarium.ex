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
        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut
        labore et dolore magna aliqua.
      </:lede>
      <div class={"#{Shell.frame()} relative mb-16 min-h-48 overflow-hidden"}>
        <.photo
          src="/images/covers/shipping.jpg"
          alt="A laptop on a wooden desk with a code editor open"
          width={1400}
          height={900}
          class="absolute inset-0 size-full"
        />
      </div>
      <ol class="relative m-0 list-none border-s border-border p-0">
        <li :for={beat <- beats()} class="relative min-h-[70svh] ps-10 pb-24 last:pb-0">
          <span class="absolute -start-[5px] top-6 size-2.5 bg-brand [border-radius:var(--radius-full)]"></span>
          <div class="soonex-sticky-beat border-b border-border bg-surface py-4">
            <p class="m-0 font-mono text-sm tracking-wide text-brand-text">{beat.moment}</p>
            <h3 class="display mt-2 text-xl font-semibold tracking-tight text-ink sm:text-2xl">
              {beat.title}
            </h3>
          </div>
          <div class="mt-6 grid grid-cols-1 items-start gap-8 lg:grid-cols-12 lg:gap-10">
            <div class="flex min-w-0 flex-col gap-4 lg:col-span-7">
              <p :for={para <- beat.paragraphs} class="m-0 text-base/7 text-ink-muted">{para}</p>
              <ul
                :if={beat.points != []}
                class="m-0 flex list-disc flex-col gap-2 ps-5 text-base/7 text-ink-muted"
              >
                <li :for={point <- beat.points}>{point}</li>
              </ul>
              <blockquote :if={beat.quote} class={"#{Shell.panel()} p-6 sm:p-8"}>
                <p class="soonex-quote display m-0 text-balance text-xl font-semibold leading-snug tracking-tight text-ink sm:text-2xl">
                  “{beat.quote.text}”
                </p>
                <footer class="mt-4 text-sm/6 text-ink-muted">{beat.quote.cite}</footer>
              </blockquote>
              <div :if={beat.image} class={"#{Shell.frame()} relative mt-2 min-h-56 overflow-hidden"}>
                <.photo
                  src={beat.image.src}
                  alt={beat.image.alt}
                  width={1400}
                  height={900}
                  class="absolute inset-0 size-full"
                />
              </div>
              <nav
                :if={beat.links != []}
                class="mt-2 flex flex-wrap items-center gap-x-6 gap-y-3"
                aria-label={"Links for #{beat.title}"}
              >
                <.navigate :for={link <- beat.links} to={link.to} class="link ui-brand">
                  {link.label}
                </.navigate>
              </nav>
            </div>
            <aside class="flex min-w-0 flex-col gap-4 lg:col-span-5">
              <div :if={beat.cards != []} class="grid grid-cols-1 gap-4 sm:grid-cols-2 lg:grid-cols-1">
                <article
                  :for={card <- beat.cards}
                  class={"#{Shell.panel()} soonex-card-motion flex flex-col p-5 sm:p-6"}
                >
                  <p class={Shell.eyebrow()}>{card.kicker}</p>
                  <h4 class="display mt-2 text-lg font-semibold tracking-tight text-ink">
                    {card.title}
                  </h4>
                  <p class="mt-2 flex-auto text-sm/6 text-ink-muted">{card.body}</p>
                  <.navigate to={card.to} class="link ui-brand mt-4">{card.link}</.navigate>
                </article>
              </div>
              <.data_list
                :if={beat.facts != []}
                class={"#{Shell.data_list()}"}
                items={Corex.Content.new(beat.facts)}
              />
            </aside>
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
        moment: "12 March 2026",
        title: "Lorem ipsum dolor",
        paragraphs: [
          "Sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.",
          "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident."
        ],
        points: [
          "Lorem checklist item one",
          "Ipsum notes for the studio",
          "Dolor review with the team"
        ],
        image: nil,
        quote: %{
          text: "Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit.",
          cite: "Lorem, founding note"
        },
        cards: [
          %{
            kicker: "Product",
            title: "Sit amet consectetur",
            body: "Adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna.",
            to: product,
            link: "See the product"
          },
          %{
            kicker: "Journal",
            title: "Ut labore et dolore",
            body: "Magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.",
            to: journal,
            link: "Read the journal"
          }
        ],
        links: [
          %{label: "Join waitlist", to: waitlist},
          %{label: "Questions", to: questions}
        ],
        facts: []
      },
      %{
        moment: "8 April 2026",
        title: "Ut enim ad minim",
        paragraphs: [
          "Veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit.",
          "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam."
        ],
        points: ["Aliqua draft", "Minima veniam pass"],
        image: nil,
        quote: %{
          text: "Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit.",
          cite: "Ipsum, April studio"
        },
        cards: [
          %{
            kicker: "Plans",
            title: "Aliqua ut enim",
            body: "Ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip.",
            to: Soonex.Public.path("/") <> "#officia",
            link: "Compare plans"
          },
          %{
            kicker: "Inside",
            title: "Dolor sit amet",
            body: "Consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore.",
            to: Soonex.Public.path("/") <> "#capita",
            link: "Look inside"
          }
        ],
        links: [
          %{label: "See the product", to: product},
          %{label: "Read the journal", to: journal},
          %{label: "Join waitlist", to: waitlist}
        ],
        facts: [
          %{label: "Status", content: "Aliqua draft"},
          %{label: "Owner", content: "Studio pass"},
          %{label: "Next", content: "8 May review"}
        ]
      },
      %{
        moment: "8 May 2026",
        title: "In reprehenderit voluptate",
        paragraphs: [
          "Velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
          "Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos."
        ],
        points: [],
        image: %{
          src: "/images/photos/studio.jpg",
          alt: "A calm studio interior with a low sofa, plants, and a large window"
        },
        quote: nil,
        cards: [
          %{
            kicker: "Studio",
            title: "Velit esse cillum",
            body:
              "Dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident.",
            to: product,
            link: "Open product"
          },
          %{
            kicker: "Questions",
            title: "Sunt in culpa qui",
            body: "Officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis.",
            to: questions,
            link: "Read questions"
          }
        ],
        links: [%{label: "Join waitlist", to: waitlist}],
        facts: []
      },
      %{
        moment: "1 June 2026",
        title: "Sunt in culpa qui",
        paragraphs: [
          "Officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.",
          "Eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo."
        ],
        points: ["Voluptatem first pass", "Architecto second pass"],
        image: nil,
        quote: %{
          text: "Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur.",
          cite: "Dolor, June note"
        },
        cards: [],
        links: [
          %{label: "Compare plans", to: Soonex.Public.path("/") <> "#officia"},
          %{label: "Read the journal", to: journal}
        ],
        facts: [
          %{label: "Pass", content: "Architecto"},
          %{label: "Review", content: "14 July"},
          %{label: "Owner", content: "Agency"}
        ]
      },
      %{
        moment: "14 July 2026",
        title: "Nemo enim ipsam",
        paragraphs: [
          "Voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.",
          "Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit."
        ],
        points: ["Magni dolores", "Ratione sequi"],
        image: nil,
        quote: nil,
        cards: [
          %{
            kicker: "Numbers",
            title: "Magni dolores eos",
            body: "Qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem.",
            to: Soonex.Public.path("/") <> "#numeri",
            link: "See the numbers"
          },
          %{
            kicker: "Voices",
            title: "Ipsum quia dolor",
            body: "Sit amet, consectetur, adipisci velit. Nam libero tempore, cum soluta nobis.",
            to: Soonex.Public.path("/") <> "#voces",
            link: "Hear voices"
          }
        ],
        links: [%{label: "Questions", to: questions}, %{label: "Join waitlist", to: waitlist}],
        facts: [
          %{label: "Theme", content: "Magni"},
          %{label: "Check", content: "Ratione sequi"}
        ]
      },
      %{
        moment: "2 August 2026",
        title: "Neque porro quisquam",
        paragraphs: [
          "Est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit.",
          "Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae."
        ],
        points: [],
        image: %{
          src: "/images/photos/orbit.jpg",
          alt: "Earth from orbit against a dark sky"
        },
        quote: %{
          text:
            "Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus.",
          cite: "Sit, August orbit"
        },
        cards: [],
        links: [
          %{label: "See the product", to: product},
          %{label: "Join waitlist", to: waitlist}
        ],
        facts: []
      },
      %{
        moment: "18 August 2026",
        title: "Temporibus autem quibusdam",
        paragraphs: [
          "Et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae.",
          "Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur."
        ],
        points: ["Debitis check", "Voluptates pass"],
        image: nil,
        quote: nil,
        cards: [
          %{
            kicker: "Journal",
            title: "Debitis aut rerum",
            body: "Necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae.",
            to: journal,
            link: "Open the journal"
          },
          %{
            kicker: "Waitlist",
            title: "Maiores alias",
            body:
              "Consequatur aut perferendis doloribus asperiores repellat. At vero eos et accusamus.",
            to: waitlist,
            link: "Join waitlist"
          }
        ],
        links: [%{label: "See the product", to: product}],
        facts: [
          %{label: "Check", content: "Debitis"},
          %{label: "Pass", content: "Voluptates"},
          %{label: "Launch", content: "1 September"}
        ]
      },
      %{
        moment: "1 September 2026",
        title: "Itaque earum rerum",
        paragraphs: [
          "Hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.",
          "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti."
        ],
        points: ["Launch day", "Public notes"],
        image: nil,
        quote: %{
          text:
            "Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus.",
          cite: "Earum, launch morning"
        },
        cards: [
          %{
            kicker: "Launch",
            title: "Public notes",
            body:
              "Blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas.",
            to: waitlist,
            link: "Join waitlist"
          }
        ],
        links: [
          %{label: "See the product", to: product},
          %{label: "Read the journal", to: journal}
        ],
        facts: [
          %{label: "Day", content: "1 September"},
          %{label: "Status", content: "Public"},
          %{label: "Notes", content: "Live"}
        ]
      }
    ]
  end
end
