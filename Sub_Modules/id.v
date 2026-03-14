`include "MyDefines.v"

//instructon decoder 
module id(inst, op, rs, rt, rd, shamt, func, imm16, addr26);

input [31:0] inst;

output [5:0]  op;
output [4:0]  rs;
output [4:0]  rt;
output [4:0]  rd;
output [4:0]  shamt;
output [5:0]  func;

output [15:0] imm16;

output [25:0] addr26;

assign op     =  inst[31:26];
assign rs     =  inst[25:21];
assign rt     =  inst[20:16];
assign rd     =  inst[15:11];
assign shamt  =  inst[10:6];
assign func   =  inst[5:0]; 
assign imm16  =  inst[15:0];
assign addr26 =  inst[25:0];

endmodule 