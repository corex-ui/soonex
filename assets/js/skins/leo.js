export function activate() {
  const root = document.documentElement
  root.setAttribute("data-skin-ready", "leo")
  return () => {
    if (root.getAttribute("data-skin-ready") === "leo") {
      root.removeAttribute("data-skin-ready")
    }
  }
}
