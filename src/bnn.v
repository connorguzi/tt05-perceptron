`default_nettype none

module bnn (
    input wire [6:0] in,
    output wire [3:0] out
);
    reg [3:0] out_reg;
    reg [6:0] result0, result1, result2, result3, result4, result5, result6, result7, result8, result9;
    reg [6:0] weight0, weight1, weight2, weight3, weight4, weight5, weight6, weight7, weight8, weight9;
    assign weight0 = 7'b1111011;
    assign weight1 = 7'b1101111;
    assign weight2 = 7'b1011101;
    assign weight3 = 7'b1101011;
    assign weight4 = 7'b1001111;
    assign weight5 = 7'b1011100;
    assign weight6 = 7'b1111010;
    assign weight7 = 7'b1011111;
    assign weight8 = 7'b1110111;
    assign weight9 = 7'b1101100;

    assign result0 = ~(weight0 ^ in);
    assign result1 = ~(weight1 ^ in);
    assign result2 = ~(weight2 ^ in);
    assign result3 = ~(weight3 ^ in);
    assign result4 = ~(weight4 ^ in);
    assign result5 = ~(weight5 ^ in);
    assign result6 = ~(weight6 ^ in);
    assign result7 = ~(weight7 ^ in);
    assign result8 = ~(weight8 ^ in);
    assign result9 = ~(weight9 ^ in);

    always @(*) begin
        if(result0 == 0)begin
            out_reg = 4'b00;
        end
        else if(result1 == 0)begin
            out_reg = 4'b0001;
        end
        else if(result2 == 0)begin
            out_reg = 4'b0010;
            // out_reg = 4'b0111;
        end
        else if(result3 == 0)begin
            out_reg = 4'b0011;
        end
        else if(result4 == 0)begin
            out_reg = 4'b0100;
        end
        else if(result5 == 0)begin
            out_reg = 4'b0101;
        end
        else if(result6 == 0)begin
            out_reg = 4'b0110;
        end
        else if(result7 == 0)begin
            out_reg = 4'b0111;
        end
        else if(result8 == 0)begin
            out_reg = 4'b1000;
        end
        else if(result9 == 0)begin
            out_reg = 4'b1001;
        end
        else begin
            out_reg = 4'b1111;
        end
    end
    assign out = out_reg;
endmodule