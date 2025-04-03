# Multifunction Shifter (Reverse-Based)

This project implements an 8-bit multifunction shifter in Verilog. It supports both **rotate-right** and **rotate-left** operations. The rotate-left logic is realized using the reverse-rotate-reverse method, which simplifies the design by reusing the rotate-right hardware.

## Overview

- Rotate direction is controlled by `lr` signal:
  - `lr = 1`: rotate right
  - `lr = 0`: rotate left (implemented using bit reversal)

- Input shift amount: 3-bit (`amt`)
- Input data: 8-bit (`a`)
- Output data: 8-bit (`y`)

## Modules

- `bit_reverse.v`  
  Reverses the order of bits in an 8-bit input.

- `rotate_right.v`  
  Performs rotate-right operation using shift and bitwise OR.

- `multifunction_shifter_reverse.v`  
  Top-level module. Selects between rotate-left and rotate-right using control signal.

- `tb_multifunction_shifter_reverse.v`  
  Contains test scenarios for both left and right rotations with various shift amounts.

## Test Summary

- Tested using Vivado simulation.
- Includes cases for:
  - Rotate right: amt = 1, 3
  - Rotate left: amt = 2, 4, 0
  - Edge case: amt = 0

## File List

- `bit_reverse.v`
- `rotate_right.v`
- `multifunction_shifter_reverse.v`
- `tb_multifunction_shifter_reverse.v`
- `README.md`

## Notes

- Designed for simulation only.
- Easily extendable to N-bit width with parameters.
