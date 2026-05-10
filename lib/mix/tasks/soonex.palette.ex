defmodule Mix.Tasks.Soonex.Palette do
  @moduledoc false

  use Mix.Task

  alias Soonex.Palette
  alias Soonex.Palette.Config

  @shortdoc "Generate theme color JSON from Soonex.Palette.Config"

  @impl Mix.Task
  def run(_args) do
    Mix.Task.run("compile")
    root = File.cwd!()
    design = Path.join(root, "assets/corex/design")
    cfg = Config.defaults()

    File.write!(
      Path.join(design, "palette_config.json"),
      Jason.encode!(cfg, pretty: true) <> "\n"
    )

    Palette.run(design_dir: design, config: cfg)
  end
end
