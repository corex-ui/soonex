defmodule Soonex.HomePage.Faq do
  @moduledoc false

  use Phoenix.Component
  use Corex

  import Soonex.Layouts.Section, only: [block: 1]

  def faq(assigns) do
    ~H"""
    <.block id="quaestiones" labelledby="soonex-faq-heading" eyebrow="Questions" layout={:sticky}>
      <:title>
        Laboris nisi ut <span class="text-brand-text">aliquip</span>
      </:title>
      <:lede>
        Consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
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
        label: "Lorem ipsum dolor sit amet?",
        content:
          "Consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam."
      },
      %{
        value: "npm",
        label: "Quis nostrud exercitation ullamco?",
        content:
          "Laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore."
      },
      %{
        value: "themes",
        label: "Eu fugiat nulla pariatur?",
        content:
          "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
      },
      %{
        value: "i18n",
        label: "Sed ut perspiciatis unde omnis?",
        content:
          "Iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore."
      },
      %{
        value: "waitlist",
        label: "Veritatis et quasi architecto?",
        content:
          "Beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit."
      },
      %{
        value: "a11y",
        label: "Sed quia consequuntur magni?",
        content:
          "Dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet."
      }
    ])
  end
end
