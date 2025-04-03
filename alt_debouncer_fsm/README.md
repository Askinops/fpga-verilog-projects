# Debouncer with FSM (Alternative – Timed Lockout)

This module implements a **debounce filter** using a finite state machine.  
After detecting a rising edge (`sw = 1`), it **locks out further changes for ~30ms**, ignoring bounces or glitches.

---

## 🔧 Module: `alt_debouncer_fsm.v`

### Inputs
- `clk`   : Clock (50 MHz expected)
- `reset` : Synchronous reset
- `sw`    : Raw mechanical switch input

### Output
- `db`    : Debounced output

---

## ⚙️ Behavior (FSM Overview)

| State     | Meaning                        | Action        |
|-----------|--------------------------------|---------------|
| `zero`    | Idle, waiting for sw = 1       | —             |
| `edg`     | Rising edge detected           | db = 1        |
| `wait_1`  | Wait ~10ms                     | db = 1        |
| `wait_2`  | Wait another ~10ms             | db = 1        |
| `check`   | Wait final ~10ms, check sw     | db = 1        |
| if sw == 0 → return to `zero`              |               |

- Total lockout = ~30ms (via counter `q_reg` and `m_tick`)

---

## 🧪 Testbench

**File:** `alt_debouncer_fsm_tb.v`  
Simulates a noisy button press (with bounce), then verifies that `db = 1` remains stable during waiting period.

---

## 📁 Folder Structure

alt_debouncer_fsm/ ├── alt_debouncer_fsm.v ├── alt_debouncer_fsm_tb.v └── README.md


---

## ✅ Notes

- `n = 19` → ~10ms delay with 50 MHz clock
- Glitch-tolerant: useful in physical push-button applications
- Waits before releasing `db = 1`, ensuring stable press-and-release
