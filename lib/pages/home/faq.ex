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
        value="ships"
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
        value: "ships",
        label: "What ships when I fork this template?",
        content:
          "A waitlist landing page, a journal, countdown chrome, and the Corex controls already on this page. Photography, copy, and the launch date are placeholders you replace."
      },
      %{
        value: "waitlist",
        label: "Does the waitlist collect real addresses?",
        content:
          "Not in this demo. Submit still shows a toast so you can see the success path without storing mailboxes. Wire the same form to your list later — interests, role, team size, and launch notes are already named fields."
      },
      %{
        value: "themes",
        label: "How do themes change without forking Corex CSS?",
        content:
          "Theme, brand, and accent live in config. The floating Template Options panel switches neo, uno, duo, and leo on this device. Host CSS only retunes layout; it does not copy component recipes or set overlay scale, duration, or opacity."
      },
      %{
        value: "journal",
        label: "Where does the journal live, and can I add posts?",
        content:
          "Posts are Markdown under the journal route. The home carousel is a short reading list; the index paginates the rest. Add a file, rebuild, and the cover, date, and title show up. Tags stay optional."
      },
      %{
        value: "motion",
        label: "How does scroll motion behave with reduced motion?",
        content:
          "Scroll reveal and card lift live in host CSS. They follow scroll and hover; they do not fight the type. Set Motion to Reduced in Accessibility and those animations stop. The condensed header and progress bar stay as chrome."
      },
      %{
        value: "a11y",
        label: "What do the accessibility controls change?",
        content:
          "The person-in-circle control at the corner opens zoom, contrast, motion, cursor, focus, and link underline for this device. Choices persist in local storage and write data attributes on the document. Reset returns the defaults."
      },
      %{
        value: "toolchain",
        label: "Do I need npm or a JavaScript bundler to start?",
        content:
          "No. Mix, Tailwind, and esbuild already in the project are enough. There is no package.json and no Lenis. Select, marquee, carousel, and accordion are Corex hooks. Host scripts only bind header chrome and the waitlist toast."
      },
      %{
        value: "countdown",
        label: "How is the countdown wired to a launch date?",
        content:
          "The hero timer counts down to 1 September in this demo. The header timer stays in the bar and appears after the hero. Change the target in the home template when you have a real date. Days, hours, minutes, and seconds stay on one row."
      },
      %{
        value: "brand",
        label: "Can I keep the photography and marquee after a rebrand?",
        content:
          "Yes. Swap the stills and the lockup. The marquee is Corex as-is, with color marks and a fade to the page root. Grey filters are gone on purpose so logos stay on-brand. Pause on hover still holds a mark in place."
      }
    ])
  end
end
