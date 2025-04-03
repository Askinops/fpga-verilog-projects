# FPGA Verilog Projects

A curated collection of beginner-to-intermediate FPGA design projects written in **Verilog HDL**.  
All projects are structured, documented, and simulated using **Vivado**.

📘 **Based on**:  
- "FPGA Prototyping by Verilog Examples" by *Pong P. Chu*  
- Supplemented with support and documentation guidance via *ChatGPT (Delta)*

---

## 📂 Project List

Each folder contains a self-contained module, its testbench, and clear comments.

| Project | Description |
|--------|-------------|
| `stop_watch_cascade` | Stopwatch using cascaded BCD counters |
| `stack` | LIFO stack with push/pop logic and overflow detection |
| `fifo` | Parameterized FIFO buffer with full/empty flags |
| `sign_mag_add` | Signed magnitude adder |
| `float_gt_comparator` | 13-bit floating point comparator (a > b?) |
| `bcd_incrementor` | Increases a BCD input by 1 |
| `hex_to7seg` | 7-segment decoder for hex values |
| `disp_mux` | Multiplexed display control module |
| `banner_7seg` | Scrolling banner over 7-segment digits |
| `heartbeat` | Heartbeat animation across 4-digit display |
| `db_fsm` | Debouncing FSM for mechanical buttons |
| `alt_debouncer_fsm` | Alternative debounce circuit with 30ms hold logic |
| `decoder_2to4`, `3to8`, `4to16` | Binary decoder modules |
| `dual_priority_test_display` | Dual-priority encoder + display output |
| `rising_edge_detector_moore` | Edge detection using Moore FSM |
| `rising_edge_detector_mealy` | Edge detection using Mealy FSM |
| `dual_edge_detector_moore` | Detects both rising and falling edges (Moore) |
| `dual_edge_detector_mealy` | Detects both rising and falling edges (Mealy) |
| `edge_detected_gate` | Pure combinational edge detection |
| `parking_system` | FSM + counter to simulate parking lot entry/exit |

---

## 💡 Notes

- All designs simulate successfully in Vivado.
- Testbenches included wherever applicable.
- Projects are organized by functional blocks and FSM logic.

> Educational repository — great for portfolio or learning references.  
> Inspired and built with discipline and curiosity.

---

## 👨‍💻 Credits

- Code: [@Askinops](https://github.com/Askinops)  
- Guidance & Documentation: **ChatGPT **  
- Book Reference: *Pong P. Chu — FPGA Prototyping by Verilog Examples*

---

## 📜 License

Feel free to fork and use for educational or personal purposes.  
Commercial use requires permission.
