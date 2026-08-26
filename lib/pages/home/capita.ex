defmodule Soonex.HomePage.Capita do
  @moduledoc false

  use Phoenix.Component
  use Corex

  import Soonex.Layouts.Media, only: [photo: 1]
  import Soonex.Layouts.Section, only: [block: 1]

  alias Soonex.Layouts.Shell

  def capita(assigns) do
    ~H"""
    <.block
      id="capita"
      labelledby="soonex-capita-heading"
      eyebrow="Inside the template"
      tone={:surface}
    >
      <:title>
        What ships <span class="text-brand-text">on day one</span>
      </:title>
      <:lede>
        A waitlist, a journal, and chrome you can delete. Long copy stays behind a collapsible.
      </:lede>
      <div class="grid grid-cols-1 gap-4 sm:grid-cols-2 lg:grid-cols-6">
        <article class={"#{Shell.frame()} relative min-h-80 sm:col-span-2 lg:col-span-4 lg:min-h-[28rem]"}>
          <.photo
            src="/images/photos/studio.jpg"
            alt="A calm studio interior with a low sofa, plants, and a large window"
            width={1400}
            height={1600}
            class="absolute inset-0 size-full"
          />
          <div class="absolute inset-x-0 bottom-0 border-t border-border bg-root p-6 sm:p-8">
            <p class={Shell.eyebrow()}>Overlays</p>
            <h3 class="display mt-2 text-xl font-semibold tracking-tight text-ink sm:text-2xl">
              Host apps overlay Corex — they do not fork it
            </h3>
          </div>
        </article>

        <article class={"#{Shell.panel()} flex flex-col p-6 sm:p-8 lg:col-span-2"}>
          <p class={Shell.eyebrow()}>How it works</p>
          <.collapsible id="soonex-capita-collapsible" class="collapsible ui-width-full mt-4">
            <:trigger>Open the overlay notes</:trigger>
            <:closed>
              <.heroicon name="hero-chevron-down" />
            </:closed>
            <:content>
              <p class="m-0 text-sm/6 text-ink-muted sm:text-base/7">
                Edit <code class="code">config :corex_design</code>
                in config/config.exs, then run <code class="code">mix corex.design.build</code>.
                Contrast tokens stay <code class="code">:contrast</code>
                so the solver keeps ink and links readable. Do not lower contrast targets to “soften”
                a palette — raise seeds or targets if the build fails.
              </p>
            </:content>
          </.collapsible>
        </article>

        <article
          :for={cell <- cells()}
          class={"#{Shell.panel()} flex flex-col p-6 sm:p-8 lg:col-span-2"}
        >
          <p class={Shell.eyebrow()}>{cell.kicker}</p>
          <h3 class="display mt-2 text-xl font-semibold tracking-tight text-ink">{cell.title}</h3>
          <p class="mt-3 flex-auto text-sm/6 text-ink-muted">{cell.body}</p>
        </article>
      </div>
    </.block>
    """
  end

  defp cells do
    [
      %{
        kicker: "Waitlist",
        title: "Email, role, and launch notes",
        body:
          "The hero card is the conversion object. The later band adds interests and team size."
      },
      %{
        kicker: "Journal",
        title: "Markdown posts with covers",
        body: "Tableau posts, a card index with photography, and a button pager. RSS is wired."
      },
      %{
        kicker: "Accessibility",
        title: "Official Corex dialog",
        body: "Text, contrast, motion, cursor, focus, and links — stored in localStorage."
      }
    ]
  end
end
