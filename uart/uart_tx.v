module uart_tx #(
    parameter CLK_DIV = 4
)(
    input wire clk,
    input wire [7:0] data,
    input wire send,
    output reg tex 
);

