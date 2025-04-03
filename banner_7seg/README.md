# Rotating Banner – 7-Segment Display

This project scrolls a 4-digit window over a static 10-digit message (`0–9`) on a 7-segment display. The scroll direction and animation can be controlled via input signals.

## 🔧 Top Module

**Module:** `rotating_banner.v`  
**Inputs:**
- `clk` : 100 MHz clock
- `reset` : Synchronous reset
- `en` : Enable scroll (1 = active, 0 = pause)
- `dir` : Scroll direction (1 = right, 0 = left)

**Outputs:**
- `an[3:0]` : Digit enables (active-low)
- `sseg[7:0]` : Segment outputs (active-low)

## 📦 Components

- `rotating_banner.v` → Top-level control
- `tick_generator.v` → Scroll speed control
- `scroll_controller.v` → Position logic
- `hex_to_7segg.v` → Digit to 7-segment decoder
- `disp_mux.v` → Multiplexes the 4-digit display
- `rotating_banner_tb.v` → Testbench for simulation

## 🧪 Test Features

- Scrolls digits left/right
- Pauses/resumes scrolling
- Shows 4 characters at a time from the message `0123456789`

## 📁 Folder Structure

rotating_banner/ ├── rotating_banner.v ├── rotating_banner_tb.v ├── tick_generator.v ├── scroll_controller.v ├── hex_to_7segg.v ├── disp_mux.v └── README.md


## ✅ Notes

- Works with ModelSim, Vivado, or Icarus Verilog
- Ideal for FPGA boards with 4-digit 7-segment displays
- Scroll speed is set by parameter `N` in `tick_generator`

