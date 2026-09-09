defmodule Soonex.Layouts.Shell do
  @moduledoc false

  # Shared marketing band (Salient-width). Skins override density via
  # .soonex-section / .soonex-hero / .soonex-stage on [data-theme].

  def section, do: "soonex-section scroll-mt-24 w-full py-24 sm:py-32"

  def section_compact,
    do: "soonex-section soonex-section--compact scroll-mt-24 w-full py-16 sm:py-20"

  def section_hero,
    do:
      "soonex-hero relative flex min-h-svh w-full flex-col justify-center overflow-x-clip py-16 sm:py-24"

  def stage, do: "soonex-stage mx-auto w-full max-w-7xl px-6 lg:px-8"

  def intro, do: "soonex-intro mx-auto max-w-2xl lg:mx-0"

  def intro_center, do: "soonex-intro soonex-intro--center mx-auto max-w-2xl lg:text-center"

  def body, do: "soonex-body mx-auto mt-16 w-full sm:mt-20 lg:mt-24"

  def body_tight, do: "soonex-body soonex-body--tight mx-auto mt-10 w-full sm:mt-12"

  def sticky_grid,
    do: "soonex-sticky-grid grid grid-cols-1 items-start gap-16 lg:grid-cols-12 lg:gap-12"

  def sticky_intro,
    do: "soonex-sticky-intro mx-auto max-w-2xl lg:sticky lg:top-28 lg:col-span-5 lg:mx-0"

  def sticky_body, do: "soonex-sticky-body w-full min-w-0 lg:col-span-7"

  def eyebrow, do: "soonex-eyebrow m-0 text-base/7 font-semibold text-brand-text"

  def section_heading,
    do:
      "soonex-section-heading display mt-2 text-pretty text-4xl font-semibold tracking-tight text-ink sm:text-5xl"

  def page_heading,
    do:
      "soonex-page-heading display mt-2 text-pretty text-4xl font-semibold tracking-tight text-ink sm:text-5xl"

  def lede, do: "soonex-lede mt-6 max-w-2xl text-pretty text-lg/8 text-ink-muted"

  def panel,
    do: "soonex-panel soonex-frame relative overflow-hidden border border-border bg-surface"

  def panel_open,
    do: "soonex-panel soonex-frame relative overflow-visible border border-border bg-surface"

  def frame, do: "soonex-frame relative overflow-hidden border border-border bg-surface"

  def data_list, do: "data-list data-list--wide ui-accent ui-size-md w-full max-w-none"
end
