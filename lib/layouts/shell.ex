defmodule Soonex.Layouts.Shell do
  @moduledoc false

  def section, do: "scroll-mt-24 w-full py-28 sm:py-36"

  def section_compact, do: "scroll-mt-24 w-full py-16 sm:py-20"

  def section_hero,
    do: "relative flex min-h-[88svh] w-full flex-col justify-end pb-16 pt-28 sm:pb-20 sm:pt-32"

  def stage, do: "mx-auto w-full max-w-6xl px-6 lg:px-8"

  def stage_wide, do: "mx-auto w-full max-w-7xl px-6 lg:px-8"

  def intro, do: "max-w-2xl lg:max-w-3xl"

  def intro_center, do: "mx-auto max-w-2xl text-center"

  def body, do: "mt-16 w-full sm:mt-20 lg:mt-24"

  def body_tight, do: "mt-10 w-full sm:mt-12"

  def sticky_grid, do: "grid grid-cols-1 items-start gap-16 lg:grid-cols-12 lg:gap-16"

  def sticky_intro, do: "max-w-xl lg:sticky lg:top-28 lg:col-span-5"

  def sticky_body, do: "w-full min-w-0 lg:col-span-7"

  def eyebrow,
    do: "soonex-eyebrow m-0 text-xs/6 font-medium tracking-wide text-ink-muted uppercase"

  def hero_heading,
    do:
      "display max-w-3xl text-pretty text-5xl font-medium tracking-tight text-ink lg:text-[3.5rem] lg:leading-[1.05]"

  def section_heading,
    do: "display mt-2 text-pretty text-2xl font-medium tracking-tight text-ink sm:text-3xl"

  def section_heading_lg,
    do:
      "display text-pretty text-3xl font-medium tracking-tight text-ink sm:text-4xl lg:max-w-2xl lg:text-[2.75rem] lg:leading-tight"

  def page_heading,
    do: "display mt-2 text-pretty text-2xl font-medium tracking-tight text-ink sm:text-3xl"

  def lede, do: "mt-4 max-w-xl text-pretty text-sm/6 text-ink-muted sm:text-base/7"

  def lede_wide, do: "mt-4 max-w-2xl text-pretty text-sm/6 text-ink-muted sm:text-base/7"

  def panel, do: "relative overflow-hidden rounded-2xl border border-border bg-surface p-6 sm:p-8"

  def panel_open,
    do: "relative overflow-visible rounded-2xl border border-border bg-surface p-6 sm:p-8"

  def frame, do: "relative overflow-hidden rounded-2xl border border-border bg-surface"

  def data_list, do: "data-list ui-accent ui-size-md w-full max-w-none"

  def primary_button, do: "button ui-accent ui-solid ui-size-sm"

  def column_grid, do: "soonex-columns grid grid-cols-1 gap-12 lg:grid-cols-3 lg:gap-0"
end
