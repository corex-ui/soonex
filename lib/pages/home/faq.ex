defmodule Soonex.HomePage.Faq do
  @moduledoc false

  use Phoenix.Component
  use Corex

  import Soonex.Layouts.Section, only: [block: 1]

  def faq(assigns) do
    ~H"""
    <.block id="questions" labelledby="soonex-faq-heading" eyebrow="Questions" layout={:sticky}>
      <:title>
        Before you <span class="text-brand-text">clone</span>
      </:title>
      <:lede>
        What Soonex is, what ships, and what you replace.
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
          "The open-source waitlist and launch template that ships with Corex. Fork it for a September launch — or any date you set."
      },
      %{
        value: "ships",
        label: "What ships on 1 September?",
        content:
          "The landing, the waitlist fields, the shipping log, the header countdown, and four themes. Copy and stills are yours to replace."
      },
      %{
        value: "themes",
        label: "Why four themes?",
        content:
          "neo, uno, duo, and leo are four rooms on the same near-white paper. Type, radius, and brand change. Template Options switches them on this device."
      },
      %{
        value: "form",
        label: "Does the form collect email?",
        content:
          "Not on this demo. Submit still shows the launch toast so you can see the success path. Wire your provider after you fork."
      },
      %{
        value: "a11y",
        label: "How does accessibility work?",
        content:
          "The Accessibility control opens zoom, contrast, motion, cursor, focus, and underline. Choices persist in local storage."
      },
      %{
        value: "clone",
        label: "How do I clone it?",
        content:
          "git clone the repo, then mix setup and mix soonex.server. There is no package.json."
      }
    ])
  end
end
