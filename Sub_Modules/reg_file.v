`include "MyDefines.v"


module reg_file(clk, we, reg1, reg2, wreg, wdata, reg1_data, reg2_data);

    input         clk, we;
    input  [4:0]  reg1;
    input  [4:0]  reg2;
    input  [4:0]  wreg;
    input  [31:0] wdata;
    
    output [31:0] reg1_data;
    output [31:0] reg2_data;
    
    reg [31:0] regmem [0:31];
    
    assign reg1_data = (reg1 == 5'd0) ? 32'b0 : regmem[reg1] ;
    assign reg2_data = (reg2 == 5'd0) ? 32'b0 : regmem[reg2] ;
    
    always @(posedge clk) begin 
        if (we == `WRITE_ENABLE) begin 
            //write data to register
            regmem[wreg] <= wdata;
        end  
    end 
endmodule