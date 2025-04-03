# 🔧 Verilog Projects Collection

This repository contains a collection of Verilog projects implemented for educational purposes. Each module focuses on a different digital design concept, such as counters, decoders, encoders, FIFO stacks, FSM-based debouncing, and 7-segment displays.

---

## 📚 Reference Materials

The following resources have been used extensively during this process:

- **📘 Pong P. Chu - "FPGA Prototyping by Verilog Examples"**
  - Many of the examples and design ideas in this repository are inspired or directly adapted from this textbook.
  - Chapter-based structure is followed in multiple projects (e.g., FSMs, shifters, stopwatch).

- **🤖 ChatGPT (OpenAI)**
  - Assisted in code review, documentation, and simulation design.
  - Used as a mentor-like companion during development to enhance understanding and readability of code.

---

## 💼 Project Folders

Each folder contains one complete project, including the Verilog modules, testbenches, and a `README.md` file for documentation.

| Folder | Description |
|--------|-------------|
| `stop_watch_cascade` | BCD-based stopwatch using cascaded counters |
| `stack` | Parameterized stack structure with push/pop logic |
| `sign_mag_add` | Sign-magnitude binary addition logic |
| `rising_edge_detector_*` | Edge detectors using Moore and Mealy machines |
| `parking_system` | FSM-controlled parking counter with entry/exit sensors |
| `multifunction_shifter_*` | Barrel shifters with bidirectional rotation |
| `hex_to7seg` | Converts 4-bit hex to 7-segment LED output |
| `heartbeat` | Heartbeat-style animation on 7-segment displays |
| `float_gt_comparator` | 13-bit floating point comparator (a > b) |
| `FIFO` | First-In First-Out queue with full/empty control |
| `edge_detected_gate` | Gate-based rising edge detection logic |
| `dual_priority_test_display` | 12-bit priority encoder and display driver |
| `dual_edge_detector_*` | Detects both rising and falling edges (FSM-based) |
| `disp_mux` | Display multiplexer for 4-digit 7-segment LEDs |
| `decoder_2to4 / 3to8 / 4to16` | Binary decoders of various sizes |
| `db_fsm` | Debouncing circuit with FSM control |
| `bcd_incrementor` | Increments 3-digit BCD number |
| `banner_7seg` | Rotating banner effect on 7-segment display |
| `alt_debouncer_fsm` | Alternate debouncing circuit with FSM |
| `prog_square_wave` | Programmable square wave generator |

---

## ⚠️ Disclaimer

This repository is intended for educational use only. Some of the implementations are based on textbook exercises and lecture references. Credit is given where applicable. If you're using this code for academic purposes, please ensure you **cite properly** and do **not plagiarize**.

---

## 🧠 Learning Objective

The goal is to build a strong foundation in digital logic, FSM design, and HDL simulation through:

- Clean Verilog design
- Simulation-first workflow
- Clear, minimal documentation
- Real-world oriented small modules

---

## ✍️ Maintained By

**A student of Electrical & Electronics Engineering**, currently studying digital design using Verilog and aiming to specialize in FPGA, Embedded Systems, and Machine Learning.

> Powered by curiosity, documented with care.
