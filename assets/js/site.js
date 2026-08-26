import "./theme.js"
import "./mode.js"
import { Socket } from "phoenix"
import { LiveSocket } from "phoenix_live_view"
import { hooks } from "corex/hooks"
import { FloatingPanel } from "corex/floating-panel"
import { Toast } from "corex/toast"
import { Select } from "corex/select"
import { Toggle } from "corex/toggle"
import { Dialog } from "corex/dialog"
import { ToggleGroup } from "corex/toggle-group"
import { Menu } from "corex/menu"
import { Clipboard } from "corex/clipboard"
import { initLanding } from "./landing.js"
import { initWaitlistForm } from "./waitlist.js"

const csrfToken = document
  .querySelector("meta[name='csrf-token']")
  ?.getAttribute("content")

// Eager chrome (every page) — matches installer/my_app3 so Template Options is instant.
// Lazy page hooks — Timer, Marquee, Accordion, etc. only when present.
const liveSocket = new LiveSocket("/live", Socket, {
  params: { _csrf_token: csrfToken },
  hooks: {
    FloatingPanel,
    Toast,
    Select,
    Toggle,
    Dialog,
    ToggleGroup,
    Menu,
    Clipboard,
    ...hooks({
      Tabs: () => import("corex/tabs"),
      Timer: () => import("corex/timer"),
      Marquee: () => import("corex/marquee"),
      Accordion: () => import("corex/accordion"),
      Checkbox: () => import("corex/checkbox"),
      Avatar: () => import("corex/avatar"),
    }),
  },
})

liveSocket.disableDebug()
liveSocket.connect()

if (document.querySelector("[data-landing]")) {
  initLanding()
}

initWaitlistForm()
