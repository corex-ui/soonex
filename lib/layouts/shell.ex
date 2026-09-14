defmodule Soonex.Layouts.Shell do
  @moduledoc false

  def section, do: "scroll-mt-24 w-full py-24 sm:py-32"

  def section_compact, do: "scroll-mt-24 w-full py-16 sm:py-20"

  def section_hero,
    do: "relative flex min-h-[80svh] w-full flex-col justify-center py-20 sm:py-28"

  def stage, do: "mx-auto w-full max-w-6xl px-6 lg:px-8"

  def intro, do: "mx-auto max-w-2xl lg:mx-0"

  def intro_center, do: "mx-auto max-w-2xl text-center"

  def body, do: "mx-auto mt-16 w-full sm:mt-20 lg:mt-24"

  def body_tight, do: "mx-auto mt-10 w-full sm:mt-12"

  def sticky_grid, do: "grid grid-cols-1 items-start gap-16 lg:grid-cols-12 lg:gap-12"

  def sticky_intro, do: "mx-auto max-w-2xl lg:sticky lg:top-28 lg:col-span-5 lg:mx-0"

  def sticky_body, do: "w-full min-w-0 lg:col-span-7"

  def eyebrow,
    do: "soonex-eyebrow m-0 text-sm/6 font-semibold tracking-wide text-brand-text uppercase"

  def section_heading,
    do: "display mt-3 text-pretty text-4xl font-semibold tracking-tight text-ink sm:text-5xl"

  def page_heading,
    do: "display mt-3 text-pretty text-4xl font-semibold tracking-tight text-ink sm:text-5xl"

  def lede, do: "mt-5 max-w-2xl text-pretty text-lg/8 text-ink-muted"

  def panel, do: "relative overflow-hidden rounded-2xl border border-border bg-surface p-6 sm:p-8"

  def panel_open,
    do: "relative overflow-visible rounded-2xl border border-border bg-surface p-6 sm:p-8"

  def frame, do: "relative overflow-hidden rounded-2xl border border-border bg-surface"

  def data_list, do: "data-list ui-accent ui-size-md w-full max-w-none"
end
