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
      class={["block size-full object-cover", @class]}
      width={@width}
      height={@height}
      loading={@loading}
      decoding="async"
      sizes={@sizes}
    />
    """
  end

  def credits do
    "Photography from Unsplash (Unsplash License). Tool marks from Simple Icons (CC0) and the Tableau project."
  end
end
