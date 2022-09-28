from std/json import JsonNode, getStr
from std/logging import debug, notice
from std/strformat import `&`
from std/tables import `[]`

import libsway_cases


var criteriaList* = [
  @[
    initCriteria("Stretchly", "app_id"),
    initCriteria("Time to take a break!", "name"),
  ],
  @[
    initCriteria("wlogout", "app_id"),
  ],
]
let fullscreenCriteria* = initCriteria(1, "fullscreen_mode")
for criteriaSet in criteriaList.mitems(): criteriaSet.add(fullscreenCriteria)

when isMainModule:

  let focusedWindow: JsonNode = getFocusedWindow()

  if matchesAny(criteriaList, focusedWindow):
    notice &"""Blocking fullscreen toggle for '{focusedWindow.fields["name"].getStr()}'"""
  else:
    debug "swaymsg output: " & smoothExec("swaymsg", args=["fullscreen", "toggle"])
