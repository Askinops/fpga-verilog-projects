# Dual-Edge Detector – Moore FSM (Verilog)

This module detects both **rising and falling edges** of an input signal using a **Moore FSM** structure. It outputs a single-cycle pulse (`tick`) for each edge.

---

## 🔧 Module: `dual_edge_detector_moore.v`

### Inputs
- `clk` : Clock
- `reset` : Sync reset
- `level` : Signal to monitor

### Output
- `tick` : 1-cycle pulse on **every edge**

---

## ⚙️ States

| State       | Meaning            | Transition         |
|-------------|--------------------|--------------------|
| `zero`      | Input is stable 0  | → `edge_up` on 0→1 |
| `edge_up`   | Rising edge seen   | → `one`            |
| `one`       | Input is stable 1  | → `edge_down` on 1→0 |
| `edge_down` | Falling edge seen  | → `zero`           |

- `tick = 1` only in `edge_up` and `edge_down` states

---

## 🧪 Testbench

**File:** `dual_edge_detector_moore_tb.v`  
Tests both rising and falling edges by toggling `level`.  
Confirms `tick` is high for 1 clock at each edge.

---

## 📁 Folder Structure

dual_edge_detector_moore/ ├── dual_edge_detector_moore.v ├── dual_edge_detector_moore_tb.v └── README.md


---

## ✅ Notes

- Clean and safe FSM design
- `tick` is glitch-free
- Can be used to trigger counters or FSMs on both edges

