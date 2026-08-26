defmodule Soonex.HomePage.Faq do
  @moduledoc false

  use Phoenix.Component
  use Corex

  alias Soonex.Layouts.Shell

  def faq(assigns) do
    ~H"""
    <section
      id="quaestiones"
      class={"#{Shell.section()} border-y border-border bg-surface"}
      aria-labelledby="soonex-faq-heading"
    >
      <div class={"#{Shell.stage()} grid grid-cols-1 items-start gap-size-xl lg:grid-cols-[minmax(0,0.9fr)_minmax(0,1.2fr)]"}>
        <div class="flex w-full flex-col gap-size-md lg:sticky lg:top-40">
          <p class={Shell.eyebrow()}>Quaestiones</p>
          <h2 id="soonex-faq-heading" class={Shell.section_heading()}>
            Saepe <span class="text-brand-text">quaeruntur</span>
          </h2>
          <p class={Shell.lede()}>
            Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod.
          </p>
          <p class="m-0 text-sm">
            <.navigate to="#epistula" class="link ui-brand">Scribe nomen</.navigate>
          </p>
        </div>

        <div class="w-full">
          <.accordion
            id="soonex-faq"
            class="accordion ui-accent ui-size-sm sm:ui-size-md lg:ui-size-xl mx-auto w-full max-w-none"
            multiple={true}
            value={["alpha"]}
            items={faq_items()}
          >
            <:trigger :let={item}>
              <span class="min-w-0 text-start">{item.label}</span>
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
        value: "alpha",
        label: "Quid est lorem ipsum?",
        content:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam."
      },
      %{
        value: "beta",
        label: "Unde venit dolor sit amet?",
        content:
          "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident."
      },
      %{
        value: "gamma",
        label: "Cur consectetur adipiscing elit?",
        content:
          "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo."
      },
      %{
        value: "delta",
        label: "Quando magnum aliqua finietur?",
        content:
          "Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi."
      },
      %{
        value: "epsilon",
        label: "Quo vadit haec epistula?",
        content:
          "Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt."
      }
    ])
  end
end
