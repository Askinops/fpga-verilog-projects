# Heartbeat Animation on 7-Segment Display (Verilog)

This Verilog project creates a **"heartbeat"-style animation** across a 4-digit 7-segment display using a circular shift register. The display updates periodically, giving the impression of a moving pulse or light.

---

## 🧠 Overview

- **Concept**: A lit segment ("heart") moves from digit 0 to digit 3 repeatedly
- **Clock division**: Uses a 21-bit counter to reduce a 100 MHz clock to ~50 Hz
- **Display logic**: Based on rotating a 4-bit anode signal (`an`) to activate each digit in turn
- **Output**: The active segment changes every ~20ms, creating a visible animation

---

## 🔌 Module: `heartbeat.v`

### Inputs:
- `clk`: Clock input (assumed 100 MHz)
- `reset`: Active-high synchronous reset

### Outputs:
- `an [3:0]`: Active-low anode control (only one digit active at a time)
- `sseg [7:0]`: Segment control for 7-segment display (active-low)

---

## 🧪 Testbench: `heartbeat_tb.v`

- Initializes `clk` and applies reset for 50ns
- Simulates the animation for ~100 ms
- Clock runs at 100 MHz (10ns period)
- Simulation output is viewable via waveform (e.g., GTKWave or Vivado)

---

## 💡 How It Works

1. A 21-bit register (`clk_reg`) increments every clock cycle
2. When it overflows to `0`, a `tick` signal is generated (~every 0.02s)
3. On each `tick`, the `an` signal rotates left:  
   `4'b1110` → `1101` → `1011` → `0111` → back to `1110`
4. The segment values (`sseg`) change based on which digit is active

---

## 🧾 Example Timing (assuming 100 MHz clock)

| Counter Width | Tick Frequency | Tick Period |
|---------------|----------------|-------------|
| 21 bits       | ~47.6 Hz       | ~21 ms      |
| Can be tuned by changing the `N` parameter in the design |

---

## ✅ Simulation Notes

- Works well with **Vivado**, **ModelSim**, or **iverilog**
- Can be visualized via waveform viewer (e.g., GTKWave)
- No actual display hardware needed to test logic

---

## 🏷️ Tags

`Verilog` `FPGA` `7-Segment Display` `Animation` `Digital Design` `Clock Divider`

