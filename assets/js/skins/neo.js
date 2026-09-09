export function activate() {
  const root = document.documentElement
  root.setAttribute("data-skin-ready", "neo")
  return () => {
    if (root.getAttribute("data-skin-ready") === "neo") {
      root.removeAttribute("data-skin-ready")
    }
  }
}
