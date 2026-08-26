defmodule Soonex.Layouts.Shell do
  @moduledoc false

  def stage, do: "mx-auto w-full max-w-7xl px-space-md lg:px-space-xl"

  def section,
    do:
      "scroll-mt-[calc(var(--spacing-size-lg)+var(--spacing-space))] flex w-full flex-col py-size-md sm:py-size-lg lg:py-size-xl"

  def section_hero,
    do:
      "relative flex min-h-svh w-full flex-col justify-center overflow-x-clip py-size-lg sm:py-size-xl"

  def stack, do: "flex flex-col gap-size-xl"

  def lede, do: "m-0 max-w-2xl text-pretty text-lg text-ink-muted"

  def section_heading,
    do: "display m-0 text-balance text-3xl tracking-tighter text-ink sm:text-4xl lg:text-5xl"

  def eyebrow,
    do: "m-0 text-xs font-medium uppercase tracking-[0.16em] text-brand-text"

  def paper,
    do: "relative border border-border bg-surface shadow-[4px_4px_0_0_var(--color-ink)]"

  def listing_row,
    do:
      "grid gap-space-md border-t border-border py-space-xl last:border-b md:grid-cols-[auto_minmax(0,1fr)_auto] md:items-start md:gap-space-xl"
end
