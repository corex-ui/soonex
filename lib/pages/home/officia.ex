defmodule Soonex.HomePage.Officia do
  @moduledoc false

  use Phoenix.Component
  use Corex

  import Soonex.Layouts.Section, only: [block: 1]

  def officia(assigns) do
    ~H"""
    <.block
      id="officia"
      labelledby="soonex-officia-heading"
      eyebrow="Officia"
      tone={:surface}
      align={:center}
    >
      <:title>
        Tria <span class="text-brand-text">munera</span>
      </:title>
      <:lede>
        Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur.
      </:lede>
      <.tabs
        id="soonex-officia"
        class="tabs tabs--wide ui-brand ui-size-md mx-auto w-full max-w-none"
        indicator
        multiple={false}
        collapsible={false}
        value="scriptio"
        items={offices()}
      >
        <:trigger :let={item}>{item.label}</:trigger>
        <:content :let={item}>
          <div class="flex flex-col gap-6 text-start">
            <p class="display m-0 text-2xl font-semibold tracking-tight text-ink">
              {item.meta.headline}
            </p>
            <p class="m-0 max-w-2xl text-base/7 text-ink-muted">{item.content}</p>
            <.data_list
              orientation="horizontal"
              class="data-list data-list--wide ui-accent ui-size-sm w-full max-w-none"
              items={item.meta.points}
            />
          </div>
        </:content>
      </.tabs>
    </.block>
    """
  end

  defp offices do
    Corex.Content.new([
      %{
        value: "scriptio",
        label: "Scriptio",
        content:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        meta: %{
          headline: "Litterae et acta",
          points:
            Corex.Content.new([
              %{label: "Acta", content: "Sed ut perspiciatis unde omnis iste natus."},
              %{label: "Notae", content: "Nemo enim ipsam voluptatem quia voluptas."},
              %{label: "Index", content: "Neque porro quisquam est qui dolorem."}
            ])
        }
      },
      %{
        value: "oratio",
        label: "Oratio",
        content:
          "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
        meta: %{
          headline: "Voces in foro",
          points:
            Corex.Content.new([
              %{label: "Forum", content: "Duis aute irure dolor in reprehenderit."},
              %{label: "Chorus", content: "Excepteur sint occaecat cupidatat non."},
              %{label: "Echo", content: "Sunt in culpa qui officia deserunt mollit."}
            ])
        }
      },
      %{
        value: "numerus",
        label: "Numerus",
        content:
          "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
        meta: %{
          headline: "Rationes et numeri",
          points:
            Corex.Content.new([
              %{label: "Summa", content: "At vero eos et accusamus et iusto odio."},
              %{label: "Modus", content: "Et harum quidem rerum facilis est et."},
              %{label: "Finis", content: "Temporibus autem quibusdam et aut officiis."}
            ])
        }
      }
    ])
  end
end
