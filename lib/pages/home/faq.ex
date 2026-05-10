defmodule Soonex.HomePage.Faq do
  @moduledoc false

  use Phoenix.Component
  use Corex

  def faq(assigns) do
    ~H"""
    <section
      id="faq"
      class="relative flex min-h-dvh flex-col justify-start border-y border-border px-space py-size-xl"
      aria-labelledby="soonex-faq-heading"
      data-reveal
    >
      <div class="mx-auto flex w-full max-w-6xl flex-col gap-size">
        <div class="layout__section-intro">
          <h2 id="soonex-faq-heading" class="text-ink-brand">FAQ</h2>
          <p>
            How static Tableau, Corex MCP, Markdown posts, and the asset side of this repo fit together, and how it relates to a future Phoenix Soonex application template.
          </p>
        </div>

        <div class="min-w-0 w-full">
          <.accordion
            id="soonex-faq"
            class="accordion accordion--accent accordion--sm sm:accordion--md lg:accordion--xl w-full max-w-6xl"
            multiple={false}
            value="stack"
            items={
              Corex.Content.new([
                %{
                  value: "stack",
                  trigger: "What is Soonex?",
                  content:
                    "A Tableau-driven coming-soon site that demonstrates Corex on static HTML: countdown, highlights, metrics, pricing, FAQ, waitlist, Markdown journal post, and footer. Tableau emits files you can host on GitHub Pages, S3, or any CDN.",
                  meta: %{icon: "hero-squares-2x2"}
                },
                %{
                  value: "tableau",
                  trigger: "How do builds and previews work?",
                  content:
                    "The asset alias refreshes palette JSON, Designex, Tailwind, and esbuild. Tableau writes _site for production. The dev server watches HEEx and Markdown while you work. Journal posts live under _posts and render through MDEx.",
                  meta: %{icon: "hero-globe-alt"}
                },
                %{
                  value: "liveview",
                  trigger: "What about Corex MCP?",
                  content:
                    "In development, Corex can expose MCP tools backed by the component registry, list_components, get_component, so assistants pull slots and modifiers instead of inventing markup.",
                  meta: %{icon: "hero-bolt"}
                },
                %{
                  value: "themes",
                  trigger: "Themes and modes?",
                  content:
                    "data-theme and data-mode switch Neo, Uno, Duo, and Leo; theme and mode scripts in the layout sync controls and localStorage.",
                  meta: %{icon: "hero-swatch"}
                },
                %{
                  value: "next",
                  trigger: "What comes after this static template?",
                  content:
                    "A fuller Phoenix Soonex application template is planned on top of the same Corex primitives, auth, data, and realtime, without throwing away this landing. Stay on the waitlist for migration notes.",
                  meta: %{icon: "hero-rocket-launch"}
                }
              ])
            }
          >
            <:trigger :let={item}>
              <span class="flex min-w-0 items-center gap-space">
                <.heroicon name={item.meta.icon} />
                <span class="min-w-0 text-start">{item.trigger}</span>
              </span>
            </:trigger>
            <:content :let={item}>
              <p>{item.content}</p>
            </:content>
            <:indicator>
              <.heroicon name="hero-chevron-right" />
            </:indicator>
          </.accordion>
        </div>

        <p class="m-0 text-center text-sm">
          Still deciding? <.navigate to="#waitlist" class="link link--brand">Join the waitlist</.navigate>. We ship quietly and read every reply.
        </p>
      </div>
    </section>
    """
  end
end
