defmodule Soonex.Layouts.Shell do
  @moduledoc false

  # Marketing band used across Tailwind UI-style landings:
  # <section class="py-24 sm:py-32">
  #   <div class="mx-auto max-w-7xl px-6 lg:px-8">
  #     <div class="mx-auto max-w-2xl">heading</div>
  #     <div class="mt-16 sm:mt-20 lg:mt-24">content</div>
  #   </div>
  # </section>

  def section, do: "scroll-mt-24 w-full py-24 sm:py-32"

  def section_compact, do: "scroll-mt-24 w-full py-16 sm:py-20"

  def section_hero,
    do: "relative flex min-h-svh w-full flex-col justify-center overflow-x-clip py-16 sm:py-24"

  def stage, do: "mx-auto w-full max-w-[90rem] px-6 lg:px-8"

  def intro, do: "mx-auto max-w-2xl lg:mx-0"

  def intro_center, do: "mx-auto max-w-2xl lg:text-center"

  def body, do: "mx-auto mt-16 w-full sm:mt-20 lg:mt-24"

  def body_tight, do: "mx-auto mt-10 w-full sm:mt-12"

  # FAQ-style split: sticky intro column, content beside it.
  def sticky_grid,
    do: "grid grid-cols-1 items-start gap-16 lg:grid-cols-12 lg:gap-12"

  def sticky_intro,
    do: "mx-auto max-w-2xl lg:sticky lg:top-28 lg:col-span-5 lg:mx-0"

  def sticky_body, do: "w-full min-w-0 lg:col-span-7"

  def eyebrow, do: "m-0 text-base/7 font-semibold text-brand-text"

  def section_heading,
    do: "display mt-2 text-pretty text-4xl font-semibold tracking-tight text-ink sm:text-5xl"

  def page_heading,
    do: "display mt-2 text-pretty text-4xl font-semibold tracking-tight text-ink sm:text-5xl"

  def lede, do: "mt-6 max-w-2xl text-pretty text-lg/8 text-ink-muted"

  def panel,
    do: "soonex-frame relative overflow-hidden border border-border bg-surface"

  def frame, do: "soonex-frame relative overflow-hidden border border-border bg-surface"

  def data_list, do: "data-list data-list--wide ui-accent ui-size-md w-full max-w-none"
end
