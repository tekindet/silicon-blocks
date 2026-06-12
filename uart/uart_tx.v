module uart_tx #(
    parameter CLK_FREQ = 50_000_000,
    parameter BAUD_RATE = 115_200
)(
    input wire clk,
    input wire rst,
    input wire send,
    input wire [7:0] data,
    output reg tx,
    output reg busy,
);

    localparam BITS_PER_BAUD = CLK_FREQ / BAUD_RATE;

endmodule

