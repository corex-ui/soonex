defmodule Soonex.HomePage.Pricing do
  @moduledoc false

  use Phoenix.Component
  use Corex

  alias Soonex.Layouts.Shell

  def pricing(assigns) do
    ~H"""
    <section
      id="scale"
      data-section="scale"
      class={"#{Shell.section()} bg-root"}
      aria-labelledby="soonex-scale-heading"
    >
      <div class={Shell.stage()}>
        <h2 id="soonex-scale-heading" class={Shell.section_heading_lg()}>
          Fast to fork, easy to ship.
        </h2>
        <p class={Shell.lede()}>
          A coming-soon template you can rename, retheme, and deploy without rebuilding sections
          from scratch.
        </p>

        <ul class={"#{Shell.column_grid()} #{Shell.body_tight()}"}>
          <li :for={item <- scale_items()} class="min-w-0">
            <h3 class="text-base font-medium tracking-tight text-ink">{item.title}</h3>
            <p class="mt-3 text-sm/6 text-ink-muted sm:text-base/7">{item.body}</p>
          </li>
        </ul>

        <div class={"#{Shell.body_tight()} soonex-closing-band flex flex-col gap-6 p-6 sm:flex-row sm:items-center sm:justify-between sm:p-8"}>
          <p class="display m-0 text-pretty text-2xl font-medium tracking-tight text-ink sm:text-3xl">
            Want early access to Corex templates?
          </p>
          <.navigate to="#waitlist" class={"#{Shell.primary_button()} shrink-0"}>
            Yes, join waitlist
          </.navigate>
        </div>
      </div>
    </section>
    """
  end

  defp scale_items do
    [
      %{
        title: "Instant activation",
        body:
          "Run mix setup and mix server to preview the full landing, journal, and waitlist flow locally."
      },
      %{
        title: "Adaptable approach",
        body:
          "Use Soonex as a launch page, a client handoff, or the starting point for a Corex marketing site."
      },
      %{
        title: "Effortless integration",
        body:
          "Wire the waitlist form to your provider, swap copy in lib/pages/home, and publish _site/ to any static host."
      }
    ]
  end
end
