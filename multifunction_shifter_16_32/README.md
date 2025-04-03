# Multifunction Shifter (16 & 32 bit)

This project implements a multifunction shifter module in Verilog, capable of both **rotate-right** and **rotate-left** operations. It includes both **16-bit** and **32-bit** versions of the shifter module for efficient hardware implementation.

## Overview

- Supports both **rotate-right** and **rotate-left** operations.
- **16-bit** and **32-bit** versions available.
- Direction controlled by the `lr` signal:
  - `lr = 0`: Rotate-right
  - `lr = 1`: Rotate-left

## Modules

- `rotate_right_16.v`: 16-bit rotate-right logic.
- `rotate_left_16.v`: 16-bit rotate-left logic.
- `multifunction_shifter_16.v`: 16-bit multifunction shifter combining rotate-right and rotate-left.
- `tb_multifunction_shifter_16.v`: Testbench for the 16-bit shifter module.
- `rotate_right_32.v`: 32-bit rotate-right logic.
- `rotate_left_32.v`: 32-bit rotate-left logic.
- `multifunction_shifter_32.v`: 32-bit multifunction shifter combining rotate-right and rotate-left.
- `tb_multifunction_shifter_32.v`: Testbench for the 32-bit shifter module.

## Test Summary

- **16-bit & 32-bit shift operations** tested with various amounts (0–16 and 0–31).
- Test cases for both rotate-right and rotate-left directions.
- Simulation verified with **Vivado**.

## File List

- `multifunction_shifter_16.v`
- `multifunction_shifter_32.v`
- `rotate_left_16.v`
- `rotate_left_32.v`
- `rotate_right_16.v`
- `rotate_right_32.v`
- `tb_multifunction_shifter_16.v`
- `tb_multifunction_shifter_32.v`
- `README.md`

## Notes

- Designed for FPGA simulation and implementation.
- Easily extendable for higher bit-width operations.
