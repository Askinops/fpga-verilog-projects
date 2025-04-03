### `decoder_4to16`

**Description:**  
A 4-to-16 decoder constructed using hierarchical design. It uses four instances of a `decoder_2to4` module to produce a 16-bit one-hot output based on a 4-bit input `a` and an `enable` signal.

**Ports:**
- `input [3:0] a` – 4-bit input address
- `input enable` – active-high enable control
- `output [15:0] y` – one-hot 16-bit output

**Design Structure:**
- The decoder is built using 4 × `decoder_2to4` modules
- The 4-bit input is split into upper 2 bits (`a[3:2]`) and lower 2 bits (`a[1:0]`)
- Each `decoder_2to4` instance activates one group of 4 outputs

**Testbench:**
- `decoder_4to16_tb.v` included
- Basic tests are run for several input combinations
- Uses `$dumpfile` and `$display` for waveform and output inspection

**Status:**  
✅ Modular design using hierarchy  
✅ Logic verified  
✅ Testbench provided  
✅ Recommended for demonstration