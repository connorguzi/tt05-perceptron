`default_nettype none

module perceptron (
    input wire [2:0] edges,
    input wire [3:0] curves,
    output wire [3:0] out
);
    // Max sum value is 256
    reg[7:0] sum;
    // Weights are in order: 8, 2, 8, 2, making it easier since only shifts are needed
    assign sum = edges >> 1 + curves >> 3;
    
    if(sum == 32)begin
        out = 8'b00000000
    end
    else if(sum==2)begin
        out = 8'b1
    end
    else if(sum==20)begin
        out = 8'b10
    end
    else if(sum==34)begin
        out = 8'b11
    end
    else if(sum==6)begin
        out = 8'b100
    end
    else if(sum==28)begin
        out = 8'b101
    end
    else if(sum==40)begin
        out = 8'b110
    end
    else if(sum==4)begin
        out = 8'b111
    end
    else if(sum==64)begin
        out = 8'b1000
    end
    else if(sum==26)begin
        out = 8'b1001
    end
endmodule

