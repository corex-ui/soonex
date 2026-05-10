defmodule Soonex.Public do
  @moduledoc false

  def path(path) when is_binary(path) do
    prefix = Application.get_env(:soonex, :public_path_prefix, "")

    root =
      case String.trim_leading(path, "/") do
        "" -> "/"
        rest -> "/" <> rest
      end

    case prefix do
      "" -> root
      pfx -> pfx <> root
    end
  end
end
