defmodule Soonex.HomePage.Faq do
  @moduledoc false

  use Phoenix.Component
  use Corex

  import Soonex.Layouts.Section, only: [block: 1]

  def faq(assigns) do
    ~H"""
    <.block id="questions" labelledby="soonex-faq-heading" eyebrow="Questions" layout={:sticky}>
      <:title>
        Before you <span class="text-brand-text">join</span>
      </:title>
      <:lede>
        Straight answers about the launch, the waitlist, and what you get on day one.
      </:lede>
      <:actions>
        <.navigate to="#waitlist" class="link ui-brand">
          Join waitlist <.heroicon name="hero-arrow-down" />
        </.navigate>
      </:actions>
      <.accordion
        id="soonex-faq"
        class="accordion ui-accent ui-size-md mx-auto w-full max-w-none"
        multiple={false}
        collapsible={true}
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
          "A launch workspace shipping 1 September — waitlist, public shipping log, countdown, and four looks for client review."
      },
      %{
        value: "ships",
        label: "What do I get on launch day?",
        content:
          "The landing, waitlist fields, shipping log, header countdown, and four looks. Swap the stills, lockup, and date for your brand."
      },
      %{
        value: "looks",
        label: "What are the four looks?",
        content:
          "neo, uno, duo, and leo. Same page, different type, corners, and brand. Switch them live in Template Options for a client review."
      },
      %{
        value: "form",
        label: "Will you email me after I join?",
        content:
          "Yes — when you wire a provider. On this demo page, submit shows the launch toast so you can see the success path."
      },
      %{
        value: "a11y",
        label: "How does accessibility work?",
        content:
          "Open Accessibility for zoom, contrast, motion, cursor, focus, and underline. Choices stay on this device in local storage."
      },
      %{
        value: "open",
        label: "Is this open source?",
        content:
          "Yes. Clone the repo, run mix setup and mix soonex.server. There is no package.json — Mix, Tailwind, and esbuild are already in the project."
      }
    ])
  end
end
