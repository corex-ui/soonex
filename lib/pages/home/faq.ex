defmodule Soonex.HomePage.Faq do
  @moduledoc false

  use Phoenix.Component
  use Corex

  import Soonex.Layouts.Section, only: [block: 1]

  def faq(assigns) do
    ~H"""
    <.block id="quaestiones" labelledby="soonex-faq-heading" eyebrow="Questions" layout={:sticky}>
      <:title>
        Before you <span class="text-brand-text">fork</span>
      </:title>
      <:lede>
        The sticky split stays here. Everywhere else, the band is the component.
      </:lede>
      <:actions>
        <.navigate to="#epistula" class="link ui-brand">
          Join waitlist <.heroicon name="hero-arrow-down" />
        </.navigate>
      </:actions>
      <.accordion
        id="soonex-faq"
        class="accordion ui-accent ui-size-md mx-auto w-full max-w-none"
        multiple={false}
        collapsible={false}
        value="what"
        items={faq_items()}
      >
        <:trigger :let={item}>
          <span class="min-w-0 text-start">{item.label}</span>
        </:trigger>
        <:content :let={item}>
          <p class="m-0 text-base/7">{item.content}</p>
        </:content>
        <:indicator>
          <.heroicon name="hero-chevron-right" />
        </:indicator>
      </.accordion>
    </.block>
    """
  end

  defp faq_items do
    Corex.Content.new([
      %{
        value: "what",
        label: "What is Soonex?",
        content:
          "A Tableau static site with Corex components. It is a launch template: waitlist, countdown, journal, and four theme overlays you edit in config."
      },
      %{
        value: "npm",
        label: "Do I need npm?",
        content:
          "Not for Corex. Mix installs the hooks; Esbuild resolves corex/* from deps. There is no package.json in this repo."
      },
      %{
        value: "themes",
        label: "How do I change the brand?",
        content:
          "Overlay seeds, colors, radius, font, and typography under config :corex_design. Then mix corex.design.build. Do not lower contrast targets."
      },
      %{
        value: "i18n",
        label: "Is this the multi-locale variant?",
        content:
          "No. soonex_i18n is a separate repository. This template is English-only on purpose."
      },
      %{
        value: "waitlist",
        label: "Does the waitlist store email?",
        content:
          "The demo forms prevent submit and fire a toast. Wire the same fields to your backend when you have one."
      },
      %{
        value: "a11y",
        label: "Where are accessibility preferences stored?",
        content:
          "In localStorage under phx:a11y. The Corex dialog is the official --a11y surface, not a custom panel."
      }
    ])
  end
end
