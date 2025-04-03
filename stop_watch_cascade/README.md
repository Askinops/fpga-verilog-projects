# Stopwatch Cascade (3-Digit BCD Counter)

This Verilog project implements a 3-digit stopwatch using cascaded **BCD (Binary-Coded Decimal)** counters. The stopwatch counts from `000` to `999` based on a clock divider. It's ideal for digital timekeeping and counter-based applications.

## 🧠 Overview

- **Digits:** Three (Hundreds, Tens, Ones)
- **Core idea:** Cascading three BCD counters
- **Control signals:**
  - `go`: Start/stop the counter
  - `clr`: Clear (reset) the counter
- **Parameter:**
  - `DVSR`: Divider value that determines how often the count increments. In real hardware, this is typically set to match 1Hz (e.g., 5 million ticks at 50MHz).

## 🧩 Module Descriptions

### `stop_watch_cascade.v`
- Contains the main stopwatch logic
- Divider generates `ms_tick`
- BCD counters are cascaded: d0 → d1 → d2
- Rolls over after reaching 999 → 000

### `tb_stop_watch_cascade.v`
- Simulates the stopwatch behavior
- Test flow includes:
  - Initial reset
  - Run mode (`go = 1`)
  - Pause and reset
  - Restart and observe

## 🧪 Test Summary

- `DVSR` is reduced to 5 in testbench for fast simulation
- Counter increments visible on terminal output
- Tests include start, stop, reset, and restart behavior

## 📁 File List

- `stop_watch_cascade.v` – Main stopwatch module
- `tb_stop_watch_cascade.v` – Testbench module
- `README.md` – Project documentation

## ✅ Notes

- Designed for FPGA simulation (e.g., Vivado, ModelSim)
- Easily adaptable for real hardware with correct `DVSR`
- Useful in digital clocks, counters, or timer-based FSM designs
