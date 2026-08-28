defmodule Soonex.HomePage.Capita do
  @moduledoc false

  use Phoenix.Component

  import Soonex.Layouts.Media, only: [photo: 1]
  import Soonex.Layouts.Section, only: [block: 1]

  alias Soonex.Layouts.Shell

  def capita(assigns) do
    ~H"""
    <.block
      id="capita"
      labelledby="soonex-capita-heading"
      eyebrow="Inside"
      tone={:surface}
    >
      <:title>
        What you actually <span class="text-brand-text">ship</span>
      </:title>
      <:lede>
        One landing, one journal, four themes, and chrome that already knows the date. The rest is
        copy and stills you own.
      </:lede>
      <div class="grid grid-cols-1 gap-4 lg:grid-cols-12">
        <article class={"#{Shell.frame()} soonex-card-motion relative min-h-80 lg:col-span-8 lg:min-h-[32rem]"}>
          <.photo
            src="/images/photos/studio.jpg"
            alt="A calm studio interior with a low sofa, plants, and a large window"
            width={1400}
            height={1600}
            class="absolute inset-0 size-full"
          />
          <div class="absolute inset-x-0 bottom-0 border-t border-border bg-root p-6 sm:p-8">
            <small class={Shell.eyebrow()}>Template</small>
            <h3 class={Shell.card_title()}>
              Waitlist, journal, and a countdown aimed at 1 September
            </h3>
          </div>
        </article>

        <div class="flex flex-col gap-4 lg:col-span-4">
          <article
            :for={cell <- cells()}
            class={"#{Shell.panel()} soonex-card-motion flex flex-1 flex-col p-6 sm:p-8"}
          >
            <small class={Shell.eyebrow()}>{cell.kicker}</small>
            <h3 class={Shell.card_title()}>{cell.title}</h3>
            <p class="lede mt-3 flex-auto">{cell.body}</p>
          </article>
        </div>
      </div>
    </.block>
    """
  end

  defp cells do
    [
      %{
        kicker: "Journal",
        title: "Markdown posts, covers, tags",
        body:
          "Add a file under the journal route, rebuild, and the cover, date, and title show up. The index paginates on the client."
      },
      %{
        kicker: "Controls",
        title: "Corex, not a custom kit",
        body:
          "Select, accordion, tabs, and the waitlist fields are upstream Corex. Host CSS only retunes layout tokens."
      }
    ]
  end
end
