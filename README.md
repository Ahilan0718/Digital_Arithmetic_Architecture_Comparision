# Digital Arithmetic Architecture Comparision in Verilog

A collection of digital arithmetic architectures designed in Verilog HDL, including combinational, sequential, and pipelined implementations of adders, multipliers, and an arithmetic logic unit. Each design was functionally verified using Icarus Verilog and GTKWave and synthesized using Xilinx Vivado to compare FPGA resource utilization and timing performance.

## Repository Structure

```text
Digital_Arithmetic_Architecture_Comparision/
│
├── codes/
│   ├── rca/
│   │   ├── fa.v
│   │   └── ripple_adder.v
│   │
│   ├── cla/
│   │   ├── cla4.v
│   │   └── cla8.v
│   │
│   ├── booth_multiplier/
│   │   └── booth.v
│   │
│   ├── pipelined_alu/
│   │   └── pipelined_alu.v
│   │
│   ├── behavioral_pipelined_multiplier/
│   │   └── behave_pipelined_multi.v
│   │
│   └── structural_pipelined_multiplier/
│       └── struct_pipelined_multi.v
│
├── tb/
│   ├── rca_tb.v
│   ├── cla_tb.v
│   ├── booth_tb.v
│   ├── pipelined_alu_tb.v
│   ├── pipelined_multi_tb.v
│   └── struct_pipelined_multi_tb.v
│
├── simulation/
│   ├── dump_rca.vcd
│   ├── dump_cla.vcd
│   ├── dump_booth.vcd
│   ├── dump_alu.vcd
│   ├── dump_multi.vcd
│   └── dump_struct_multi.vcd
│
├── pics/
│   ├── rca/
│   ├── cla/
│   ├── booth_multiplier/
│   ├── pipelined_alu/
│   ├── behavioral_pipelined_multiplier/
│   └── structural_pipelined_multiplier/
│
├── LICENSE
└── README.md
```

## Implemented Architectures

- Ripple Carry Adder (RCA)
- Carry Lookahead Adder (CLA)
- Booth Multiplier
- Pipelined Arithmetic Logic Unit (ALU)
- Behavioral Pipelined Multiplier
- Structural Pipelined Multiplier

## Project Features

- Verilog HDL Implementation
- Modular RTL Design
- Combinational and Sequential Architectures
- Pipelined Arithmetic Designs
- Behavioral and Structural Multiplier Implementations
- Dedicated Verilog Testbenches
- Functional Verification using Icarus Verilog
- Waveform Analysis using GTKWave
- FPGA Synthesis using Xilinx Vivado
- FPGA Resource Utilization Comparison
- Timing Analysis

## FPGA Resource Utilization Comparison

| Architecture | Slice LUTs | Slice Registers | F7 Muxes | Bonded IOBs | BUFGCTRL | WNS (ns) | WHS (ns) |
|:-------------|:----------:|:---------------:|:--------:|:-----------:|:--------:|:--------:|:--------:|
| Ripple Carry Adder | **8** | - | - | **26** | - | **INF*** | **INF*** |
| Carry Lookahead Adder | **13** | - | - | **26** | - | **INF*** | **INF*** |
| Booth Multiplier | **25** | **20** | - | **20** | **1** | **7.629** | **0.127** |
| Pipelined ALU | **70** | **39** | **6** | **31** | **1** | **6.581** | **0.140** |
| Behavioral Pipelined Multiplier | **70** | **48** | - | **36** | **1** | **4.995** | **0.146** |
| Structural Pipelined Multiplier | **68** | **160** | - | **34** | **1** | **7.899** | **0.122** |

> **Note:** `INF` indicates that no timing constraints were specified during synthesis.

## Architecture Comparison

| Architecture | Type | Pipelined | Description |
|--------------|------|:---------:|-------------|
| Ripple Carry Adder | Combinational | ❌ | Simple cascaded full-adder architecture |
| Carry Lookahead Adder | Combinational | ❌ | High-speed adder using generate/propagate logic |
| Booth Multiplier | Sequential | ❌ | Signed multiplier implementing Booth's algorithm |
| Pipelined ALU | Sequential | ✅ | Three-stage pipelined ALU supporting arithmetic and logical operations |
| Behavioral Pipelined Multiplier | Sequential | ✅ | Multiplier implemented using the Verilog `*` operator |
| Structural Pipelined Multiplier | Sequential | ✅ | Multiplier implemented using partial products and a balanced adder tree |

## Tools Used

- Verilog HDL
- Icarus Verilog
- GTKWave
- Xilinx Vivado
- Git
- GitHub