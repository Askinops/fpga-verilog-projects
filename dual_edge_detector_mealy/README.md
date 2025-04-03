# Dual-Edge Detector – Mealy FSM (Verilog)

This module detects both **rising** and **falling** edges of a signal using a **Mealy FSM** design.  
It outputs a 1-cycle `tick` for **every edge change**.

---

## 🔧 Module: `dual_edge_detector_mealy.v`

### Inputs
- `clk`   : Clock
- `reset` : Synchronous reset
- `level` : Signal to monitor

### Output
- `tick`  : 1-cycle pulse on **every edge**

---

## ⚙️ How It Works

| State | Transition Condition | Action         |
|-------|----------------------|----------------|
| `zero` | `level == 1`        | tick = 1, go to `one` |
| `one`  | `level == 0`        | tick = 1, go to `zero` |

- If no change: stay in current state, tick = 0

---

## 🧪 Testbench

**File:** `dual_edge_detector_mealy_tb.v`  
Tests both rising and falling transitions.  
✔️ Tick is 1 for **each edge**, 0 otherwise.

---

## 📁 Folder View

dual_edge_detector_mealy/ ├── dual_edge_detector_mealy.v ├── dual_edge_detector_mealy_tb.v └── README.md


---

## ✅ Notes

- Mealy FSM gives faster response than Moore
- Works well in reactive circuits (e.g., counters, triggers)
