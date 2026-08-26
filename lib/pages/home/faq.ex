defmodule Soonex.HomePage.Faq do
  @moduledoc false

  use Phoenix.Component
  use Corex

  alias Soonex.Layouts.Shell

  def faq(assigns) do
    ~H"""
    <section
      id="faq"
      class={"#{Shell.section()} border-y border-border bg-surface"}
      aria-labelledby="soonex-faq-heading"
    >
      <div class={"#{Shell.stage()} grid grid-cols-1 items-start gap-size-xl lg:grid-cols-[minmax(0,0.9fr)_minmax(0,1.2fr)]"}>
        <div class="mx-auto flex w-full max-w-2xl flex-col items-center gap-size-md text-center lg:mx-0 lg:max-w-none lg:items-start lg:sticky lg:top-40 lg:text-start">
          <p class={Shell.eyebrow()}>FAQ</p>
          <h2 id="soonex-faq-heading" class={Shell.section_heading()}>
            Folded <span class="text-brand-text">questions</span>
          </h2>
          <p class={Shell.lede()}>
            How the template is cut, printed, and shipped. Join the waitlist if you want build notes.
          </p>
          <p class="m-0 text-sm">
            <.navigate to="#waitlist" class="link ui-brand">Join the waitlist</.navigate>
          </p>
        </div>

        <div class="mx-auto w-full max-w-2xl lg:mx-0 lg:max-w-none">
          <.accordion
            id="soonex-faq"
            class="accordion ui-accent ui-size-sm sm:ui-size-md lg:ui-size-xl mx-auto w-full max-w-none"
            multiple={true}
            value={["stack"]}
            items={faq_items()}
          >
            <:trigger :let={item}>
              <span class="flex min-w-0 items-center gap-space">
                <span class="flex shrink-0 -space-x-2" aria-hidden="true">
                  <span
                    :for={tech <- item.meta.tech}
                    class="inline-flex size-7 items-center justify-center rounded-full border border-border bg-surface p-space-xs"
                  >
                    <img
                      src={Soonex.Public.path(tech.src)}
                      alt=""
                      class="size-4 object-contain"
                      loading="lazy"
                    />
                  </span>
                </span>
                <span class="min-w-0 text-start">{item.label}</span>
              </span>
            </:trigger>
            <:content :let={item}>
              <p class="m-0 leading-relaxed">{item.content}</p>
            </:content>
            <:indicator>
              <.heroicon name="hero-chevron-right" />
            </:indicator>
          </.accordion>
        </div>
      </div>
    </section>
    """
  end

  defp faq_items do
    Corex.Content.new([
      %{
        value: "stack",
        label: "What is Soonex built with?",
        content:
          "Tableau compiles HEEx pages to static HTML. Corex supplies accessible components and design tokens. Tailwind v4 maps those tokens to utilities.",
        meta: %{
          tech: [
            %{name: "Tableau", src: "/images/tech/tableau.jpg"},
            %{name: "Elixir", src: "/images/tech/elixir.svg"},
            %{name: "Hex", src: "/images/tech/hex.svg"}
          ]
        }
      },
      %{
        value: "builds",
        label: "How do I rebuild design CSS?",
        content:
          "Run mix corex.design.build after upgrading Corex or changing config :corex_design. Then mix assets.build (or mix tableau.server in dev).",
        meta: %{
          tech: [
            %{name: "Tailwind", src: "/images/tech/tailwind.svg"},
            %{name: "Hex", src: "/images/tech/hex.svg"}
          ]
        }
      },
      %{
        value: "mcp",
        label: "Is Corex MCP available here?",
        content:
          "In MIX_ENV=dev, Corex MCP listens at http://localhost:4004/corex/mcp while Tableau stays on 4999. See .cursor/mcp.json.",
        meta: %{
          tech: [
            %{name: "Phoenix", src: "/images/tech/phoenix.svg"},
            %{name: "TypeScript", src: "/images/tech/typescript.svg"},
            %{name: "Zag.js", src: "/images/tech/zag.webp"}
          ]
        }
      },
      %{
        value: "themes",
        label: "Can I switch themes and modes?",
        content:
          "Yes. The floating Template Options panel writes data-theme and data-mode. Fonts for neo, uno, duo, and leo are self-hosted.",
        meta: %{
          tech: [
            %{name: "CSS", src: "/images/tech/css.svg"},
            %{name: "Figma", src: "/images/tech/figma.svg"}
          ]
        }
      },
      %{
        value: "next",
        label: "Where does the waitlist go?",
        content:
          "The demo form only shows a toast. Point it at your API, newsletter, or worker when you ship.",
        meta: %{
          tech: [
            %{name: "Phoenix", src: "/images/tech/phoenix.svg"},
            %{name: "Zag.js", src: "/images/tech/zag.webp"},
            %{name: "Ecto", src: "/images/tech/ecto.png"}
          ]
        }
      }
    ])
  end
end
