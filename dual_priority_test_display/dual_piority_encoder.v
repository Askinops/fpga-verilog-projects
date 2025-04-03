module dual_piority_encoder(
    input wire [11:0] req,
    output reg [3:0] first,
    output reg [3:0] second
);
    
    integer i, j;
    reg found;

    always @* begin 
        first = 4'd0;
        second = 4'd0;
        found = 1'b0;
        
        for(i = 11; i >= 0; i = i - 1) begin
            if (!found && req[i]) begin
                first = i[3:0];
                found = 1'b1;

                for(j = i - 1; j >= 0; j = j - 1) begin
                    if(req[j]) begin
                        second = j[3:0];
                        j = -1; // iç döngüyü kır
                    end
                end
            end
        end
    end

endmodule
