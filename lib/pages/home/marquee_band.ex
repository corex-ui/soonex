defmodule Soonex.HomePage.MarqueeBand do
  @moduledoc false

  use Phoenix.Component
  use Corex

  def marquee_band(assigns) do
    ~H"""
    <section
      class="soonex-marquee-band border-y border-border bg-surface py-5"
      aria-label="Launch signals"
    >
      <.marquee
        id="soonex-proof-marquee"
        class="marquee ui-brand soonex-proof-marquee"
        items={items()}
        duration={28}
        spacing="3rem"
        pause_on_interaction
        aria_label="Soonex launch signals"
      >
        <:item :let={item}>
          <span class="soonex-marquee-chip">
            <span class="soonex-marquee-dot" aria-hidden="true"></span>
            {item.label}
          </span>
        </:item>
      </.marquee>
    </section>
    """
  end

  defp items do
    [
      %{label: "Waitlist that converts"},
      %{label: "Public shipping log"},
      %{label: "Countdown to 1 September"},
      %{label: "neo · uno · duo · leo"},
      %{label: "240 studios on the list"},
      %{label: "Accessible by default"},
      %{label: "Clone · mix setup · ship"}
    ]
  end
end
