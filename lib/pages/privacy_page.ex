defmodule Soonex.PrivacyPage do
  @moduledoc false

  use Tableau.Page,
    layout: Soonex.RootLayout,
    permalink: "/privacy/",
    title: "Privacy",
    description:
      "How Soonex handles data on this demo site: local preferences, cookie consent, and what we do not collect.",
    page_kind: :privacy,
    sitemap: %{priority: 0.3, changefreq: "yearly"}

  use Phoenix.Component
  use Corex

  alias Soonex.Layouts.Shell

  def template(assigns) do
    ~H"""
    <article class={"#{Shell.section()} bg-root"}>
      <div class={Shell.stage()}>
        <.layout_heading class="layout-heading" subtitle_tag="p">
          <:title>Privacy</:title>
          <:subtitle>
            This page describes how the Soonex demo handles information on your device. It is not legal advice.
          </:subtitle>
          <:actions>
            <.navigate to={Soonex.Public.path("/")} class="button ui-ghost ui-size-sm">
              <.heroicon name="hero-arrow-left" /> Home
            </.navigate>
          </:actions>
        </.layout_heading>

        <div class="typo markdown prose mt-16 min-w-0 max-w-3xl text-base/7 text-ink-muted">
          <p class="text-sm text-ink-muted">
            Last updated: 1 September 2026
          </p>

          <h2>Who this applies to</h2>
          <p>
            Soonex is a static launch-page template published by Corex for demonstration and forking.
            When you browse the hosted demo or run it locally, the site behaves as described below.
            If you fork the template and deploy it under your own domain, you are responsible for updating
            this page and your consent banner to match your product and jurisdiction.
          </p>

          <h2>What we do not collect</h2>
          <p>
            The waitlist forms on the home page are wired for UX only. Submitting an email shows a success
            toast but does not send your address to a server, database, or third-party list provider.
            There is no account system, no payment flow, and no server-side session in this template.
          </p>

          <h2>Information stored on your device</h2>
          <p>
            To make the demo usable across visits, Soonex stores a small set of preferences in your browser
            using <code>localStorage</code>. These values stay on your device and are not transmitted to us.
          </p>
          <ul>
            <li>
              <strong>Theme and color mode</strong>
              — which Corex theme (neo, uno, duo, leo) and light or dark mode you selected.
            </li>
            <li>
              <strong>Accessibility settings</strong>
              — contrast, motion, and related choices from the accessibility panel.
            </li>
            <li>
              <strong>Cookie consent</strong>
              — whether you accepted, rejected, or customised analytics and marketing categories.
            </li>
          </ul>
          <p>
            You can clear these at any time through your browser settings or by removing site data for this origin.
            The cookie banner can be reopened from the footer to change your choices.
          </p>

          <h2>Cookie categories</h2>
          <p>
            The consent banner groups cookies into three categories. Only necessary storage is active by default.
          </p>
          <ul>
            <li>
              <strong>Necessary</strong>
              — required for theme, accessibility, and remembering your consent decision.
              These cannot be disabled without breaking the demo experience.
            </li>
            <li>
              <strong>Analytics</strong>
              — would cover measurement tags such as privacy-friendly analytics.
              This template does not load analytics scripts even if you allow the category.
            </li>
            <li>
              <strong>Marketing</strong> — would cover remarketing or social pixels.
              This template does not load marketing tags even if you allow the category.
            </li>
          </ul>

          <h2>Third parties</h2>
          <p>
            The static build may reference self-hosted fonts and images. It does not embed third-party trackers,
            social widgets, or hosted video players. If you add those integrations when forking the template,
            disclose them here and wire them through the consent module in <code>lib/soonex/cookie_consent.ex</code>.
          </p>

          <h2>Retention</h2>
          <p>
            Local preference data persists until you clear it or until the browser removes it under its own storage policies.
            Because nothing is sent to a backend in the demo, we do not hold copies of your choices on our servers.
          </p>

          <h2>Your rights</h2>
          <p>
            Depending on where you live, you may have rights to access, correct, or delete personal data.
            On this demo, the only data involved is what your browser stores locally; you control it directly.
            For a production deployment you operate, provide a contact path and process requests under your own policy.
          </p>

          <h2>Children</h2>
          <p>
            The Soonex demo is a developer-facing marketing template. It is not directed at children and does not
            knowingly collect information from anyone under 16.
          </p>

          <h2>Changes</h2>
          <p>
            We may update this page when the template changes—for example, if a fork adds real list collection or analytics.
            The “Last updated” date at the top will change when we do.
          </p>

          <h2>Contact</h2>
          <p>
            Questions about this demo policy can be sent to <a
              href="mailto:info@netoum.com"
              class="link ui-brand"
            >info@netoum.com</a>.
            For production sites you deploy, replace this address with your own.
          </p>
        </div>
      </div>
    </article>
    """
  end
end
