const stickyRevealPx = 96

export function scrollProgress01() {
  const doc = document.documentElement
  const maxScroll = Math.max(1, doc.scrollHeight - window.innerHeight)
  return Math.min(1, Math.max(0, window.scrollY / maxScroll))
}

export function bindLandingScrollChrome(stickyBar, heroBoundary, progressFill) {
  const stickyEl = stickyBar instanceof HTMLElement ? stickyBar : null
  const boundaryEl = heroBoundary instanceof HTMLElement ? heroBoundary : null
  const progressOk = progressFill instanceof HTMLElement

  if (!stickyEl && !progressOk) {
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
    return window.scrollY > stickyRevealPx
  }

  const tick = () => {
    if (!alive) {
      return
    }
    if (stickyEl) {
      const show = pastReveal()
      stickyEl.toggleAttribute("data-shown", show)
      stickyEl.toggleAttribute("aria-hidden", !show)
      stickyEl.toggleAttribute("inert", !show)
    }
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
