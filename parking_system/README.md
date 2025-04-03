# Parking System – FSM + Counter

This Verilog project simulates a basic parking lot management system using two photo-sensors. The system detects vehicle entry and exit, and maintains a 4-bit car count using a finite state machine (FSM) and a synchronous counter.

## 📌 Modules

### `parking_fsm.v`
- Detects sensor sequences (`a`, `b`) to determine vehicle direction.
- Generates 1-clock-cycle `enter` or `exit` pulse.
- FSM states:
  - `s0`: idle
  - `s1`: first sensor triggered
  - `s2`: both triggered
  - `s3`: waiting for vehicle to leave sensor area

### `parking_counter.v`
- Simple 4-bit counter
- Increments on `enter`
- Decrements on `exit`
- Limits: 0 to 15

### `parking_system_tb.v`
- Full testbench that simulates multiple vehicle entries, exits, and invalid movements.
- Includes commented sections for clarity.

## ✅ Features
- Fully synthesizable Verilog code
- Edge detection using FSM states
- Safe count boundaries (0–15)
- Testbench included

## 🧪 Simulation
- Clock: 10ns (100 MHz)
- Includes vehicle pass-through sequences
- Validates both entry and exit FSM paths

## 📂 File List
| File | Description |
|------|-------------|
| `parking_fsm.v` | FSM controller for detecting movement |
| `parking_counter.v` | 4-bit synchronous counter |
| `parking_system_tb.v` | Testbench with entry/exit simulation |
