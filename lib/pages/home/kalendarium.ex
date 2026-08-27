defmodule Soonex.HomePage.Kalendarium do
  @moduledoc false

  use Phoenix.Component

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
          <div class="lg:sticky lg:top-28 z-[1] border-b border-border bg-surface py-4">
            <p class="m-0 font-mono text-sm tracking-wide text-brand-text">{beat.moment}</p>
            <h3 class="display mt-2 text-xl font-semibold tracking-tight text-ink sm:text-2xl">
              {beat.title}
            </h3>
          </div>
          <div class="mt-6 flex max-w-2xl flex-col gap-4">
            <p :for={para <- beat.paragraphs} class="m-0 text-base/7 text-ink-muted">{para}</p>
            <ul
              :if={beat.points != []}
              class="m-0 flex list-disc flex-col gap-2 ps-5 text-base/7 text-ink-muted"
            >
              <li :for={point <- beat.points}>{point}</li>
            </ul>
            <div :if={beat.image} class={"#{Shell.frame()} relative mt-2 min-h-48 overflow-hidden"}>
              <.photo
                src={beat.image.src}
                alt={beat.image.alt}
                width={1400}
                height={900}
                class="absolute inset-0 size-full"
              />
            </div>
          </div>
        </li>
      </ol>
    </.block>
    """
  end

  defp beats do
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
        image: nil
      },
      %{
        moment: "8 April 2026",
        title: "Ut enim ad minim",
        paragraphs: [
          "Veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit.",
          "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam."
        ],
        points: ["Aliqua draft", "Minima veniam pass"],
        image: nil
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
        }
      },
      %{
        moment: "1 June 2026",
        title: "Sunt in culpa qui",
        paragraphs: [
          "Officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.",
          "Eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo."
        ],
        points: ["Voluptatem first pass", "Architecto second pass"],
        image: nil
      },
      %{
        moment: "14 July 2026",
        title: "Nemo enim ipsam",
        paragraphs: [
          "Voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.",
          "Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit."
        ],
        points: ["Magni dolores", "Ratione sequi"],
        image: nil
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
        }
      },
      %{
        moment: "18 August 2026",
        title: "Temporibus autem quibusdam",
        paragraphs: [
          "Et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae.",
          "Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur."
        ],
        points: ["Debitis check", "Voluptates pass"],
        image: nil
      },
      %{
        moment: "1 September 2026",
        title: "Itaque earum rerum",
        paragraphs: [
          "Hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.",
          "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti."
        ],
        points: ["Launch day", "Public notes"],
        image: nil
      }
    ]
  end
end
