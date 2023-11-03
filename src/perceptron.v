`default_nettype none

module perceptron (
    input wire [2:0] edges,
    input wire [3:0] curves,
    output wire [3:0] out
);
    // Max sum value is 256
    reg[7:0] sum;
    reg[3:0] out_reg;
    reg[7:0] edge_reg, curve_reg;
    // Weights are in order: 8, 2, 8, 2, making it easier since only shifts are needed
    assign edge_reg = edges;
    assign curve_reg = curves;
    always @(*) begin
        sum = (edge_reg << 1) + (curve_reg << 3);
        if(sum == 32)begin
            out_reg = 4'b00;
        end
        else if(sum==2)begin
            out_reg = 4'b1;
        end
        else if(sum==20)begin
            out_reg = 4'b10;
        end
        else if(sum==34)begin
            out_reg = 4'b11;
        end
        else if(sum==6)begin
            out_reg = 4'b100;
        end
        else if(sum==28)begin
            out_reg = 4'b101;
        end
        else if(sum==40)begin
            out_reg = 4'b110;
        end
        else if(sum==4)begin
            out_reg = 4'b111;
        end
        else if(sum==64)begin
            out_reg = 4'b1000;
        end
        else if(sum==26)begin
            out_reg = 4'b1001;
        end
        else begin
            // out_reg = 4'b1111;
            out_reg = curve_reg;
        end
    end
    assign out = out_reg;

endmodule

