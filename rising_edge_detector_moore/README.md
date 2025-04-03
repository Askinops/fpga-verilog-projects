# Edge Detector – Moore FSM (Verilog)

This module implements a **rising edge detector** using a Moore-type finite state machine. When the input signal (`level`) transitions from 0 to 1, the output `tick` is asserted high for one clock cycle.

---

## 🔧 Module: `edge_detected_moore.v`

### Inputs:
- `clk`: Clock input
- `reset`: Synchronous reset (active-high)
- `level`: Input level signal (monitored for rising edge)

### Output:
- `tick`: Pulse output (1 clock cycle) on rising edge

---

## ⚙️ State Machine

Moore FSM with 3 symbolic states:

| State | Meaning     | Transition Condition     |
|-------|-------------|--------------------------|
| `zero` | Waiting for high level | `level == 1` → `edg` |
| `edg`  | Edge detected          | → Output `tick = 1`, then:
- `level == 1` → `one`
- `level == 0` → `zero`  
| `one`  | High level state       | `level == 0` → `zero` |

---

## ⛓ Behavior

- Rising edge on `level` triggers a `tick` for **1 clock cycle**
- FSM safely returns to `zero` when level goes low
- Clean edge detection without glitches

---

## 🧪 Testbench

⚠️ **Not yet implemented**  
You can create a testbench by:
- Toggling `level` from 0 → 1 → 1 → 0  
- Observing `tick` pulse only at first 0 → 1 transition  

---

## 📁 Folder Structure

edge_detector/ ├── edge_detected_moore.v └── README.md


---

## ✅ Notes

- Synthesis-friendly and glitch-free
- Moore FSM preferred for output stability
- Can be extended to detect falling edges or use Mealy FSM

---

## 🏷️ Tags

`Verilog`, `FSM`, `Moore`, `Edge Detector`, `Digital Design`, `Tick Generator`, `Sequential Logic`
