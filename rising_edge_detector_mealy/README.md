# Edge Detector – Mealy FSM (Verilog)

This module implements a **rising edge detector** using a Mealy-type finite state machine. It generates a 1-cycle `tick` pulse **immediately** when the input `level` transitions from 0 to 1.

---

## 🔧 Module: `edge_detector_mealy.v`

### Inputs:
- `clk`: Clock input
- `reset`: Synchronous reset (active-high)
- `level`: Input signal (monitored for rising edge)

### Output:
- `tick`: 1-cycle pulse when `level` goes from 0 to 1

---

## ⚙️ State Machine

Mealy FSM with 2 symbolic states:

| State | Meaning          | Transition Condition     | Output (`tick`) |
|--------|------------------|--------------------------|------------------|
| `zero` | Waiting for rise | `level == 1` → `one`     | `tick = 1`       |
| `one`  | High-level state | `level == 0` → `zero`    | `tick = 0`       |

---

## ⛓ Behavior

- On 0 → 1 transition: `tick` = 1 for **exactly one clock**
- On continuous high: remains in `one` state, `tick` stays low
- FSM transitions are synchronous with `clk`

---

## 🧪 Testbench

⚠️ **Not included**  
To verify:
- Apply a `level` pulse with 0 → 1 → 0 pattern
- Observe that `tick` becomes `1` **immediately** on the rising edge

---

## 📁 Folder Structure

edge_detector_mealy/ ├── edge_detector_mealy.v └── README.md


---

## ✅ Notes

- Mealy FSM allows faster edge detection (1 cycle earlier than Moore)
- Works well in control logic, pulse generators, or FSM triggers
- Can be extended to detect falling edges

---

## 🏷️ Tags

`Verilog`, `FSM`, `Mealy`, `Edge Detection`, `Digital Logic`, `Pulse Generator`, `Sequential Design`

