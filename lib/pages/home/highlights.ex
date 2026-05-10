defmodule Soonex.HomePage.Highlights do
  @moduledoc false

  use Phoenix.Component
  use Corex

  def highlights(assigns) do
    ~H"""
    <section
      id="highlights"
      class="relative flex min-h-dvh flex-col justify-center border-y border-border bg-root px-space py-size-xl"
      aria-labelledby="soonex-highlights-heading"
      data-reveal
    >
      <div class="mx-auto flex w-full max-w-6xl flex-col gap-size">
        <div class="layout__section-intro gap-space-lg pb-space-lg">
          <h2 id="soonex-highlights-heading" class="text-ink-brand">
            Elixir from palette to page.
          </h2>
          <p>
            Palette, Corex, and Tailwind v4 read the same tokens. Scripts bundle from one app. Tableau ships static HTML built from HEEx you would use with LiveView, compiled ahead of deploy.
          </p>
        </div>

        <.marquee
          id="soonex-marquee"
          class="marquee marquee--accent max-w-none"
          duration={28}
          spacing="2.5rem"
          pause_on_interaction={false}
          items={[
            %{label: "Tableau static"},
            %{label: "Tableau dev server"},
            %{label: "Palette and assets"},
            %{label: "Design tokens"},
            %{label: "Tailwind v4"},
            %{label: "Corex MCP"},
            %{label: "Markdown posts"},
            %{label: "English-first HEEx"}
          ]}
        >
          <:item :let={item}>
            <span class="text-2xl font-semibold tracking-tight text-ink">{item.label}</span>
            <span class="text-ink-muted" aria-hidden="true">·</span>
          </:item>
        </.marquee>

        <ul class="m-0 grid list-none gap-space p-0 lg:grid-cols-3" data-stagger>
          <%= for card <- [
                 %{
                   title: "Static build, Elixir-native",
                   body:
                     "Author in HEEx and Markdown under Tableau. Output is plain HTML, CSS, and ESM. Host on GitHub Pages, S3, or any CDN without a Node runtime on the edge."
                 },
                 %{
                   title: "Design pipeline in one app",
                   body:
                     "Palette JSON feeds Designex and Corex component CSS. Tailwind v4 reads the same tokens so utilities and components stay aligned without hand-synced spreadsheets."
                 },
                 %{
                   title: "MCP-aware components",
                   body:
                     "Corex exposes a component registry and MCP tools in development so assistants resolve slots, modifiers, and anatomy instead of guessing markup."
                 }
               ] do %>
            <li class="min-w-0 rounded-xl border border-border bg-layer p-space-lg">
              <h3>{card.title}</h3>
              <p>{card.body}</p>
            </li>
          <% end %>
        </ul>
      </div>
    </section>
    """
  end
end
