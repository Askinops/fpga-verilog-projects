### `decoder_2to4`

**Description:**  
A simple 2-to-4 decoder implemented using combinational logic.  
Given a 2-bit input `a` and an `enable` signal, the module outputs a one-hot 4-bit vector `y`. Only one output bit is high when enabled.

**Ports:**
- `input [1:0] a` – 2-bit address input
- `input enable` – enables the decoder output
- `output [3:0] y` – one-hot encoded 4-bit output

**Function Table:**

| enable | a[1:0] | y     |
|--------|--------|-------|
| 0      | 00     | 0000  |
| 1      | 00     | 0001  |
| 1      | 01     | 0010  |
| 1      | 10     | 0100  |
| 1      | 11     | 1000  |

**Testbench:**  
A testbench file `decoder_2to4_tb.v` is included. It verifies the decoder behavior for all input combinations, both when `enable` is 0 and 1.

**Simulation Notes:**  
To simulate:
- Run `decoder_2to4_tb.v` in Vivado, Icarus Verilog, or ModelSim
- Observe output `y` for different combinations of `a` and `enable`

**Status:**  
✅ Logic tested  
✅ Testbench provided  
✅ Ready for deployment
