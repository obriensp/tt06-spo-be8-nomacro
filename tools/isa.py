class ISA:
    microcode = []
    ops = {}
    mnemonics = {}
    has_operand = {}

    def __init__(self):
        def instr(mnemonic, opcode, *steps, **flags):
            assert opcode >= 0 and opcode < 16
            assert len(steps) < 4

            self.ops[mnemonic.upper()] = opcode
            self.mnemonics[opcode] = mnemonic.upper()
            self.has_operand[opcode] = False

            # print(f"Define instruction {mnemonic} encoded as {opcode:#06b}")
            CF = flag(flags, 'CF')
            ZF = flag(flags, 'ZF')

            # invert the active-low signals
            steps = [x ^ active_lows for x in steps]

            for c in CF:
                for z in ZF:
                    for i, step in enumerate(steps):
                        self.microcode.append(f"8'b{opcode:04b}{c}{z}{i:02b}: signals = 18'b{step:018b};")
                        if step & IO == 0:
                            self.has_operand[opcode] = True

        instr("NOP", 0x0)
        instr("LDA", 0x1, IO|MI, RO|AI)
        instr("ADD", 0x2, IO|MI, RO|BI, EO|AI|FI)
        instr("SUB", 0x3, IO|MI, RO|BI, EO|AI|SU|FI)
        instr("STA", 0x4, IO|MI, AO|RI)
        instr("LDI", 0x5, IO|AI)
        instr("JMP", 0x6, IO|J)
        instr("JC",  0x7, IO|J,
            CF=True)
        instr("JZ",  0x8, IO|J,
            ZF=True)
        instr("IN",  0xD, NO|AI)
        instr("OUT", 0xE, AO|OI)
        instr("HLT", 0xF, HLT)


    def assemble(self, str):
        lines = str.splitlines()
        binary = b''
        for i, line in enumerate(lines):
            try:
                binary += self.assemble_line(line)
            except:
                print(f"Error at line {i + 1}: {line}")
                return b''

        return binary


    def assemble_line(self, line):
        words = line.split()
        match len(words):
            case 0:
                return b''
            case 1:
                if words[0] in self.ops:
                    opcode = self.ops[words[0]]
                    return (opcode << 4).to_bytes(1)
                number = int(words[0], 0)
                assert number >= 0x0 and number <= 0xFF
                return number.to_bytes(1)
            case 2:
                assert words[0] in self.ops
                opcode = self.ops[words[0]]

                operand = int(words[1], 0)
                assert operand >= 0x0 and operand <= 0xF
                byte = (opcode << 4) | operand
                return byte.to_bytes(1)
            case _:
                print(f"Unhandled line: {line}")
                return b''

    def disassemble_byte(self, byte):
        opcode = byte >> 4
        operand = byte & 0xF

        if opcode in self.mnemonics:
            if self.has_operand[opcode]:
                return f'{self.mnemonics[opcode]:4} 0x{operand:X}'
            return self.mnemonics[opcode]

        return None

def flag(list, flag):
    if flag in list:
        return [int(list[flag])]
    return [0, 1]

HLT = 1 << 17
CE  = 1 << 16
SU  = 1 << 15
AI  = 1 << 14
BI  = 1 << 13
OI  = 1 << 12
II  = 1 << 11
J   = 1 << 10
FI  = 1 << 9
MI  = 1 << 8
RI  = 1 << 7
AO  = 1 << 6
BO  = 1 << 5
IO  = 1 << 4
CO  = 1 << 3
EO  = 1 << 2
RO  = 1 << 1
NO  = 1 << 0

active_lows = AI|BI|OI|II|J|FI|MI|AO|BO|IO|CO|EO|RO|NO
