const stickyRevealPx = 96
const condensedPx = 8

export function scrollProgress01() {
  const doc = document.documentElement
  const maxScroll = Math.max(1, doc.scrollHeight - window.innerHeight)
  return Math.min(1, Math.max(0, window.scrollY / maxScroll))
}

function motionReduce() {
  return document.documentElement.getAttribute("data-motion") === "reduce"
}

export function bindLandingScrollChrome(header, countdown, heroBoundary, progressFill) {
  const headerEl = header instanceof HTMLElement ? header : null
  const countdownEl = countdown instanceof HTMLElement ? countdown : null
  const boundaryEl = heroBoundary instanceof HTMLElement ? heroBoundary : null
  const progressOk = progressFill instanceof HTMLElement

  if (!headerEl && !countdownEl && !progressOk) {
    return () => {}
  }

  let alive = true
  let rafId = null

  const pastReveal = () => {
    if (boundaryEl) {
      const r = boundaryEl.getBoundingClientRect()
      return boundaryEl.hasAttribute("data-hero-sentinel")
        ? r.top <= stickyRevealPx
        : r.bottom <= stickyRevealPx
    }
    return true
  }

  const showCountdown = (show) => {
    if (!countdownEl) {
      return
    }
    countdownEl.toggleAttribute("data-shown", show)
    countdownEl.toggleAttribute("aria-hidden", !show)
    countdownEl.toggleAttribute("inert", !show)
    countdownEl.hidden = !show
  }

  const tick = () => {
    if (!alive) {
      return
    }
    if (headerEl) {
      headerEl.toggleAttribute("data-condensed", window.scrollY > condensedPx)
      if (motionReduce()) {
        headerEl.style.transition = "none"
      }
    }
    showCountdown(pastReveal())
    if (progressOk) {
      const p = scrollProgress01()
      progressFill.style.transform = `scaleX(${p})`
      progressFill.style.transformOrigin = "left center"
    }
    rafId = requestAnimationFrame(tick)
  }

  rafId = requestAnimationFrame(tick)

  return () => {
    alive = false
    if (rafId != null) {
      cancelAnimationFrame(rafId)
    }
  }
}
