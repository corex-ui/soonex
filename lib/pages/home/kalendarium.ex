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
      layout={:sticky}
    >
      <:title>
        Road to <span class="text-brand-text">1 September</span>
      </:title>
      <:lede>
        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut
        labore et dolore magna aliqua.
      </:lede>
      <div class={"#{Shell.frame()} relative mb-10 min-h-48 overflow-hidden"}>
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
          <span class="absolute -start-[5px] top-1.5 size-2.5 bg-brand [border-radius:var(--radius-full)]"></span>
          <p class="m-0 font-mono text-sm tracking-wide text-brand-text">{beat.moment}</p>
          <h3 class="display mt-2 text-xl font-semibold tracking-tight text-ink">{beat.title}</h3>
          <p class="mt-3 max-w-2xl text-base/7 text-ink-muted">{beat.body}</p>
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
        body:
          "Sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
      },
      %{
        moment: "8 April 2026",
        title: "Ut enim ad minim",
        body:
          "Veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor."
      },
      %{
        moment: "8 May 2026",
        title: "In reprehenderit voluptate",
        body:
          "Velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident."
      },
      %{
        moment: "1 June 2026",
        title: "Sunt in culpa qui",
        body:
          "Officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem."
      },
      %{
        moment: "14 July 2026",
        title: "Nemo enim ipsam",
        body:
          "Voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos."
      },
      %{
        moment: "2 August 2026",
        title: "Neque porro quisquam",
        body:
          "Est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit. Nam libero tempore, cum soluta nobis."
      },
      %{
        moment: "18 August 2026",
        title: "Temporibus autem quibusdam",
        body:
          "Et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae."
      },
      %{
        moment: "1 September 2026",
        title: "Itaque earum rerum",
        body:
          "Hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus."
      }
    ]
  end
end
