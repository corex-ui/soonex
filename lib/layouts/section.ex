defmodule Soonex.Layouts.Section do
  @moduledoc false

  use Phoenix.Component

  alias Soonex.Layouts.Shell

  attr(:id, :string, required: true)
  attr(:labelledby, :string, required: true)
  attr(:eyebrow, :string, required: true)
  attr(:tone, :atom, default: :root)
  attr(:align, :atom, default: :start)
  attr(:compact, :boolean, default: false)

  slot(:title, required: true)
  slot(:lede)
  slot(:actions)
  slot(:inner_block, required: true)

  def block(assigns) do
    ~H"""
    <section
      id={@id}
      class={"#{section_class(@compact)} #{tone_class(@tone)}"}
      aria-labelledby={@labelledby}
    >
      <div class={Shell.stage()}>
        <div class={intro_class(@align)}>
          <p class={Shell.eyebrow()}>{@eyebrow}</p>
          <h2 id={@labelledby} class={Shell.section_heading()}>
            {render_slot(@title)}
          </h2>
          <p :if={@lede != []} class={"#{Shell.lede()} #{lede_align(@align)}"}>
            {render_slot(@lede)}
          </p>
          <div
            :if={@actions != []}
            class={"mt-8 flex flex-wrap items-center gap-x-6 gap-y-4 #{actions_align(@align)}"}
          >
            {render_slot(@actions)}
          </div>
        </div>
        <div class={body_class(@compact)}>
          {render_slot(@inner_block)}
        </div>
      </div>
    </section>
    """
  end

  defp section_class(true), do: Shell.section_compact()
  defp section_class(false), do: Shell.section()

  defp tone_class(:root), do: "bg-root"
  defp tone_class(:surface), do: "border-y border-border bg-surface"

  defp intro_class(:start), do: Shell.intro()
  defp intro_class(:center), do: Shell.intro_center()

  defp lede_align(:center), do: "mx-auto"
  defp lede_align(:start), do: ""

  defp actions_align(:center), do: "justify-center"
  defp actions_align(:start), do: ""

  defp body_class(true), do: Shell.body_tight()
  defp body_class(false), do: Shell.body()
end
