# Package

from std/sequtils import mapIt


version       = "1.1.1"
author        = "Jason Yip"
description   = "My application of `libsway_cases`"
license       = "GPL-2.0-only"
srcDir        = "src"

binDir        = "bin"
namedBin      = ["kill", "fullscreen"].mapIt((it, "special_" & it)).toTable()



# Dependencies

requires "nim >= 1.4 & < 2"
requires "https://github.com/jasyip/libsway-cases >= 1.1 & < 2"
