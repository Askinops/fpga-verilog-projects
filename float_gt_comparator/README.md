# Floating Point Greater Than Comparator

This Verilog project implements a **floating-point greater-than (gt) comparator**. It compares two 13-bit floating-point numbers, considering the sign, exponent, and fraction parts of the numbers, and returns a `gt` output indicating whether the first number is greater than the second.

## Overview

- **Inputs:**
  - Two 13-bit floating-point numbers (`a` and `b`), which are divided into:
    - 1-bit **sign** (s),
    - 4-bit **exponent** (exp),
    - 8-bit **fraction** (frac).
  
- **Output:**
  - A single 1-bit output `gt`, indicating if `a > b`.

The module handles both positive and negative floating-point numbers correctly, comparing them based on their exponent and fraction parts.

## Modules

- `float_gt.v`: Floating-point greater-than comparator logic.
- `tb_fp_gt.v`: Testbench to verify the functionality of the comparator.

## Test Summary

- Various test cases are provided, including comparisons between positive and negative numbers, as well as numbers with the same exponent but different fraction values.
- Simulated using **Vivado**.

## File List

- `float_gt.v`
- `tb_fp_gt.v`
- `README.md`

## Notes

- Designed for FPGA simulation and floating-point comparison tasks.
- Easily extendable for more complex floating-point systems with higher precision.
