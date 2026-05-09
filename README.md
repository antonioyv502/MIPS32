# MIPS32 Single-Cycle Processor

## Description
This project implements a 32-bit MIPS single-cycle processor using Verilog and developed in Quartus Prime.
## Supported Instructions 
R-Type
- ADD
- SUB
- AND
- OR
- XOR
  
I-Type
- ADDI
- ORI
- ANDI

## Architecture 
This processor is composed of the following core components:
- Program Counter(PC)
- Instruction Memory
- Instruction decoder 
- Control Unit
- Register File
- ALU(Arithmetic Logic Unit)
- Multiplexers

## RTL Viewer in Quartus Prime 

![RTL_Viewer](./RTL_Viewer/mips32_rtl.png)


## Instruction Decode Table MIPS32 Single Cycle
| #  | Machine Code (Hex) | Binary (32-bit)                  | Opcode | rs | rt | rd | Immediate    |
|----|--------------------|----------------------------------|--------|----|----|----|--------------|
| 1  | 0x20010022         | 00100000000000010000000000100010 | addi   | 0  | 1  | -  | 0x0022 (34)  |
| 2  | 0x20020044         | 00100000000000100000000001000100 | addi   | 0  | 2  | -  | 0x0044 (68)  |
| 3  | 0x3421000F         | 00110100001000010000000000001111 | ori    | 1  | 1  | -  | 0x000F (15)  |
| 4  | 0x344200F0         | 00110100010000100000000011110000 | ori    | 2  | 2  | -  | 0x00F0 (240) |
| 5  | 0x00221820         | 00000000001000100001100000100000 | add    | 1  | 2  | 3  | -            |
| 6  | 0x00612024         | 00000000011000010010000000100100 | and    | 3  | 1  | 4  | -            |
| 7  | 0x2085FF08         | 00100000100001011111111100001000 | addi   | 4  | 5  | -  | 0xFF08 (-248)|
| 8  | 0x34A600FA         | 00110100101001100000000011111010 | ori    | 5  | 6  | -  | 0x00FA (250) |
| 9  | 0x00C53820         | 00000000110001010011100000100000 | add    | 6  | 5  | 7  | -            |
| 10 | 0x30E80048         | 00110000111010000000000001001000 | andi   | 7  | 8  | -  | 0x0048 (72)  |

## 📸 Simulation Waveform

This waveform shows the PC incrementing by 4 at every rising edge of the clock, instructions being fetched from the instruction memory and the instruction being decoded into opcode, source/destination registers, and immediate values. 

![Waveform1](./Waveforms/mips32_waveform1.png)

![Waveform2](./Waveforms/mips32_waveform2.png)
