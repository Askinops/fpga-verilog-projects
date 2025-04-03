# BCD Incrementor and 7-Segment Display

This Verilog project implements a **BCD Incrementor** that takes a 12-bit input and increments it by one. The project also converts the output into a **7-segment display** format using a hex-to-7-segment decoder.

## Overview

- **BCD Incrementor**: Increments a 12-bit BCD input value by 1.
- **7-Segment Display**: The incremented value is displayed on three 7-segment displays.
  - One for the **ones** digit.
  - One for the **tens** digit.
  - One for the **hundreds** digit.

## Modules

- `bcd_incrementor.v`: Increments the 12-bit BCD input value.
- `tb_bcd_incrementor.v`: Testbench for verifying the BCD incrementor functionality.
- `hex_to_7seg.v`: Converts hexadecimal values to 7-segment display format.
- `bcd_test_top.v`: Top-level module that connects the incrementor and display logic.

## Test Summary

- **Test cases**: Various test cases are provided to check the functionality of the BCD incrementor:
  - BCD values like 259 -> 260, 009 -> 010, and 199 -> 200.
  - Overflow test from 999 -> 000.
  - Edge case testing for the smallest value (000 -> 001).

## File List

- `bcd_incrementor.v`
- `tb_bcd_incrementor.v`
- `hex_to_7seg.v`
- `bcd_test_top.v`
- `README.md`

## Notes

- Designed for **FPGA simulation** and **display applications**.
- Can be extended for more digits or to include additional features (e.g., handling negative numbers).
