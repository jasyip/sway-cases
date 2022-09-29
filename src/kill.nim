from std/json import JsonNode, getStr
from std/logging import debug, info, notice
from std/posix import SIGINT, Pid
from std/posix_utils import sendSignal
from std/re import re
from std/strformat import `&`
from std/tables import `[]`

import libsway_cases


let directCriteria* = [
  @[
    initCriteria("zoom", "app_id"),
    initCriteria(re"^Zoom - (Free|Licensed) Account$", "name"),
  ],
  @[
    initCriteria("zoom", "window_properties", "class"),
    initCriteria(re"^Zoom - (Free|Licensed) Account$", "name"),
  ],
]

let ignoreCriteria* = [
  @[
    initCriteria("Stretchly", "app_id"),
    initCriteria("Time to take a break!", "name"),
  ],
  @[
    initCriteria("wlogout", "app_id"),
  ],
]

when isMainModule:

  let focusedWindow: JsonNode = getFocusedWindow()

  if matchesAny(ignoreCriteria, focusedWindow):
    notice &"""Ignoring kill request for '{focusedWindow.fields["name"].getStr()}'"""
  elif not matchesAny(directCriteria, focusedWindow):
    info &"""Normally killing '{focusedWindow.fields["name"].getStr()}'"""
    debug "swaymsg output: " & smoothExec("swaymsg", args=["kill"])
  else:
    notice &"""Signalling '{focusedWindow.fields["name"].getStr()}' with {SIGINT=}"""
    sendSignal(Pid(focusedWindow.fields["pid"].num), SIGINT)
