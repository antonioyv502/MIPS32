`include "MyDefines.v"

module pc_reg(clk, rst, pc, ce);
    input clk, rst;
    output [`INST_ADDRBUS] pc;
    output                 ce;
    
    reg [`INST_ADDRBUS] pc;
    reg                 ce;
    
    
    always @(posedge clk) begin
        if( rst == `RST_ENABLE) begin
            ce <= `CHIP_DISABLE;        
        end else begin     
            ce <= `CHIP_ENABLE;
        end 
    end 

    
    always @(posedge clk) begin 
        if(ce == `CHIP_DISABLE) begin 
            pc <= 32'h0;
        end else begin 
            pc <= pc + 32'd4;  //pc = pc + 4 points to next instruction memory adress 
        end
    end
endmodule 
