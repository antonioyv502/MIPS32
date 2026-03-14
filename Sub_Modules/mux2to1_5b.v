`include "MyDefines.v"

module mux2to1_5b(in0, in1, sel, out);

    input  [4:0] in0;
    input  [4:0] in1;
    input         sel;
    output [4:0] out;
    
    assign out = (sel == 1'b1) ? in1 : in0;
  
endmodule 