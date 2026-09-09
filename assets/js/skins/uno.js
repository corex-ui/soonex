export function activate() {
  const root = document.documentElement
  root.setAttribute("data-skin-ready", "uno")
  return () => {
    if (root.getAttribute("data-skin-ready") === "uno") {
      root.removeAttribute("data-skin-ready")
    }
  }
}
