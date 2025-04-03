# Debounce FSM – Button Filter Test

This project demonstrates a **debouncing finite state machine** (`db_fsm`) that filters out noisy mechanical button signals. The filtered output is used to increment a display counter.

---

## 🔧 Top Module: `db_fsm_tb.v`

**Inputs**
- `clk`, `reset`
- `btn[1:0]`: btn[1] = test button, btn[0] = clear signal

**Outputs**
- `an[3:0]` : 7-segment anode control
- `sseg[7:0]` : 7-segment segment data

---

## ⚙️ Behavior

- Two counters:
  - `b_reg`: increments on raw button rising edge (may be noisy)
  - `d_reg`: increments only when debounce FSM confirms stable press

- Uses `disp_hex_mux` to show both values live on 7-segment display.

---

## 🧠 FSM Logic: `db_fsm.v`

- Waits for button to stay high for 3 clock intervals (`m_tick`)  
- Only then sets `db = 1` (debounced)
- Similarly, waits for stable low before resetting `db`

---

## 📁 Folder View

db_fsm/ ├── db_fsm.v ├── db_fsm_tb.v └── README.md



---

## ✅ Notes

- `n = 10` in counter is small for simulation, increase for real hardware
- Works well with bouncing physical push buttons on FPGA boards

