import { bindLandingScrollChrome } from "./landing-scroll-chrome.js"

export function initLanding() {
  const root = document.querySelector("[data-landing]")
  if (!(root instanceof HTMLElement)) {
    return () => {}
  }

  const header = document.querySelector("[data-site-header]")
  const countdown = document.querySelector("[data-header-countdown]")
  const heroBoundary =
    root.querySelector("[data-hero-sentinel]") ||
    root.querySelector("[data-hero-boundary]") ||
    root.querySelector("[data-hero]")
  const progressFill = document.querySelector("[data-scroll-progress-fill]")

  const teardown = bindLandingScrollChrome(header, countdown, heroBoundary, progressFill)

  window.addEventListener("pagehide", teardown, { once: true })

  return teardown
}
