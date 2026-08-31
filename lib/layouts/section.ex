defmodule Soonex.Layouts.Section do
  @moduledoc false

  use Phoenix.Component

  alias Soonex.Layouts.Shell

  attr(:id, :string, required: true)
  attr(:labelledby, :string, required: true)
  attr(:eyebrow, :string, required: true)
  attr(:tone, :atom, default: :root)
  attr(:align, :atom, default: :start)
  attr(:layout, :atom, default: :open, values: [:bleed, :open, :editorial, :sticky, :stack])
  attr(:compact, :boolean, default: false)

  slot(:title, required: true)
  slot(:lede)
  slot(:actions)
  slot(:inner_block, required: true)

  def block(assigns) do
    ~H"""
    <section
      id={@id}
      class={"#{section_class(@layout, @compact)} #{tone_class(@tone)}"}
      aria-labelledby={@labelledby}
    >
      <div class={stage_class(@layout)}>
        <div class={intro_class(@layout, @align)}>
          <small class={Shell.eyebrow()}>{@eyebrow}</small>
          <h2 id={@labelledby} class={Shell.section_heading()}>
            {render_slot(@title)}
          </h2>
          <p :if={@lede != []} class={"#{Shell.lede()} #{lede_align(@layout, @align)}"}>
            {render_slot(@lede)}
          </p>
          <div
            :if={@actions != []}
            class={"mt-8 flex flex-wrap items-center gap-x-6 gap-y-4 #{actions_align(@layout, @align)}"}
          >
            {render_slot(@actions)}
          </div>
        </div>
        <div class={body_class(@layout, @compact)}>
          {render_slot(@inner_block)}
        </div>
      </div>
    </section>
    """
  end

  defp section_class(:bleed, _compact), do: "#{Shell.section_hero()} soonex-reveal"
  defp section_class(_layout, true), do: "#{Shell.section_compact()} soonex-reveal"
  defp section_class(_layout, false), do: "#{Shell.section()} soonex-reveal"

  defp tone_class(:root), do: "bg-root"
  defp tone_class(:surface), do: "border-y border-border bg-surface"
  defp tone_class(:ui), do: "border-y border-border bg-ui"
  defp tone_class(:clear), do: ""

  defp stage_class(:bleed), do: "#{Shell.stage()} relative z-[1]"
  defp stage_class(:sticky), do: "#{Shell.stage()} #{Shell.sticky_grid()}"
  defp stage_class(:editorial), do: "#{Shell.stage()} #{Shell.editorial_grid()}"
  defp stage_class(_layout), do: Shell.stage()

  defp intro_class(:sticky, _align), do: Shell.sticky_intro()
  defp intro_class(:editorial, _align), do: Shell.editorial_intro()
  defp intro_class(_layout, :center), do: Shell.intro_center()
  defp intro_class(_layout, :start), do: Shell.intro()

  defp lede_align(:stack, :center), do: "mx-auto"
  defp lede_align(_layout, _align), do: ""

  defp actions_align(:stack, :center), do: "justify-center"
  defp actions_align(_layout, :center), do: "justify-center"
  defp actions_align(_layout, _align), do: ""

  defp body_class(:sticky, _compact), do: Shell.sticky_body()
  defp body_class(:editorial, _compact), do: Shell.editorial_body()
  defp body_class(:open, _compact), do: Shell.body_tight()
  defp body_class(:bleed, _compact), do: Shell.body_tight()
  defp body_class(:stack, true), do: Shell.body_tight()
  defp body_class(:stack, false), do: Shell.body()
end
