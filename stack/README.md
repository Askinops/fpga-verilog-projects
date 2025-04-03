# Stack – Verilog (LIFO Buffer)

This project implements a parameterized **stack (LIFO)** structure using Verilog. Data is pushed and popped from the top of the stack. It includes full and empty flags, and a testbench for verification.

---

## 🔧 Top Module

**Module:** `stack.v`  
**Parameters:**
- `B` (default 8): Data width
- `W` (default 4): Address width → stack depth = 2^W

### Inputs:
- `clk`: Clock
- `reset`: Synchronous reset
- `push`: Push control (write to stack)
- `pop`: Pop control (read from stack)
- `w_data [B-1:0]`: Data to push

### Outputs:
- `r_data [B-1:0]`: Data at top of stack
- `full`: Stack is full
- `empty`: Stack is empty

---

## 📐 Behavior

- **Push** increments stack pointer and writes data if not full  
- **Pop** decrements stack pointer and reads data if not empty  
- **Full/Empty flags** prevent overflow/underflow  
- **Simultaneous push & pop** is ignored (no change)

---

## 🧪 Testbench – `stack_tb.v`

### Test Scenario:
- Reset stack  
- Push 3 values  
- Pop 2 values  
- Observe final output and flags  

### Features:
- Randomized data input (`$random`)
- Uses clock toggling with `@(negedge clk)` sync
- `r_data`, `full`, `empty` displayed in simulation

---

## 📁 Folder Structure

stack/ ├── stack.v ├── stack_tb.v └── README.md


---

## ✅ Notes

- Suitable for simulation with **ModelSim**, **Vivado**, or **Icarus Verilog**
- Stack depth = `2^W`, default is 16 entries
- Fully synchronous, safe for FPGA synthesis

---

## 🏷️ Tags

`Verilog`, `FPGA`, `Stack`, `LIFO`, `Data Structure`, `Digital Design`, `Simulation`
