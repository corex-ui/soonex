defmodule Soonex.RootLayout do
  @moduledoc false

  import Phoenix.Controller, only: [get_csrf_token: 0]

  use Tableau.Layout
  use Phoenix.Component
  use Corex

  import Soonex.CookieConsent, only: [cookie_consent: 1]
  import Soonex.Layouts.Root.Demo, only: [demo_site_controls: 1]
  import Soonex.Layouts.Root.Footer, only: [site_footer: 1]
  import Soonex.Layouts.Root.Nav, only: [site_nav: 1]

  alias Phoenix.HTML
  alias Phoenix.HTML.Safe

  def template(assigns) do
    site_name = "Soonex"
    copyright_holder = "Soonex"

    tableau_config =
      case Tableau.Config.get() do
        {:ok, %Tableau.Config{} = c} -> c
        %Tableau.Config{} = c -> c
      end

    base_url =
      tableau_config.url
      |> to_string()
      |> String.trim_trailing("/")

    page_path = page_path_from_page(assigns.page)

    canonical_url =
      if assigns.page[:page_kind] == :home and page_path == "/" do
        base_url <> "/"
      else
        base_url <> page_path
      end

    og_image_url = base_url <> "/images/og.svg"

    assigns =
      assigns
      |> Map.put(:site_name, site_name)
      |> Map.put(:copyright_holder, copyright_holder)
      |> Map.put(:doc_title, document_title(assigns.page, site_name))
      |> Map.put(:doc_description, meta_description(assigns.page, site_name))
      |> Map.put(:default_theme, Soonex.Theme.default_theme())
      |> Map.put(:theme, Soonex.Theme.current(assigns))
      |> Map.put(:mode, Soonex.Mode.current(assigns))
      |> Map.put(:canonical_url, canonical_url)
      |> Map.put(:base_url, base_url)
      |> Map.put(:page_path, page_path)
      |> Map.put(:og_image_url, og_image_url)
      |> Map.put(:flash, Map.get(assigns, :flash, %{}))

    ~H"""
    <!DOCTYPE html>
    <html
      class="scroll-smooth motion-reduce:scroll-auto"
      lang="en"
      dir="ltr"
      data-theme={@theme}
      data-mode={@mode}
      data-themes={Enum.join(Soonex.Theme.themes(), ",")}
      data-default-theme={Soonex.Theme.default_theme()}
      {Soonex.Accessibility.data_attrs()}
    >
      <head>
        {Soonex.Theme.head_script()}
        {Soonex.Mode.head_script()}
        {Soonex.Accessibility.head_script()}
        {Soonex.CookieConsent.head_script()}
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta name="csrf-token" content={get_csrf_token()} />

        <link rel="icon" href={Soonex.Public.path("/images/logo.svg")} type="image/svg+xml" />
        <link rel="icon" href={Soonex.Public.path("/images/favicon.ico")} sizes="48x48" />
        <link
          rel="icon"
          type="image/png"
          sizes="32x32"
          href={Soonex.Public.path("/images/favicon-32x32.png")}
        />
        <link
          rel="icon"
          type="image/png"
          sizes="16x16"
          href={Soonex.Public.path("/images/favicon-16x16.png")}
        />
        <link
          rel="apple-touch-icon"
          sizes="180x180"
          href={Soonex.Public.path("/images/apple-touch-icon.png")}
        />
        <link
          rel="icon"
          type="image/png"
          sizes="192x192"
          href={Soonex.Public.path("/images/android-chrome-192x192.png")}
        />
        <link
          rel="icon"
          type="image/png"
          sizes="512x512"
          href={Soonex.Public.path("/images/android-chrome-512x512.png")}
        />
        <link rel="manifest" href={Soonex.Public.path("/site.webmanifest")} />

        <title>{@doc_title}</title>
        <meta name="description" content={@doc_description} />

        <link rel="canonical" href={@canonical_url} />

        <meta property="og:type" content="website" />
        <meta property="og:site_name" content={@site_name} />
        <meta property="og:title" content={@doc_title} />
        <meta property="og:description" content={@doc_description} />
        <meta property="og:url" content={@canonical_url} />
        <meta property="og:image" content={@og_image_url} />
        <meta property="og:image:alt" content={@doc_title} />
        <meta property="og:image:type" content="image/svg+xml" />
        <meta property="og:image:width" content="1200" />
        <meta property="og:image:height" content="630" />

        <meta name="twitter:card" content="summary_large_image" />
        <meta name="twitter:title" content={@doc_title} />
        <meta name="twitter:description" content={@doc_description} />
        <meta name="twitter:image" content={@og_image_url} />

        <link
          rel="preload"
          href={Soonex.Public.path("/fonts/manrope-latin-wght-normal.woff2")}
          as="font"
          type="font/woff2"
          crossorigin
        />
        <link
          rel="preload"
          href={Soonex.Public.path("/fonts/outfit-latin-wght-normal.woff2")}
          as="font"
          type="font/woff2"
          crossorigin
        />
        <link rel="stylesheet" href={Soonex.Public.path("/css/site.css")} />
        <script type="module" src={Soonex.Public.path("/js/site.js")} />
      </head>

      <body class="layout typo flex min-h-dvh min-w-0 flex-col overflow-x-clip bg-root text-ink antialiased">
        <.navigate to="#main-content" class="link link--skip">Skip to content</.navigate>

        <.demo_site_controls mode={@mode} />
        <.site_nav page_path={@page_path} />

        <main id="main-content" class="layout__main flex-1">
          {render(@inner_content)}
        </main>

        <.site_footer copyright_holder={@copyright_holder} />
        <.cookie_consent privacy_path={Soonex.Public.path("/privacy/")} />

        <.toast_group id="layout-toast" class="toast" phx-update="ignore" flash={@flash}>
          <:loading>
            <.heroicon name="hero-arrow-path" />
          </:loading>
        </.toast_group>
        <.toast_client_error
          toast_group_id="layout-toast"
          title="We lost the connection"
          description="We're trying to reconnect you..."
          type={:error}
          duration={:infinity}
        />

        <%= if Mix.env() == :dev do %>
          {HTML.raw(Tableau.live_reload(assigns))}
        <% end %>
      </body>
    </html>
    """
    |> Safe.to_iodata()
  end

  defp document_title(page, site_name) do
    cond do
      md_page?(page) and present_string?(page[:title]) ->
        page[:title]

      tag_page?(page) ->
        "#{page[:tag]} · Tags · #{site_name}"

      true ->
        kind_title(page[:page_kind], site_name)
    end
  end

  defp kind_title(:home, site_name), do: "#{site_name} · Launch #{Soonex.Launch.year_label()}"
  defp kind_title(:blog_index, site_name), do: "Journal · #{site_name}"
  defp kind_title(:not_found, site_name), do: "Page not found · #{site_name}"
  defp kind_title(:privacy, site_name), do: "Privacy · #{site_name}"
  defp kind_title(:tags_index, site_name), do: "Tags · #{site_name}"
  defp kind_title(_kind, site_name), do: site_name

  defp meta_description(page, site_name) do
    if tag_page?(page) do
      "Journal posts tagged #{page[:tag]} on #{site_name}."
    else
      kind_description(page[:page_kind], site_name) ||
        page_description(page) ||
        "Tableau + Corex coming-soon template with accessible Phoenix UI components."
    end
  end

  defp kind_description(:home, _site_name),
    do:
      "Tableau + Corex coming-soon template: accessible Phoenix UI, waitlist, journal, and config-driven design tokens."

  defp kind_description(:blog_index, site_name), do: "Shipping notes from #{site_name}."
  defp kind_description(:not_found, site_name), do: "That page is not on #{site_name}."

  defp kind_description(:privacy, _site_name),
    do:
      "Necessary preferences stay on this device. Analytics and marketing stay off unless you allow them."

  defp kind_description(:tags_index, site_name), do: "Browse journal tags on #{site_name}."
  defp kind_description(_kind, _site_name), do: nil

  defp page_description(page) do
    if present_string?(page[:description]), do: page[:description]
  end

  defp page_path_from_page(page) when is_map(page) do
    case page[:permalink] do
      perm when is_binary(perm) and perm != "" ->
        if String.starts_with?(perm, "/"), do: perm, else: "/" <> perm

      _ ->
        "/"
    end
  end

  defp page_path_from_page(_), do: "/"

  defp md_page?(page), do: page[:__tableau_page_extension__] == true

  defp tag_page?(page) do
    present_string?(page[:tag]) and Map.has_key?(page, :posts)
  end

  defp present_string?(v) when is_binary(v), do: String.trim(v) != ""
  defp present_string?(_), do: false
end
