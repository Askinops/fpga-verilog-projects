# Dual Priority Test Display

This Verilog project implements a **dual priority encoder** with 7-segment display outputs. It takes a 12-bit input (`req`), identifies the first and second highest priority bits, and converts these values to 7-segment display format.

## Overview

- **Input:** 12-bit priority request (`req`), with each bit representing a priority level.
- **Outputs:**
  - `sseg1`: 7-segment display for the first highest priority.
  - `sseg2`: 7-segment display for the second highest priority.

The first and second priorities are encoded and displayed using `hex_to_sseg` modules, which convert the 4-bit values to 7-segment display format.

## Modules

- `dual_priority_test_display.v`: Top-level module that integrates the priority encoder and 7-segment display logic.
- `dual_piority_encoder.v`: Priority encoder module that determines the first and second highest priority bits.
- `hex_to_sseg.v`: Converts hexadecimal values to 7-segment display format.
- `tb_dual_priority_test_display.v`: Testbench with various test cases to verify the functionality of the design.

## Test Summary

- **Test cases**: Includes test cases for different priority inputs:
  - Test 1: Only bits 2 and 0 active
  - Test 2: Bits 10, 6, and 3 active
  - Test 3: Only bit 11 active
  - Test 4: No bits active

## File List

- `dual_priority_test_display.v`
- `dual_piority_encoder.v`
- `hex_to_sseg.v`
- `tb_dual_priority_test_display.v`
- `README.md`

## Notes

- Simulated using **Vivado**.
- The system assumes active-low 7-segment displays.
- The design can be extended for higher bit-widths and more complex display systems.
