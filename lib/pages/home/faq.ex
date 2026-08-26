defmodule Soonex.HomePage.Faq do
  @moduledoc false

  use Phoenix.Component
  use Corex

  import Soonex.Layouts.Section, only: [block: 1]

  def faq(assigns) do
    ~H"""
    <.block id="quaestiones" labelledby="soonex-faq-heading" eyebrow="Quaestiones" layout={:sticky}>
      <:title>
        Saepe <span class="text-brand-text">quaeruntur</span>
      </:title>
      <:lede>
        Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod.
      </:lede>
      <:actions>
        <.navigate to="#epistula" class="link ui-brand">
          Scribe nomen <.heroicon name="hero-arrow-down" />
        </.navigate>
      </:actions>
      <.accordion
        id="soonex-faq"
        class="accordion ui-accent ui-size-md mx-auto w-full max-w-none"
        multiple={false}
        collapsible={false}
        value="alpha"
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
        value: "alpha",
        label: "Quid est lorem ipsum?",
        content:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco."
      },
      %{
        value: "beta",
        label: "Unde venit dolor sit amet?",
        content:
          "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt."
      },
      %{
        value: "gamma",
        label: "Cur consectetur adipiscing elit?",
        content:
          "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis."
      },
      %{
        value: "delta",
        label: "Quando magnum aliqua finietur?",
        content:
          "Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt."
      },
      %{
        value: "epsilon",
        label: "Quo vadit haec epistula?",
        content:
          "Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore."
      },
      %{
        value: "zeta",
        label: "Quomodo officia tria iunguntur?",
        content:
          "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi."
      }
    ])
  end
end
