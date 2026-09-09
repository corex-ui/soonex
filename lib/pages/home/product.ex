defmodule Soonex.HomePage.Product do
  @moduledoc false

  use Phoenix.Component
  use Corex

  import Soonex.Layouts.Media, only: [photo: 1]
  import Soonex.Layouts.Section, only: [block: 1]

  alias Soonex.Layouts.Shell

  def product(assigns) do
    ~H"""
    <.block
      id="product"
      section="product"
      labelledby="soonex-product-heading"
      eyebrow="Inside"
      tone={:surface}
    >
      <:title>
        The page is the product. <span class="soonex-accent">Replace the stills.</span>
      </:title>
      <:lede>
        Photography, lockup, and launch date are placeholders. The bands, tokens, and waitlist
        fields stay.
      </:lede>
      <div class="soonex-bento grid grid-cols-1 gap-4 lg:grid-cols-12">
        <article class={"#{Shell.frame()} soonex-card-motion soonex-bento-hero relative min-h-80 lg:col-span-7 lg:min-h-[28rem]"}>
          <.photo
            src="/images/photos/studio.jpg"
            alt="A calm studio interior with a low sofa, plants, and a large window"
            width={1400}
            height={1600}
            class="absolute inset-0 size-full"
          />
          <div class="soonex-bento-caption absolute inset-x-0 bottom-0 border-t border-border bg-root p-6 sm:p-8">
            <p class={Shell.eyebrow()}>Studio</p>
            <h3 class="display mt-2 text-xl font-semibold tracking-tight text-ink sm:text-2xl">
              Drop in your product stills. Keep the grid.
            </h3>
          </div>
        </article>

        <div class="soonex-bento-cells flex flex-col gap-2 lg:col-span-5">
          <.collapsible
            :for={cell <- cells()}
            id={cell.id}
            class="collapsible ui-brand ui-width-full soonex-bento-cell"
            open={cell.open}
          >
            <:trigger>
              <span class="flex min-w-0 flex-1 flex-col text-start">
                <span class={Shell.eyebrow()}>{cell.kicker}</span>
                <span class="display mt-1 text-lg font-semibold tracking-tight text-ink">
                  {cell.title}
                </span>
              </span>
              <.heroicon name="hero-chevron-down" />
            </:trigger>
            <:content>
              <p class="m-0 text-sm/6 text-ink-muted sm:text-base/7">{cell.body}</p>
            </:content>
          </.collapsible>
        </div>
      </div>
    </.block>
    """
  end

  defp cells do
    [
      %{
        id: "soonex-inside-waitlist",
        open: true,
        kicker: "Waitlist",
        title: "Named fields, ready to wire",
        body:
          "Email, role, interests, team size, and launch notes are already in the form. Submit shows a toast in this demo."
      },
      %{
        id: "soonex-inside-journal",
        open: false,
        kicker: "Journal",
        title: "Markdown posts, tags, RSS",
        body: "Add a file under _posts, rebuild, and the cover, date, and title show up."
      },
      %{
        id: "soonex-inside-skins",
        open: false,
        kicker: "Skins",
        title: "Custom CSS you can delete",
        body:
          "Each theme lives in assets/css/skins. Host CSS does not copy Corex recipes or set overlay opacity."
      },
      %{
        id: "soonex-inside-access",
        open: false,
        kicker: "Access",
        title: "Preferences stay on device",
        body:
          "Zoom, contrast, motion, cursor, focus, and link underline persist in local storage. Reset returns the defaults."
      }
    ]
  end
end
