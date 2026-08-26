import { bindLandingScrollChrome } from "./landing-scroll-chrome.js"

export function initLanding() {
  const root = document.querySelector("[data-landing]")
  if (!(root instanceof HTMLElement)) {
    return () => {}
  }

  const stickyBar = document.querySelector("[data-sticky-bar]")
  const heroBoundary =
    root.querySelector("[data-hero-sentinel]") ||
    root.querySelector("[data-hero-boundary]") ||
    root.querySelector("[data-hero]")
  const progressFill = document.querySelector("[data-scroll-progress-fill]")

  const teardown = bindLandingScrollChrome(stickyBar, heroBoundary, progressFill)

  window.addEventListener("pagehide", teardown, { once: true })

  return teardown
}
