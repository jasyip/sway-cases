# Package

from std/sequtils import mapIt


version       = "1.1.3"
author        = "Jason Yip"
description   = "My application of `libsway_cases`"
license       = "GPL-2.0-only"
srcDir        = "src"

binDir        = "bin"
namedBin      = ["kill", "fullscreen"].mapIt((it, "special_" & it)).toTable()



# Dependencies

requires "nim >= 1.6 & < 2"
requires "https://github.com/jasyip/libsway-cases >= 2 & < 3"
