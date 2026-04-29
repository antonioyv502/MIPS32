`include "MyDefines.v"

module zero_ext(imm16, imm32);

input  [15:0] imm16;
output [31:0] imm32;

assign imm32 = {{16{1'b0}},imm16};  //replicating 16 zeros


endmodule
