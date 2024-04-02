#!/usr/bin/env python3

from isa import ISA, active_lows

isa = ISA()
for line in isa.microcode:
    print(line)

print(f"default:     signals = 18'b{active_lows:018b};")
