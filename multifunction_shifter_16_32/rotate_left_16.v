module rotate_left_16(
    input wire [15:0] a,
    input wire [3:0] amt,
    output reg [15:0] y
);

always @* begin
    case (amt)
        4'd0:  y = a;
        4'd1:  y = {a[14:0], a[15]};
        4'd2:  y = {a[13:0], a[15:14]};
        4'd3:  y = {a[12:0], a[15:13]};
        4'd4:  y = {a[11:0], a[15:12]};
        4'd5:  y = {a[10:0], a[15:11]};
        4'd6:  y = {a[9:0],  a[15:10]};
        4'd7:  y = {a[8:0],  a[15:9]};
        4'd8:  y = {a[7:0],  a[15:8]};
        4'd9:  y = {a[6:0],  a[15:7]};
        4'd10: y = {a[5:0],  a[15:6]};
        4'd11: y = {a[4:0],  a[15:5]};
        4'd12: y = {a[3:0],  a[15:4]};
        4'd13: y = {a[2:0],  a[15:3]};
        4'd14: y = {a[1:0],  a[15:2]};
        4'd15: y = {a[0],    a[15:1]};
        default: y = a;
    endcase
end

endmodule
