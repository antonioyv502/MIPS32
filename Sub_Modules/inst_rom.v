`include "MyDefines.v"


module inst_rom(ce, addr, inst);
    input  ce;                     // chip enable
    input  [`INST_ADDRBUS] addr;   // address 32 bits
    output [`INST_DATABUS] inst;   // data 32 bits
    
    reg [`INST_DATABUS] inst;
    
    reg [`INST_DATABUS] instmem [0:10];
    
    initial $readmemh("C:/BAT/CSULA/EE_4480/16_MIPS32_V1/Source/inst_rom.data", instmem); //need to make inst_rom.data file
    
    always @(*) begin 
        if (ce === `CHIP_DISABLE) begin 
            inst = 32'd0;
        end else begin
            inst = instmem[ addr[15:2] ];
        end 
    end    
endmodule
