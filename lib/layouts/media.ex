defmodule Soonex.Layouts.Media do
  @moduledoc false

  use Phoenix.Component

  attr(:src, :string, required: true)
  attr(:alt, :string, required: true)
  attr(:class, :any, default: nil)
  attr(:width, :integer, default: nil)
  attr(:height, :integer, default: nil)
  attr(:loading, :string, default: "lazy")
  attr(:sizes, :string, default: nil)

  def photo(assigns) do
    ~H"""
    <img
      src={Soonex.Public.path(@src)}
      alt={@alt}
      class={["soonex-photo", @class]}
      width={@width}
      height={@height}
      loading={@loading}
      sizes={@sizes}
    />
    """
  end

  def credits do
    "Photographs under the Unsplash License. Tool marks from Simple Icons (CC0)."
  end
end
