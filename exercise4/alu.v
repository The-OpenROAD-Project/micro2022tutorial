module alu #(
  parameter WIDTH = 12
)(
  input  wire             clk,   // Clock
  input  wire             rst,   // Active-high reset
  input  wire [WIDTH-1:0] a, b,  // ALU operands                 
  input  wire [      3:0] sel,   // ALU function select
  output reg  [WIDTH-1:0] out    // ALU output
);

  // Define functions
  localparam ADD  = 4'h0; // Addition
  localparam SUB  = 4'h1; // Subtraction
  localparam MULT = 4'h2; // Multiplication
  localparam DIV  = 4'h3; // Division
  localparam LSL  = 4'h4; // Logical shift left
  localparam LSR  = 4'h5; // Logical shift right
  localparam RL   = 4'h6; // Rotate left
  localparam RR   = 4'h7; // Rotate right
  localparam AND  = 4'h8; // Bitwise AND
  localparam OR   = 4'h9; // Bitwise OR
  localparam XOR  = 4'ha; // Bitwise XOR
  localparam NOR  = 4'hb; // Bitwise NOR
  localparam NAND = 4'hc; // Bitwise NAND
  localparam XNOR = 4'hd; // Bitwise XNOR
  localparam GT   = 4'he; // Signed greater than
  localparam EQ   = 4'hf; // Equal

  always @(posedge clk) begin
    if(rst) begin
      out <= WIDTH'b0;
    end else begin
      case(sel)
        ADD : out <= a + b; 
        SUB : out <= a - b;
        MULT: out <= a * b;
        DIV : out <= a / b;
        LSL : out <= a << 1;
        LSR : out <= a >> 1;
        RL  : out <= {a[WIDTH-2:0],a[WIDTH-1]};
        RR  : out <= {a[0],a[WIDTH-1:1]};
        AND : out <= a & b;
        OR  : out <= a | b;
        XOR : out <= a ^ b;
        NOR : out <= ~(a | b);
        NAND: out <= ~(a & b);
        XNOR: out <= ~(a ^ b);
        GT  : out <= $signed(a) > $signed(b);
        EQ  : out <= a == b;
      endcase
    end
  end

endmodule
