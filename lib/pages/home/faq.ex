defmodule Soonex.HomePage.Faq do
  @moduledoc false

  use Phoenix.Component
  use Corex

  alias Soonex.Layouts.Shell

  def faq(assigns) do
    ~H"""
    <section
      id="faq"
      class={"#{Shell.section()} border-y border-border"}
      aria-labelledby="soonex-faq-heading"
    >
      <div class={"#{Shell.stage()} grid grid-cols-1 items-start gap-size-xl lg:grid-cols-[minmax(0,0.9fr)_minmax(0,1.2fr)]"}>
        <div class="mx-auto flex w-full max-w-2xl flex-col items-center gap-size-md text-center lg:mx-0 lg:max-w-none lg:items-start lg:text-start lg:sticky lg:top-40">
          <h2 id="soonex-faq-heading" class={Shell.section_heading()}>
            Lorem <span class="text-brand-text">FAQ</span>
          </h2>
          <p class={Shell.lede()}>
            Ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore.
          </p>
          <p class="m-0 text-sm">
            <.navigate to="#waitlist" class="link ui-brand">Join the waitlist</.navigate>
          </p>
        </div>

        <div class="min-w-0 w-full">
          <.accordion
            id="soonex-faq"
            class="accordion ui-accent ui-size-sm sm:ui-size-md lg:ui-size-xl w-full"
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
        label: "Lorem ipsum dolor sit amet?",
        content:
          "Consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.",
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
        label: "Sed do eiusmod tempor?",
        content:
          "Incididunt ut labore et dolore magna aliqua. Quis nostrud exercitation ullamco laboris nisi ut aliquip.",
        meta: %{
          tech: [
            %{name: "Tailwind", src: "/images/tech/tailwind.svg"},
            %{name: "Hex", src: "/images/tech/hex.svg"}
          ]
        }
      },
      %{
        value: "mcp",
        label: "Ut enim ad minim veniam?",
        content:
          "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
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
        label: "Excepteur sint occaecat?",
        content:
          "Cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        meta: %{
          tech: [
            %{name: "CSS", src: "/images/tech/css.svg"},
            %{name: "Figma", src: "/images/tech/figma.svg"}
          ]
        }
      },
      %{
        value: "next",
        label: "Anim id est laborum?",
        content:
          "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.",
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
