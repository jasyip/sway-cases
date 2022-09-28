# Package

from std/os import `/`
from std/sugar import collect
from std/strformat import `&`

version       = "1.1.0"
author        = "Jason Yip"
description   = "My application of `libsway_cases`"
license       = "GPL-2.0-only"
srcDir        = "src"

binDir        = "bin"
const binList = ["kill", "fullscreen"]

namedBin      = collect initTable():
  for name in binList: { name : &"special_{name}" }


# Dependencies

requires "nim >= 1.4 & < 2"
requires "https://github.com/jasyip/libsway-cases >= 1 & < 2"
