defmodule Soonex.HomePage.Capita do
  @moduledoc false

  use Phoenix.Component
  use Corex

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
      <div class="grid grid-cols-1 gap-px overflow-hidden border border-border bg-border sm:grid-cols-2">
        <article class="flex flex-col bg-root p-8 sm:col-span-2">
          <p class={Shell.eyebrow()}>Overlays</p>
          <h3 class="display mt-2 text-xl font-semibold tracking-tight text-ink sm:text-2xl">
            Host apps overlay Corex — they do not fork it
          </h3>
          <p class="mt-4 text-sm/6 text-ink-muted sm:text-base/7">
            Allowed per theme: seeds, light and dark colors, radius, font roles, and typography.
            Density ladders live in top-level scales. Host overlays cannot set duration or opacity keys.
          </p>
          <.collapsible id="soonex-capita-collapsible" class="collapsible ui-width-full mt-6">
            <:trigger>How the overlay works</:trigger>
            <:closed>
              <.heroicon name="hero-chevron-down" />
            </:closed>
            <:content>
              <p class="m-0 max-w-2xl text-sm/6 text-ink-muted sm:text-base/7">
                Edit <code class="code">config :corex_design</code>
                in config/config.exs, then run <code class="code">mix corex.design.build</code>.
                Contrast tokens stay <code class="code">:contrast</code>
                so the solver keeps ink and links readable. Do not lower contrast targets to “soften”
                a palette — raise seeds or targets if the build fails.
              </p>
            </:content>
          </.collapsible>
        </article>
        <article :for={cell <- cells()} class="flex flex-col bg-surface p-8">
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
        title: "Markdown posts with tags",
        body: "Tableau posts, a card index, and a button pager. RSS is already wired."
      },
      %{
        kicker: "Accessibility",
        title: "Official Corex dialog",
        body: "Text, contrast, motion, cursor, focus, and links — stored in localStorage."
      },
      %{
        kicker: "Assets",
        title: "No package.json",
        body: "Esbuild and Tailwind run from Mix. Corex hooks resolve through NODE_PATH."
      }
    ]
  end
end
