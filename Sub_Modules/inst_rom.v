`include "MyDefines.v"


module inst_rom(ce, addr, inst);
    input  ce;
    input  [`INST_ADDRBUS] addr;
    output [`INST_DATABUS] inst;
    
    reg [`INST_DATABUS] inst;
    
    reg [`INST_DATABUS] instmem [0:65535];
    
    //initial $readmemh("inst_rom.data", instmem); //need to make inst_rom.data file
    
    always @(*) begin 
        if (ce === `CHIP_DISABLE) begin 
            inst = 32'd0;
        end else begin
            inst = instmem[ addr[15:0] ];
        end 
    end    
endmodule