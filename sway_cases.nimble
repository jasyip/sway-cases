# Package

from std/os import `/`
from std/sugar import collect
from std/strformat import `&`

version       = "1.0.0"
author        = "Jason Yip"
description   = "Make special exceptions for certain windows and sway commands"
license       = "GPL-2.0-only"
srcDir        = "src"

binDir        = "bin"
const binList = ["kill", "fullscreen"]

namedBin      = collect initTable():
  for name in binList: { name : &"special_{name}" }


# Dependencies

requires "nim >= 1.4 & < 2"
requires "libsway_cases >= 1 & < 2"
