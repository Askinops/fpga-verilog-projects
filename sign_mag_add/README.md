### ➕ `sign_mag_add`

**Description:**  
A parameterized Verilog module that performs addition of two numbers in **sign-magnitude format**. It handles both same-sign and opposite-sign operations, and outputs the correct result based on the larger magnitude.

**Ports:**
- `input [N-1:0] a` – first operand in sign-magnitude format
- `input [N-1:0] b` – second operand in sign-magnitude format
- `output [N-1:0] sum` – result in sign-magnitude format

**Sign-Magnitude Format:**
- MSB (bit `N-1`) → sign bit (0 = positive, 1 = negative)
- Remaining bits (`N-2:0`) → magnitude

**Behavior:**
- 🟢 If signs match → magnitudes are added
- 🔴 If signs differ → smaller magnitude is subtracted from the larger
- 🛡️ Sign of the larger magnitude is retained

**Example Cases:**

| `a`      | `b`      | `sum`    | Description        |
|----------|----------|----------|--------------------|
| `0011`   | `0010`   | `0101`   | +3 + +2 = +5       |
| `1011`   | `1010`   | `1101`   | -3 + -2 = -5       |
| `0101`   | `1010`   | `0011`   | +5 + -2 = +3       |
| `0101`   | `1101`   | `0000`   | +5 + -5 = 0        |

**Features:**
- ⚙️ Parameterized bit width (`N`)
- 🔁 Works with any sign-magnitude values
- 🧪 Includes extensive testbench (`tb_sign_mag_add.v`)

**Status:**  
✅ Complete and tested  
✅ Ready for reuse  