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
      eyebrow="Inside"
      tone={:surface}
    >
      <:title>
        Lorem ipsum <span class="text-brand-text">dolor sit</span>
      </:title>
      <:lede>
        Consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
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
            <p class={Shell.eyebrow()}>Lorem</p>
            <h3 class="display mt-2 text-xl font-semibold tracking-tight text-ink sm:text-2xl">
              Ipsum dolor sit amet consectetur adipiscing elit
            </h3>
          </div>
        </article>

        <article class={"#{Shell.panel()} flex flex-col p-6 sm:p-8 lg:col-span-2"}>
          <p class={Shell.eyebrow()}>Ipsum</p>
          <.collapsible id="soonex-capita-collapsible" class="collapsible ui-width-full mt-4">
            <:trigger>Read more</:trigger>
            <:closed>
              <.heroicon name="hero-chevron-down" />
            </:closed>
            <:content>
              <p class="m-0 text-sm/6 text-ink-muted sm:text-base/7">
                Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
                veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                consequat.
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
        kicker: "Dolor",
        title: "Sit amet consectetur",
        body:
          "Adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
      },
      %{
        kicker: "Sit",
        title: "Ut enim ad minim",
        body: "Veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo."
      },
      %{
        kicker: "Amet",
        title: "Duis aute irure dolor",
        body: "In reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur."
      }
    ]
  end
end
