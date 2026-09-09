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
    >
      <:title>
        Before you fork. <span class="soonex-accent">Then it's yours.</span>
      </:title>
      <:lede>
        The waitlist, skins, and journal are already in the tree. Photography and copy are the
        first things you replace.
      </:lede>
      <:actions>
        <.navigate to="#waitlist" class="link ui-brand">
          Join waitlist <.heroicon name="hero-arrow-down" />
        </.navigate>
      </:actions>
      <.accordion
        id="soonex-faq"
        class="accordion ui-accent ui-size-md ui-width-full soonex-faq"
        multiple={false}
        collapsible
        value="ships"
        items={faq_items()}
      >
        <:trigger :let={item}>
          <span class="soonex-faq-trigger">
            <span class="soonex-faq-index text-sm font-semibold tracking-wide text-brand-text">
              {faq_index(item.value)}
            </span>
            <span class="min-w-0">{item.label}</span>
          </span>
        </:trigger>
        <:content :let={item}>
          <div class="soonex-faq-answer flex flex-col gap-4">
            <p class="m-0 text-base/7">{item.content}</p>
            <.navigate :if={item.value == "ships"} to="#features" class="link ui-brand w-fit">
              See the product <.heroicon name="hero-arrow-down" />
            </.navigate>
            <.navigate :if={item.value == "waitlist"} to="#waitlist" class="link ui-brand w-fit">
              Open the waitlist <.heroicon name="hero-arrow-down" />
            </.navigate>
            <ul
              :if={item.value == "themes"}
              class="soonex-faq-themes m-0 flex list-none flex-wrap gap-2 p-0"
            >
              <li class="badge ui-size-sm">neo</li>
              <li class="badge ui-size-sm">uno</li>
              <li class="badge ui-size-sm">duo</li>
              <li class="badge ui-size-sm">leo</li>
            </ul>
            <.navigate
              :if={item.value == "journal"}
              to={Soonex.Public.path("/blog")}
              class="link ui-brand w-fit"
            >
              Read the journal <.heroicon name="hero-arrow-up-right" />
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

  defp faq_index("ships"), do: "01"
  defp faq_index("waitlist"), do: "02"
  defp faq_index("themes"), do: "03"
  defp faq_index("journal"), do: "04"
  defp faq_index("motion"), do: "05"
  defp faq_index("a11y"), do: "06"
  defp faq_index("toolchain"), do: "07"
  defp faq_index("countdown"), do: "08"
  defp faq_index(_value), do: "00"

  defp faq_items do
    Corex.Content.new([
      %{
        value: "ships",
        label: "What ships when I fork this template?",
        content:
          "A waitlist landing page, a journal, countdown chrome, and four theme skins. Photography, copy, and the launch date are placeholders you replace."
      },
      %{
        value: "waitlist",
        label: "Does the waitlist collect real addresses?",
        content:
          "Not in this demo. Submit still shows a toast so you can see the success path without storing mailboxes. Wire the same form to your list later — interests, role, team size, and launch notes are already named fields."
      },
      %{
        value: "themes",
        label: "How do the four themes look so different?",
        content:
          "Corex config owns seeds, radius, and type. Isolated CSS in assets/css/skins restyles nav chrome, hero composition, and ornament. Delete a skin file and its import to drop that look."
      },
      %{
        value: "journal",
        label: "Where does the journal live, and can I add posts?",
        content:
          "Posts are Markdown under the journal route. The home grid is a short reading list; the index paginates the rest. Add a file, rebuild, and the cover, date, and title show up."
      },
      %{
        value: "motion",
        label: "How does scroll motion behave with reduced motion?",
        content:
          "Scroll reveal, card lift, and skin ornament follow scroll and hover. Set Motion to Reduced in Accessibility and those animations stop. The condensed header and progress bar stay as chrome."
      },
      %{
        value: "a11y",
        label: "What do the accessibility controls change?",
        content:
          "The person-in-circle control at the corner opens zoom, contrast, motion, cursor, focus, and link underline for this device. Choices persist in local storage and write data attributes on the document."
      },
      %{
        value: "toolchain",
        label: "Do I need npm or a JavaScript bundler to start?",
        content:
          "No. Mix, Tailwind, and esbuild already in the project are enough. There is no package.json. Copy the setup command and you are in."
      },
      %{
        value: "countdown",
        label: "How is the countdown wired to a launch date?",
        content:
          "Soonex.Launch holds the target. The hero shows a launch badge; the header timer appears after the hero. Change the target in that module when you have a real date."
      }
    ])
  end
end
