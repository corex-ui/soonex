defmodule Soonex.HomePage.Officia do
  @moduledoc false

  use Phoenix.Component
  use Corex

  import Soonex.Layouts.Section, only: [block: 1]

  alias Soonex.Layouts.Shell

  def officia(assigns) do
    ~H"""
    <.block
      id="officia"
      labelledby="soonex-officia-heading"
      eyebrow="Plans"
      tone={:root}
    >
      <:title>
        Pick a lane. <span class="text-brand-text">Ship the same core.</span>
      </:title>
      <:lede>
        Every plan is the same Soonex fork. The columns describe how far you take the template before
        1 September.
      </:lede>
      <div class="grid grid-cols-1 gap-4 lg:grid-cols-3">
        <article
          :for={plan <- plans()}
          class={"#{Shell.panel()} soonex-card-motion flex flex-col p-6 sm:p-8"}
        >
          <p class={Shell.eyebrow()}>{plan.name}</p>
          <h3 class="display mt-2 text-xl font-semibold tracking-tight text-ink">{plan.headline}</h3>
          <p class="mt-3 text-sm/6 text-ink-muted sm:text-base/7">{plan.body}</p>
          <ul class={Shell.feature_list()}>
            <li :for={item <- plan.items} class="flex items-start gap-3">
              <span class="badge ui-brand ui-size-sm shrink-0">{item.label}</span>
              <span class="min-w-0 text-sm/6 text-ink-muted">{item.content}</span>
            </li>
          </ul>
          <.navigate to="#epistula" class={"#{plan.cta_class} mt-8 w-full"}>
            {plan.cta}
          </.navigate>
        </article>
      </div>
    </.block>
    """
  end

  defp plans do
    [
      %{
        name: "Launch",
        headline: "Fork and replace the copy",
        body: "One theme, the waitlist, and the journal. Enough to put a date on the page.",
        cta: "Join waitlist",
        cta_class: "button ui-ghost ui-size-md ui-width-full",
        items: [
          %{label: "Site", content: "Waitlist landing and Markdown journal"},
          %{label: "Theme", content: "Keep neo, or switch once in config"},
          %{label: "Date", content: "Countdown aimed at 1 September"}
        ]
      },
      %{
        name: "Studio",
        headline: "Four themes, real stills",
        body: "Treat Template Options as a client review. Photography and the shipping log stay.",
        cta: "Join waitlist",
        cta_class: "button ui-brand ui-solid ui-size-md ui-width-full",
        items: [
          %{label: "Themes", content: "neo, uno, duo, and leo on this device"},
          %{label: "Journal", content: "Covers, tags, and client pagination"},
          %{label: "Chrome", content: "Header timer, toast, and clone strip"}
        ]
      },
      %{
        name: "Agency",
        headline: "Accessible by default",
        body: "Ship the a11y dialog, reduced motion, and a clone path your team can repeat.",
        cta: "Join waitlist",
        cta_class: "button ui-ghost ui-size-md ui-width-full",
        items: [
          %{label: "A11y", content: "Zoom, contrast, motion, focus, underline"},
          %{label: "Stack", content: "Mix, Tailwind, esbuild — no npm"},
          %{label: "Handoff", content: "Clone, mix setup, mix soonex.server"}
        ]
      }
    ]
  end
end
