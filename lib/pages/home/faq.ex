defmodule Soonex.HomePage.Faq do
  @moduledoc false

  use Phoenix.Component
  use Corex

  import Soonex.Layouts.Section, only: [block: 1]

  def faq(assigns) do
    ~H"""
    <.block
      id="questions"
      section="faq"
      labelledby="soonex-faq-heading"
      eyebrow="Questions"
      layout={:sticky}
      tone={:surface}
    >
      <:title>
        Before you fork Soonex.
      </:title>
      <:lede>
        Customization lives in config :corex_design and HEEx content modules. No parallel CSS
        framework to maintain.
      </:lede>
      <:actions>
        <.navigate to="#waitlist" class="link ui-brand">
          Join waitlist <.heroicon name="hero-arrow-down" />
        </.navigate>
      </:actions>
      <.accordion
        id="soonex-faq"
        class="accordion ui-accent ui-size-md ui-width-full"
        multiple={false}
        collapsible
        value="corex"
        items={faq_items()}
      >
        <:trigger :let={item}>
          <span class="min-w-0 text-start">{item.label}</span>
        </:trigger>
        <:content :let={item}>
          <div class="flex flex-col gap-4">
            <p class="m-0 text-base/7">{item.content}</p>
            <.navigate :if={item.value == "customize"} to="#how-it-works" class="link ui-brand w-fit">
              See how it works <.heroicon name="hero-arrow-down" />
            </.navigate>
            <.navigate :if={item.value == "waitlist"} to="#waitlist" class="link ui-brand w-fit">
              Open the waitlist <.heroicon name="hero-arrow-down" />
            </.navigate>
            <.clipboard
              :if={item.value == "toolchain"}
              id="soonex-faq-setup"
              class="clipboard ui-brand ui-size-sm ui-width-fit self-start"
              value="mix setup"
            >
              <:label class="sr-only">mix setup</:label>
              <:copy>
                <.heroicon name="hero-clipboard" />
                <span>Copy</span>
              </:copy>
              <:copied>
                <.heroicon name="hero-check" />
                <span>Copied</span>
              </:copied>
            </.clipboard>
          </div>
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
        value: "corex",
        label: "What is Corex in this template?",
        content:
          "Corex is an accessible Phoenix UI kit. Soonex uses its static-site integration: design tokens from config :corex_design, ui-* modifiers in HEEx, and client hooks for interactive widgets."
      },
      %{
        value: "customize",
        label: "How do I change colors and typography?",
        content:
          "Edit seeds, dimensions, and typography under config :corex_design, then run mix corex.design.build. Light and dark modes regenerate from the same config."
      },
      %{
        value: "waitlist",
        label: "Does the waitlist store email addresses?",
        content:
          "Not in this demo. Submit shows a toast so you can verify the UX before wiring your list provider. Field names are already structured for a real backend."
      },
      %{
        value: "toolchain",
        label: "Do I need npm?",
        content:
          "No. Mix, Tailwind, and esbuild ship in the repo. There is no package.json — run mix setup and mix server to work locally."
      },
      %{
        value: "a11y",
        label: "What do the accessibility controls do?",
        content:
          "The person icon opens Corex accessibility settings: text size, contrast, motion, cursor, focus, and link underline. Choices persist in localStorage on this device."
      }
    ])
  end
end
