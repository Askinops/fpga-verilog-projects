# Parameterized FIFO Buffer (Verilog)

This project implements a **parameterized FIFO (First-In First-Out) buffer** in Verilog. It includes support for customizable data width and depth, as well as proper `full` and `empty` flag handling. A comprehensive testbench is included to validate typical FIFO behavior including read/write sequences and simultaneous operations.

---

## 📦 Overview

- **FIFO depth:** `2^W` entries (parameterized)
- **Data width:** `B` bits (parameterized)
- **Flags:**
  - `full`: Asserted when FIFO is full
  - `empty`: Asserted when FIFO is empty
- **Behavior:**
  - Allows simultaneous read/write
  - Clean memory reset to avoid `x` values in simulation
  - Fully synchronous control logic

---

## 🔧 Parameters

| Parameter | Description             | Default |
|-----------|-------------------------|---------|
| `B`       | Data width (in bits)    | `8`     |
| `W`       | Address width (log2(depth)) | `4`     |

> FIFO depth is `2^W`. For example, `W = 3` → depth = 8 entries.

---

## 🔌 Ports

### Inputs
- `clk` : Clock signal
- `reset` : Synchronous reset
- `wr` : Write enable
- `rd` : Read enable
- `w_data [B-1:0]` : Data to be written

### Outputs
- `r_data [B-1:0]` : Data read from FIFO
- `full` : FIFO is full
- `empty` : FIFO is empty

---

## 🧪 Testbench Summary

### File: `fifo_tb.v`

This testbench performs the following steps:
1. **Reset the FIFO**
2. **Write 5 random values**
3. **Read 3 values**
4. **Simultaneous read & write (x2)**
5. **Drain the FIFO**

All edge cases are covered, including:
- Writes when full (ignored)
- Reads when empty (ignored)
- Pointer wrapping and flag updates
- Simultaneous read/write behavior

> Clock period is set to 10ns (100MHz simulation).

---

## 📁 File Structure

