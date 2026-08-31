defmodule Soonex.HomePage.Bento do
  @moduledoc false

  use Phoenix.Component
  use Corex

  import Soonex.Layouts.Section, only: [block: 1]

  alias Soonex.Layouts.Shell

  def bento(assigns) do
    ~H"""
    <.block id="features" labelledby="soonex-bento-heading" eyebrow="Features" layout={:open}>
      <:title>
        Everything you need to <span class="text-brand-text">launch</span>
      </:title>
      <:lede>
        Four instruments composed like a Framer product page — waitlist, log, countdown, looks.
      </:lede>

      <ul class="soonex-bento">
        <li :for={cell <- cells()} class={"soonex-bento-cell soonex-card-motion #{cell.span}"}>
          <small class={Shell.eyebrow()}>{cell.kicker}</small>
          <h3 class={"#{Shell.card_title()} mt-3"}>{cell.title}</h3>
          <p class="lede mt-3">{cell.body}</p>
          <.navigate :if={cell.to} to={cell.to} class="link ui-brand mt-6 inline-flex">
            {cell.cta} <.heroicon name={cell.icon} />
          </.navigate>
        </li>
      </ul>
    </.block>
    """
  end

  defp cells do
    [
      %{
        kicker: "01",
        title: "Waitlist on day one",
        body: "Email, role, interests, team size — with a launch toast on submit.",
        to: "#waitlist",
        cta: "Join the list",
        icon: "hero-arrow-down",
        span: "soonex-bento-wide"
      },
      %{
        kicker: "02",
        title: "Public shipping log",
        body: "Markdown entries with covers and tags. The index paginates in the browser.",
        to: Soonex.Public.path("/blog"),
        cta: "Read the log",
        icon: "hero-arrow-up-right",
        span: ""
      },
      %{
        kicker: "03",
        title: "Honest countdown",
        body: "Aimed at 1 September until you change the date. Digits stay on one row.",
        to: "#product",
        cta: "See product",
        icon: "hero-arrow-down",
        span: ""
      },
      %{
        kicker: "04",
        title: "Four looks",
        body: "neo, uno, duo, leo — switch live for client review without a second build.",
        to: "#looks",
        cta: "Browse looks",
        icon: "hero-arrow-down",
        span: "soonex-bento-wide"
      }
    ]
  end
end
