"""
This module provides test code.

Author: Sco3
Date: 2024-04-20
"""

from memory.unsafe import Pointer
import time

alias BUFLEN: Int = 17
alias BUFHALF: Int = BUFLEN // 2

fn main() raises: # {
    """
    Method to measure execution time.
    """
    var start: Int = time.now()
    var num: Float64 = 0.0
    var n = 10_000_000
    var seed: Int = 1
    var buf: Pointer[UInt8] = Pointer[UInt8].alloc(BUFLEN + 1)
    buf[BUFLEN] = 0
    buf[BUFHALF] = ord(".")
    var s: String = String(buf, BUFLEN + 1)
    var sb: StringRef = StringRef(buf, BUFLEN + 1)
    for _ in range(n):  # {
        for j in range(BUFLEN):  # {
            if j != 8:  # {
                seed = (((seed + 7) << 4) // 11) & 0xFFFFFF
                buf[j] = 0x30 + (seed % 10)
            # }
        # }
        num = Float64(sb)
    # }
    
    print("Random numbers parsed: ", n, " str: ", s, "num: ", num)
    print("Time: ", (time.now() - start) // 1000000, " ms")
# }