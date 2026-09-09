export function activate() {
  const root = document.documentElement
  root.setAttribute("data-skin-ready", "duo")
  return () => {
    if (root.getAttribute("data-skin-ready") === "duo") {
      root.removeAttribute("data-skin-ready")
    }
  }
}
