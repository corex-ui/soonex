defmodule Soonex.HomePage.Steps do
  @moduledoc false

  use Phoenix.Component
  use Corex

  import Soonex.Layouts.Section, only: [block: 1]

  def steps(assigns) do
    ~H"""
    <.block
      id="steps"
      section="steps"
      labelledby="soonex-steps-heading"
      eyebrow="How it works"
      tone={:root}
    >
      <:title>
        Up and running in <span class="soonex-accent">three commands.</span>
      </:title>
      <:lede>
        No npm project. Mix, Tailwind, and esbuild are already in the repo. Clone, set up, and serve.
      </:lede>
      <ol class="soonex-steps m-0 grid list-none grid-cols-1 gap-8 p-0 lg:grid-cols-3">
        <li :for={step <- step_items()} class="soonex-step flex flex-col">
          <p class="soonex-step-index display m-0 text-sm font-semibold tracking-wide text-brand-text">
            {step.index}
          </p>
          <h3 class="display mt-3 text-xl font-semibold tracking-tight text-ink">{step.title}</h3>
          <p class="mt-3 flex-auto text-sm/6 text-ink-muted sm:text-base/7">{step.body}</p>
          <.clipboard
            id={step.clip_id}
            class="clipboard ui-brand ui-solid ui-width-fit ui-size-sm mt-6 self-start"
            value={step.command}
          >
            <:label class="sr-only">{step.title}</:label>
            <:copy>
              <.heroicon name="hero-clipboard" />
              <span>Copy</span>
            </:copy>
            <:copied>
              <.heroicon name="hero-check" />
              <span>Copied</span>
            </:copied>
          </.clipboard>
        </li>
      </ol>
    </.block>
    """
  end

  defp step_items do
    [
      %{
        index: "01",
        clip_id: "soonex-step-clone",
        title: "Clone the template",
        body:
          "Grab the repo. Photography, copy, and the launch date are the first things you replace.",
        command: "git clone https://github.com/corex-ui/soonex.git"
      },
      %{
        index: "02",
        clip_id: "soonex-step-setup",
        title: "mix setup",
        body:
          "Fetches Hex deps and builds Corex design CSS from config. Fonts are already self-hosted.",
        command: "mix setup"
      },
      %{
        index: "03",
        clip_id: "soonex-step-server",
        title: "mix server",
        body:
          "Serves the site on localhost:4999. Template Options in the corner switches theme and mode.",
        command: "mix server"
      }
    ]
  end
end
