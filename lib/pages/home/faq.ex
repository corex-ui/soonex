defmodule Soonex.HomePage.Faq do
  @moduledoc false

  use Phoenix.Component
  use Corex

  import Soonex.Layouts.Section, only: [block: 1]

  def faq(assigns) do
    ~H"""
    <.block id="quaestiones" labelledby="soonex-faq-heading" eyebrow="Questions" layout={:sticky}>
      <:title>
        Before you <span class="text-brand-text">clone</span>
      </:title>
      <:lede>
        Opinionated answers. Still true after you fork.
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
        collapsible={true}
        value="gallery"
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
        value: "gallery",
        label: "Is this a component gallery?",
        content: "No. It’s a waitlist with a date. The controls happen to be Corex."
      },
      %{
        value: "email",
        label: "Will you email me?",
        content:
          "Not from this demo. Submit anyway — the toast is the whole point until you wire a list."
      },
      %{
        value: "themes",
        label: "Why four themes?",
        content: "So a client can sit on the sofa and say ‘that one’ without a rebuild."
      },
      %{
        value: "npm",
        label: "Do I need npm?",
        content: "No. If you miss it, this isn’t your template."
      },
      %{
        value: "posts",
        label: "Where do posts go?",
        content: "Markdown. Rebuild. The pager is a Corex event in the browser, not LiveView."
      },
      %{
        value: "motion",
        label: "What if motion makes me sick?",
        content:
          "Accessibility → Motion → Reduced. The header still condenses. The type still holds."
      },
      %{
        value: "photos",
        label: "Can I keep the photos?",
        content: "Swap them. They’re placeholders with a license, not the brand."
      },
      %{
        value: "september",
        label: "When is September?",
        content:
          "Whenever you change the timestamp in the home template. The digits stay on one row."
      }
    ])
  end
end
