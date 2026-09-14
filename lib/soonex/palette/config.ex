defmodule Soonex.Palette.Config do
  @moduledoc false

  @theme_order ~w(neo)

  def defaults do
    nl = neo_light()
    nd = neo_dark()

    %{
      "semantic_ratio_base" => %{
        "active" => 1.0,
        "default" => -1.15,
        "hover" => -1.08,
        "muted" => -1.8
      },
      "state_lightness_offsets" => %{
        "active" => -7,
        "default" => 0,
        "hover" => -4,
        "muted" => 3.5
      },
      "state_order" => ["muted", "default", "hover", "active"],
      "themes" => %{
        "neo-light" => nl,
        "neo-dark" => nd
      },
      "ui_ratio_base" => %{"default" => -1.12, "hover" => -1.08, "muted" => -1.2}
    }
  end

  defp neo_seeds do
    %{
      "accent" => "#141414",
      "alert" => "#B42318",
      "base" => "#FAF9F6",
      "brand" => "#141414",
      "info" => "#0E7490",
      "success" => "#15803D"
    }
  end

  defp neo_light do
    %{
      "seeds" => neo_seeds(),
      "ink" => %{
        "accent" => %{"color" => "accent", "ratio" => 6},
        "alert" => %{"color" => "alert", "ratio" => 6},
        "brand" => %{"color" => "brand", "ratio" => 6},
        "default" => %{"color" => "base", "ratio" => 8},
        "info" => %{"color" => "info", "ratio" => 6},
        "link" => %{"color" => "info", "ratio" => 6},
        "muted" => %{"color" => "base", "ratio" => 5},
        "success" => %{"color" => "success", "ratio" => 6}
      },
      "output" => "tokens/themes/neo/color/light.json",
      "semantic" => %{
        "accent" => %{
          "bg" => "accent",
          "ink" => %{"color" => "base", "ratio" => 7},
          "lightness" => 40
        },
        "alert" => %{
          "bg" => "alert",
          "ink" => %{"color" => "base", "ratio" => 7},
          "lightness" => 40
        },
        "brand" => %{
          "bg" => "brand",
          "ink" => %{"color" => "base", "ratio" => 7},
          "lightness" => 40
        },
        "info" => %{
          "bg" => "info",
          "ink" => %{"color" => "base", "ratio" => 7},
          "lightness" => 40
        },
        "selected" => %{
          "bg" => "base",
          "ink" => %{"color" => "base", "ratio" => 7},
          "lightness" => 85
        },
        "success" => %{
          "bg" => "success",
          "ink" => %{"color" => "base", "ratio" => 7},
          "lightness" => 40
        }
      },
      "surface" => %{
        "layer" => %{"color" => "base", "lightness" => 97},
        "root" => %{"color" => "base", "lightness" => 98},
        "ui" => %{"color" => "base", "lightness" => 94, "states" => true}
      },
      "utility" => %{
        "border" => %{"color" => "base", "ratio" => 1.3},
        "shadow" => %{"color" => "base", "ratio" => 1.05}
      }
    }
  end

  defp neo_dark do
    %{
      "seeds" => neo_seeds(),
      "ink" => %{
        "accent" => %{"color" => "accent", "ratio" => 7},
        "alert" => %{"color" => "alert", "ratio" => 7},
        "brand" => %{"color" => "brand", "ratio" => 7},
        "default" => %{"color" => "base", "ratio" => 12},
        "info" => %{"color" => "info", "ratio" => 7},
        "link" => %{"color" => "info", "ratio" => 7},
        "muted" => %{"color" => "base", "ratio" => 5},
        "success" => %{"color" => "success", "ratio" => 7}
      },
      "output" => "tokens/themes/neo/color/dark.json",
      "semantic" => %{
        "accent" => %{
          "bg" => "accent",
          "ink" => %{"color" => "base", "ratio" => 7},
          "lightness" => 45
        },
        "alert" => %{
          "bg" => "alert",
          "ink" => %{"color" => "base", "ratio" => 7},
          "lightness" => 38
        },
        "brand" => %{
          "bg" => "brand",
          "ink" => %{"color" => "base", "ratio" => 7},
          "lightness" => 38
        },
        "info" => %{
          "bg" => "info",
          "ink" => %{"color" => "base", "ratio" => 7},
          "lightness" => 38
        },
        "selected" => %{
          "bg" => "base",
          "ink" => %{"color" => "base", "ratio" => 7},
          "lightness" => 30
        },
        "success" => %{
          "bg" => "success",
          "ink" => %{"color" => "base", "ratio" => 7},
          "lightness" => 38
        }
      },
      "surface" => %{
        "layer" => %{"color" => "base", "lightness" => 15},
        "root" => %{"color" => "base", "lightness" => 8},
        "ui" => %{"color" => "base", "lightness" => 20, "states" => true}
      },
      "utility" => %{
        "border" => %{"color" => "base", "ratio" => 1.4},
        "shadow" => %{"color" => "base", "ratio" => 1.2}
      }
    }
  end

  def merge_overrides(base, overrides), do: deep_merge(base, overrides)

  defp deep_merge(a, b) do
    Map.merge(a, b, fn _, va, vb ->
      if is_map(va) and is_map(vb), do: deep_merge(va, vb), else: vb
    end)
  end

  def theme_slug(theme_mode_id) do
    case Regex.run(~r/^(.+)-(light|dark)$/, theme_mode_id) do
      [_, slug, _] -> slug
      _ -> theme_mode_id
    end
  end

  def theme_slugs(config) do
    have = for {k, _} <- config["themes"], into: MapSet.new(), do: theme_slug(k)
    Enum.filter(@theme_order, &MapSet.member?(have, &1))
  end
end
