const skins = {
  neo: () => import("./skins/neo.js"),
  uno: () => import("./skins/uno.js"),
  duo: () => import("./skins/duo.js"),
  leo: () => import("./skins/leo.js"),
}

let active = { id: null, teardown: null }

function motionReduce() {
  return document.documentElement.getAttribute("data-motion") === "reduce"
}

async function apply(theme) {
  if (motionReduce()) {
    if (typeof active.teardown === "function") {
      active.teardown()
    }
    active = { id: null, teardown: null }
    return
  }

  if (active.id === theme) {
    return
  }

  if (typeof active.teardown === "function") {
    active.teardown()
  }

  active = { id: theme, teardown: null }
  const load = skins[theme]
  if (!load) {
    return
  }

  const mod = await load()
  if (active.id !== theme) {
    return
  }

  active.teardown = typeof mod.activate === "function" ? mod.activate() || null : null
}

export function initSkins() {
  const root = document.documentElement
  apply(root.dataset.theme)

  const observer = new MutationObserver(() => {
    apply(root.dataset.theme)
  })

  observer.observe(root, {
    attributes: true,
    attributeFilter: ["data-theme", "data-motion"],
  })
}
