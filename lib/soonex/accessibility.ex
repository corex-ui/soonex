defmodule Soonex.Accessibility do
  @moduledoc false

  use Phoenix.Component
  use Corex

  alias Corex.Design.Accessibility

  def head_script do
    Phoenix.HTML.raw("""
    <script>
      (() => {
        const a11yAxes = #{Jason.encode!(Enum.map(Accessibility.axes(), &Atom.to_string/1))};
        const a11yDefaults = #{Jason.encode!(Accessibility.defaults())};
        const a11yValues = #{Jason.encode!(Map.new(Accessibility.axes(), fn axis -> {Atom.to_string(axis), Accessibility.values(axis)} end))};

        const readA11y = () => {
          const raw = localStorage.getItem("phx:a11y") || "";
          const parsed = Object.fromEntries(new URLSearchParams(raw).entries());
          const next = { ...a11yDefaults };
          for (const axis of a11yAxes) {
            const value = parsed[axis];
            if (value && (a11yValues[axis] || []).includes(value)) next[axis] = value;
          }
          return next;
        };

        const writeA11y = (state) => {
          const params = new URLSearchParams();
          for (const axis of a11yAxes) params.set(axis, state[axis]);
          const encoded = params.toString();
          localStorage.setItem("phx:a11y", encoded);
          for (const axis of a11yAxes) {
            document.documentElement.setAttribute("data-" + axis, state[axis]);
          }
        };

        const syncA11yControls = (state) => {
          for (const axis of a11yAxes) {
            const el = document.getElementById("a11y-" + axis);
            if (!el) continue;
            el.dispatchEvent(
              new CustomEvent("corex:toggle-group:set-value", {
                bubbles: false,
                detail: { value: [state[axis]] },
              })
            );
          }
        };

        if (a11yAxes.length) {
          const initial = readA11y();
          writeA11y(initial);
          const controlReady = (axis) => {
            const el = document.getElementById("a11y-" + axis);
            return el && !el.hasAttribute("data-loading");
          };
          const syncWhenReady = () => {
            if (a11yAxes.every(controlReady)) {
              syncA11yControls(initial);
              return true;
            }
            return false;
          };
          if (!syncWhenReady()) {
            const observer = new MutationObserver(() => {
              if (syncWhenReady()) observer.disconnect();
            });
            observer.observe(document.documentElement, {
              childList: true,
              subtree: true,
              attributes: true,
              attributeFilter: ["data-loading"],
            });
          }

          window.addEventListener("storage", (e) => {
            if (e.key === "phx:a11y" && e.newValue != null) {
              const state = readA11y();
              writeA11y(state);
              syncA11yControls(state);
            }
          });

          for (const axis of a11yAxes) {
            window.addEventListener("phx:set-a11y-" + axis, (e) => {
              const value = e.detail?.value;
              const next = Array.isArray(value) && value[0] ? value[0] : a11yDefaults[axis];
              if (!(a11yValues[axis] || []).includes(next)) return;
              writeA11y({ ...readA11y(), [axis]: next });
            });
          }

          window.addEventListener("phx:set-a11y-reset", () => {
            const state = { ...a11yDefaults };
            writeA11y(state);
            syncA11yControls(state);
          });
        }
      })();
    </script>
    """)
  end

  def data_attrs do
    Accessibility.defaults()
    |> Accessibility.sanitize()
    |> Map.new(fn {key, value} -> {"data-#{key}", value} end)
  end

  def accessibility_dialog_id, do: "a11y-dialog"

  attr(:trigger_class, :string, default: "button ui-size-sm")

  def accessibility_panel(assigns) do
    assigns = assign(assigns, :axes, Accessibility.axes())

    ~H"""
    <.dialog
      :if={@axes != []}
      id={accessibility_dialog_id()}
      class="dialog ui-rounded-xl"
      modal
      prevent_scroll
      animation="instant"
      final_focus={"dialog:#{accessibility_dialog_id()}:trigger"}
    >
      <:trigger class={@trigger_class} aria_label="Accessibility">
        <.heroicon name="hero-user-circle" /> Accessibility
      </:trigger>
      <:title>Accessibility</:title>
      <:description>
        Preferences for this device. See the <.navigate
          class="link ui-size-sm"
          to="https://hexdocs.pm/corex/accessibility.html"
          external
        >
          Corex accessibility guide <.heroicon name="hero-arrow-top-right-on-square" />
        </.navigate>.
      </:description>
      <:close_trigger>
        <.heroicon name="hero-x-mark" />
      </:close_trigger>
      <:content>
        <div class="flex w-full flex-col gap-space">
          <div class="grid w-full grid-cols-2 gap-space">
            <div :for={axis <- @axes} class="flex min-w-0 flex-col gap-space-sm">
              <.toggle_group
                id={"a11y-#{axis}"}
                class="toggle-group ui-size-sm ui-width-full"
                multiple={false}
                deselectable={false}
                value={[]}
                on_value_change_client={"phx:set-a11y-#{axis}"}
              >
                <:label>{axis_label(axis)}</:label>
                <:item :for={value <- Accessibility.values(axis)} value={value}>
                  {value_label(axis, value)}
                </:item>
              </.toggle_group>
            </div>
          </div>

          <.action
            type="button"
            class="button ui-ghost ui-alert ui-size-sm ui-width-fit"
            onclick="window.dispatchEvent(new CustomEvent('phx:set-a11y-reset'))"
          >
            Reset
          </.action>
        </div>
      </:content>
    </.dialog>
    """
  end

  defp axis_label(:text), do: "Zoom"
  defp axis_label(:contrast), do: "Contrast"
  defp axis_label(:motion), do: "Motion"
  defp axis_label(:cursor), do: "Cursor"
  defp axis_label(:focus), do: "Focus"
  defp axis_label(:links), do: "Links"
  defp axis_label(axis), do: axis |> Atom.to_string() |> String.capitalize()

  defp value_label(:text, "md"), do: "Default"
  defp value_label(:text, "lg"), do: "Larger"
  defp value_label(:contrast, "normal"), do: "Standard"
  defp value_label(:contrast, "more"), do: "High"
  defp value_label(:motion, "system"), do: "Full"
  defp value_label(:motion, "reduce"), do: "Reduced"
  defp value_label(:cursor, "normal"), do: "Default"
  defp value_label(:cursor, "large"), do: "Large"
  defp value_label(:focus, "normal"), do: "Default"
  defp value_label(:focus, "strong"), do: "Strong"
  defp value_label(:links, "normal"), do: "Default"
  defp value_label(:links, "underline"), do: "Underline"
  defp value_label(_axis, value), do: String.capitalize(value)
end
