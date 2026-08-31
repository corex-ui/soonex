defmodule Soonex.Layouts.Shell do
  @moduledoc false

  # Named skeletons — not the Tailwind-UI eyebrow → h2 → card-grid band.
  # :bleed  full-bleed media (hero). Stage is overlay only.
  # :open   heading cluster, then type — no panels.
  # :editorial  heading + supporting column.
  # :sticky FAQ split.
  # :stack  last-resort marketing band.

  def section, do: "scroll-mt-24 w-full py-24 sm:py-32"

  def section_compact, do: "scroll-mt-24 w-full py-16 sm:py-20"

  def section_hero,
    do:
      "relative isolate flex min-h-svh w-full flex-col justify-end overflow-x-clip lg:justify-center"

  def stage, do: "mx-auto w-full max-w-[90rem] px-6 lg:px-8"

  def intro, do: "mx-auto max-w-3xl lg:mx-0"

  def intro_center, do: "mx-auto max-w-2xl lg:text-center"

  def body, do: "mx-auto mt-12 w-full sm:mt-16"

  def body_tight, do: "mx-auto mt-8 w-full sm:mt-10"

  def sticky_grid,
    do: "grid grid-cols-1 items-start gap-16 lg:grid-cols-12 lg:gap-12"

  def sticky_intro,
    do: "mx-auto max-w-2xl lg:sticky lg:top-28 lg:col-span-5 lg:mx-0"

  def sticky_body, do: "w-full min-w-0 lg:col-span-7"

  def editorial_grid,
    do: "grid grid-cols-1 items-start gap-12 lg:grid-cols-12 lg:gap-16"

  def editorial_intro, do: "mx-auto max-w-2xl lg:col-span-5 lg:mx-0"

  def editorial_body, do: "w-full min-w-0 lg:col-span-7"

  def eyebrow, do: "eyebrow m-0"

  def section_heading, do: "mt-2 text-pretty"

  def page_heading, do: "mt-2 text-pretty"

  def lede, do: "lede mt-6 max-w-2xl text-pretty"

  def card_title, do: "soonex-card-title mt-2"

  def panel,
    do: "soonex-frame relative overflow-hidden border border-border bg-surface"

  def frame, do: "soonex-frame relative overflow-hidden"

  def feature_list, do: "m-0 mt-6 flex list-none flex-col gap-3 p-0"

  def chip_row, do: "flex flex-wrap items-center gap-2"

  def lanes, do: "m-0 flex list-none flex-col gap-8 p-0"

  def log_list, do: "m-0 flex list-none flex-col divide-y divide-border p-0"

  def feature_bullets,
    do: "soonex-feature-bullets m-0 flex list-none flex-col gap-2 p-0"
end
