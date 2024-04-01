#!/usr/bin/env python3

PREADY = 1 << 18
BUS    = 0 << 17
OUTREG = 1 << 17
PWDATA = 0 << 16
ADDR   = 1 << 16
AI     = 1 << 15
BI     = 1 << 14
OI     = 1 << 13
II     = 1 << 12
J      = 1 << 11
FI     = 1 << 10
MI     = 1 << 9
RI     = 1 << 8
DO     = 1 << 7
AO     = 1 << 6
BO     = 1 << 5
IO     = 1 << 4
CO     = 1 << 3
EO     = 1 << 2
RO     = 1 << 1
NO     = 1 << 0

active_lows = AI|BI|OI|II|J|FI|MI|DO|AO|BO|IO|CO|EO|RO|NO

def op(address, write, *steps):
    # invert the active-low signals
    steps = [x ^ active_lows for x in steps]

    print(f"// Address: 0x{address:04X} {'W' if write else 'R'}")
    for i, step in enumerate(steps):
        print(f"8'b{address:05b}{write:01b}{i:02b}: signals <= 19'b{step:019b};")

# Reserved
op(0x00, 0,
    PREADY
)
op(0x00, 1,
    PREADY
)

# A register
op(0x01, 0,
    AO|BUS|PREADY
)
op(0x01, 1,
    PWDATA|DO|AI|PREADY
)

# B register
op(0x02, 0,
    BO|BUS|PREADY
)
op(0x02, 1,
    PWDATA|DO|BI|PREADY
)

# Instruction register
op(0x03, 0,
    IO|BUS|PREADY
)
op(0x03, 1,
    PWDATA|DO|II|PREADY
)

# Program counter
op(0x04, 0,
    CO|BUS|PREADY
)
op(0x04, 1,
    PWDATA|DO|J|PREADY
)

# FIXME: flags register
op(0x05, 0,
    PREADY
)
op(0x05, 1,
    PREADY
)

# IN register
op(0x06, 0,
    NO|BUS|PREADY
)
op(0x06, 1,
    PREADY
)

# OUT register
op(0x07, 0,
    OUTREG|PREADY
)
op(0x07, 1,
    PWDATA|DO|OI|PREADY
)

# Memory

for addr in range(0x8, 0x19):
    op(addr, 0,
        ADDR|DO|MI,
        RO|BUS|PREADY
    )
    op(addr, 1,
        ADDR|DO|MI,
        PWDATA|DO|RI|PREADY
    )


print(f"default:     signals <= 19'b{active_lows:019b};")
