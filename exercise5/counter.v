module counter #(
  parameter WIDTH = 64
)(
  input wire clk,
  input wire rst,
  output reg count
);

  always @(posedge clk) begin
    if(rst) begin
      count <= WIDTH'b0;
    end else begin
      count <= count + WIDTH'b1;
    end
  end

endmodule
