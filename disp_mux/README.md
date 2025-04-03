# Display Multiplexer (disp_mux)

This Verilog project implements a **Display Multiplexer** for controlling four 7-segment displays. The multiplexer takes four 8-bit inputs and selects one of them to display on a 7-segment display. It uses a counter to cycle through the displays.

## Overview

- **Inputs:**
  - `in3`, `in2`, `in1`, `in0`: 8-bit values to be displayed on the 7-segment displays.
  - `clk`: Clock signal.
  - `reset`: Reset signal that resets the counter.

- **Outputs:**
  - `an`: Active segment control (which display is active).
  - `sseg`: 7-segment output for the selected display.

The counter cycles through the displays, and each one is active for one clock cycle.

## Modules

- `disp_mux.v`: The Display Multiplexer module.
- `tb_disp_mux.v`: Testbench for the multiplexer module.

## Test Summary

- The testbench simulates the display multiplexer, testing all four input values and cycling through the displays.
- Simulation is done using **Vivado**.

## File List

- `disp_mux.v`
- `tb_disp_mux.v`
- `README.md`

## Notes

- Designed for FPGA simulation and display applications.
- Easily extendable for additional displays or more complex multiplexing systems.
