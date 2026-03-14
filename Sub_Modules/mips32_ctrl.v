`include "MyDefines.v"

module mips32_ctrl(clk, rst, op , func, aluop, pc_rst, pc_clk, wreg, wreg_clk, wreg_src, aluB_src);

    input        clk, rst;
    input  [5:0] op;
    input  [5:0] func;
    output [6:0] aluop;
    output       pc_rst, pc_clk;
    output       wreg, wreg_clk;
    output       wreg_src, aluB_src;
    
    reg [6:0] aluop;
    reg       pc_rst, pc_clk;
    reg       wreg, wreg_clk;
    reg       wreg_src, aluB_src;
    
    parameter S_IDLE = 3'd0,
              S_IF   = 3'd1, //Fetch
              S_ID   = 3'd2, //Decode
              S_EXE  = 3'd3, //Execute
              S_MEM  = 3'd4,
              S_WB   = 3'd5; //Write back to register
              
    reg [2:0] state;
    
    
    always @(posedge clk or posedge rst) begin //async reset
        if(rst == `RST_ENABLE) begin 
            //Set all outputs signals to default value
            state    <= S_IDLE;
            aluop    <= 7'b0;
            pc_rst   <= 0;
            pc_clk   <= 0;
            wreg     <= 0;
            wreg_clk <= 0;
            wreg_src <= 0;
            aluB_src <= 0;
        end else begin 
            case(state)
                S_IDLE: begin  
                    state <= S_IF;
                    //update outputs on the state/op/func
                    
                    
                    
                    
                    
                end
                
                S_IF: begin
                    state <= S_ID;
                    //update outputs on the state/op/func
                end 
                
                S_ID: begin 
                    state <= S_EXE;
                    //update outputs on the state/op/func
                end 
                
                S_EXE: begin 
                    state <= S_WB;
                    //update outputs on the state/op/func
                end 
                
                S_WB: begin 
                    state <= S_IDLE;
                    
                    //update outputs on the state/op/func
                end 
                
                default: begin
                    state <= S_IDLE;
                    aluop    <= 7'b0;
                    pc_rst   <= 0;
                    pc_clk   <= 0;
                    wreg     <= 0;
                    wreg_clk <= 0;
                    wreg_src <= 0;
                    aluB_src <= 0;
                    //set all outputs to 0
                end 
            endcase
        end 
    end 
endmodule 