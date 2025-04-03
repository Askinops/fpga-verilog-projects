### 📟 `hex_to_7seg`

**Description:**  
This module converts a 4-bit hexadecimal input into an active-low 7-segment output with optional decimal point support.

**Ports:**
- `input [3:0] hex` – hexadecimal input (0–F)
- `input dp` – decimal point control (active-low)
- `output [7:0] sseg` – active-low segment output, where:
  - `sseg[6:0]` → segments A to G
  - `sseg[7]` → decimal point (DP)

**Features:**
- 🔁 Supports all hex values from 0 to F
- 🔧 Decimal point control via `dp` input
- 🧱 Designed with clear active-low segment mappings
- 🛡️ Includes default safety output (`all segments off`)

**Example Outputs:**

| `hex` | `sseg[6:0]` | Character |
|-------|-------------|-----------|
| 4'h0  | `1000000`   | 0         |
| 4'hA  | `0001000`   | A         |
| 4'hF  | `0001110`   | F         |

**Status:**  
✅ Complete and reusable core module  
⚠️ Testbench not yet included (can be added later)

---