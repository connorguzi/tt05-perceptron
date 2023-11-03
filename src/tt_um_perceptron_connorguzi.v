`default_nettype none

module tt_um_perceptron_connorguzi #( parameter MAX_COUNT = 24'd10_000_000 ) (
    input  wire [7:0] ui_in,    // Dedicated inputs - connected to the input switches
    output wire [7:0] uo_out,   // Dedicated outputs - connected to the 7 segment display
    input  wire [7:0] uio_in,   // IOs: Bidirectional Input path
    output wire [7:0] uio_out,  // IOs: Bidirectional Output path
    output wire [7:0] uio_oe,   // IOs: Bidirectional Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

    assign uio_oe = 8'b11111111;
    assign uio_out = 8'b0;
    // assign uo_out[7:4] = 4'b0;
    // instantiate segment display
    // perceptron perceptron(.edges(ui_in[2:0]), .curves(ui_in[6:3]), .out(uo_out[3:0]));
    perceptron perceptron(.edges(ui_in[6:4]), .curves(ui_in[3:0]), .out(uo_out[3:0]));
    bnn bnn(.in(ui_in[6:0]), .out(uo_out[7:4]));


endmodule
