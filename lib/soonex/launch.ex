defmodule Soonex.Launch do
  @moduledoc false

  @target ~U[2026-12-01 00:00:00Z]

  def target, do: @target

  def label, do: "1 December"

  def year_label, do: "1 December 2026"

  def countdown_ms do
    max(DateTime.diff(@target, DateTime.utc_now(), :millisecond), 0)
  end
end
