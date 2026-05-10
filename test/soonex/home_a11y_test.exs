defmodule Soonex.HomeA11yTest do
  use ExUnit.Case, async: false
  use Wallaby.Feature

  @tag :capture_log

  feature "home page full document has no axe violations", %{session: session} do
    session = Wallaby.Browser.visit(session, "/")
    Process.sleep(2400)

    _ = find(session, Query.css("#main-content"))
    _ = find(session, Query.css(".link.link--skip", visible: :any))

    session
    |> A11yAudit.Wallaby.assert_no_violations()
  end
end
