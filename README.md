# 32-bit Single-Cycle Processor (RISC-V) using Cadence

This project showcases the design, simulation and synthesis of a **32-bit Single-Cycle Processor** implemented in Verilog and verified using Cadence tools. The processor supports a subset of RISC-V instructions and is structured to meet academic and industrial standards for design and timing efficiency.

---

## Overview

This processor was designed from scratch to execute RISC-V instructions in a **single clock cycle**, incorporating a fully functional datapath and controller.

- **Instruction Set**: Subset of RISC-V (RV32I)
- **Clocking**: Single-cycle implementation
- **Design Methodology**: RTL Design & Synthesis using Cadence
- **Simulation**: Conducted pre-synthesis functional verification

---

## Key Features

- Built a complete **datapath** including:
  - Program Counter
  - Instruction Memory
  - Register File
  - ALU
  - Immediate Generator
  - Data Memory
  - Implemented a **controller unit** to generate appropriate control signals for branching, memory access and ALU operations.
  - Achieved **95% timing efficiency** during synthesis.
  - Optimized area for better performance using Cadence synthesis tools.
  - Successfully simulated testbenches for functional correctness.

---

## Tools & Technologies

- **Design Language**: Verilog HDL
- **EDA Tools**: Cadence (Genus, SimVision)
- **Simulation**: Cadence Xcelium
- **Synthesis & Optimization**: Cadence Genus

