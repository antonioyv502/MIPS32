`include "MyDefines.v"

module mips32_ctrl(clk, rst, op , func, zero, aluop, pc_rst, pc_clk, wreg, wreg_clk, wreg_src, aluB_src, pc_src, branch);

    input        clk, rst;
    input  [5:0] op;
    input  [5:0] func;
	 input        zero;      // comes from zero flag from ALU, 
    output [6:0] aluop;
	 output       pc_src;
    output       pc_rst, pc_clk;
    output       wreg, wreg_clk;  
    output       wreg_src, aluB_src;
	 output       branch;    
    
    reg [6:0] aluop;
	 reg       pc_src;      // 0: PC + 4, 1: 
    reg       pc_rst, pc_clk;
    reg       wreg, wreg_clk;
    reg       wreg_src, aluB_src;
	 reg       branch;     // beq instruction
    
     
   
    //Defining States
    parameter S_IDLE = 3'd0,
              S_IF   = 3'd1, //Fetch
              S_ID   = 3'd2, //Decode
              S_EXE  = 3'd3, //Execute
              S_MEM  = 3'd4, //Memory
              S_WB   = 3'd5; //Write back to register
              
    reg [2:0] state;
    

    
    //Single block FSM(state register logic, nextstate logic, output logic)
    
    always @(posedge clk or posedge rst) begin //asynchronous reset
        if(rst == `RST_ENABLE) begin 
            //Set all outputs signals to default value
            state    <= S_IDLE;
            aluop    <= 7'b0;
            wreg_clk <= 1'b0;
            wreg     <= 1'b0;
            wreg_src <= 1'b0;
            aluB_src <= 1'b0;
            
            pc_rst   <= 1'b1;
            pc_clk   <= 1'b0;
        end else begin
            case(state)
                S_IDLE: begin  
                    state <= S_IF; //next state is Fetch
                    pc_rst   <= 1'b1;
                    pc_clk   <= 1'b0;
                    wreg_clk <= 1'b0;
                    wreg     <= 1'b0;
                end
                
                S_IF: begin 
                    state    <= S_ID; //next state is Decode
                    pc_rst   <= 1'b0;
                    pc_clk   <= 1'b1;
                    wreg_clk <= 1'b0;  
                end 
                
                S_ID: begin 
                    state    <= S_EXE; //next state is Execute(ALU)
                    pc_clk   <= 1'b0;
                end 
                
                S_EXE: begin 
                    state <= S_WB;  //next state is Write back
                    
                    if (op == 6'b000000) begin 
                        //r-type instruction op code is 0, so based on function
                        aluB_src <= 0;  
                        
                        case(func)
                            6'b100000: begin 
                                aluop <= `ALUOP_ADD;
                            end
                            6'b100010: begin 
                                aluop <= `ALUOP_SUB;
                            end 
                            
                            6'b100100: begin 
                                aluop <= `ALUOP_AND;
                            end 
                            6'b100101: begin 
                                aluop <= `ALUOP_OR;
                            end 
                            6'b100110: begin 
                                aluop <= `ALUOP_XOR;  
                            end 
                            6'b100111: begin 
                                aluop <= `ALUOP_NOR;
                            end
                            
                            default: begin 
                                aluop <= 7'b0;
                            end    
                        endcase 
                        
                    end else begin 
                        //i-type instruction, no function, so based on opcode
                        aluB_src <= 1;  
                        
                        case(op)
                            6'b001000: begin          // addi
                                aluop <= `ALUOP_ADD;
                            end
                            6'b001101: begin 
                                aluop <= `ALUOP_OR;   // ori
                            end 
                            
                            6'b001100: begin 
                                aluop <= `ALUOP_AND;  //andi
                            end
									 
							6'b000100: begin          // beq(branch)
                                aluop <= `ALUOP_SUB;
                            end
                            
                            default: begin 
                                aluop <= 7'b0;
                            end  
                        endcase 
                    end 
                end 
                
                S_WB: begin
                    state     <= S_IF;    //next state is Fetch
                    wreg      <= 1;
                    wreg_clk  <= 1;
                    
                    if (op == 6'b000000) begin 
                        wreg_src <= 1;    // r-type instruction (rd)
                    end else if (op == 6'b001000 || op == 6'b001101 || op == 6'b001100) begin  
                        wreg_src <= 0;    // i-type instruction (rt)
                    end
                end 
                
                default: begin
                    state    <= S_IDLE;
                    aluop    <= 7'b0;
                    pc_rst   <= 1'b0;
                    pc_clk   <= 1'b0;
                    wreg     <= 1'b0;
                    wreg_clk <= 1'b0;
                    wreg_src <= 1'b0;
                    aluB_src <= 1'b0;
                    //set all outputs to 0
                end 
            endcase
        end 
    end 
endmodule 
