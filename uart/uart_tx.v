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

    localparam BIT_TICKS = CLK_FREQ / BAUD_RATE;

    reg [$clog2(BIT_TICKS) - 1:0] counter;
    reg [7:0]                     shift_reg;
    reg [3:0]                     bit_idx;
    reg                           active;

    assign busy = active;

    always @(posedge clk) begin
      if(rst) begin
        active <= 1'b0;
        tx <= 1'b1;
        counter <= 0;
        bit_idx = 0;

      end else if(send && !active) begin
        shift_reg <= data;

        active <= 1'b1;
        tx <= 1'b0; 

        counter <= 0;
        bit_idx <= 0;

      end else if(active) begin

        if(counter == BITS_TICK - 1) begin

          counter <= 0;

          if(bit_idx < 8) begin

            tx <= shift_reg[0];
            shift_reg <= shift_reg >> 1;
            bit_idx <= bit_idx + 1;

          end else begin
            active <= 1'b0;
            tx <= 1'b1;
          end
        end else begin
          counter <= counter + 1;
        end
      end
    end

endmodule

