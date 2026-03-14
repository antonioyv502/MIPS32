`include "MyDefines.v"


module sign_ext(int16, int32);
    input  [15:0] int16;
    output [31:0] int32;
    
    assign int32 = {{16{int16[15]}}, int16}; //replicating MSB of int16, 16 times

    
endmodule 