# Edge Detector (Gate-Based)

This module detects a **rising edge** on the input signal `level`.  
It outputs a single-cycle pulse `tick` when `level` changes from 0 to 1.

---

## 🔧 Module: `edge_detected_gate.v`

**Inputs**
- `clk` : Clock
- `reset` : Reset
- `level` : Input signal to monitor

**Output**
- `tick` : 1-cycle pulse when a rising edge is detected

---

## 📐 Logic

```verilog
tick = ~delay_reg & level;
Simple one-flip-flop delay line.
Works on clock edge. No FSM.

---

✅ Notes

No testbench yet
Easy to simulate
Lightweight and clean design
