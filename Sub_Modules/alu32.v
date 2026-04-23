`include "MyDefines.v"

module alu32(aluA, aluB, alu_op, alu_result, flag_Z, flag_N, flag_V, flag_C);

    input  [31:0] aluA;
    input  [31:0] aluB;
    input  [6:0]  alu_op;
    
    output [31:0] alu_result;
    output        flag_Z;       //zero flag 
    output        flag_N;       //negative flag
    output        flag_V;       //overflow flag
    output        flag_C;       //carryout flag
    
    
    reg [31:0] alu_result;
    reg        flag_V;          //overflow flag
    reg        flag_C;          //carryout flag

    assign flag_Z = (alu_result == 0);
    assign flag_N = alu_result[31];  //Negative if MSB is 1

    always @(*) begin 
        flag_V = 1'b0;
        flag_C = 1'b0;
    
        case(alu_op)
            `ALUOP_ADD: begin 
                {flag_C, alu_result} = aluA + aluB;
                flag_V = (aluA[31] == aluB[31]) && (alu_result[31] != aluA[31]);
            end
            
            `ALUOP_SUB: begin
                {flag_C, alu_result} = aluA - aluB;
                //alu_result = aluA - aluB;
                flag_V = (aluA[31] != aluB[31]) && (alu_result[31] != aluA[31]);
            end
            
            `ALUOP_AND: begin 
                alu_result = aluA & aluB;
                
            end
            
            `ALUOP_OR: begin 
                alu_result = aluA | aluB;
            end
            
            `ALUOP_XOR: begin 
                alu_result = aluA ^ aluB;
            end
            
            `ALUOP_NOR: begin 
                alu_result = ~ (aluA | aluB);
            end
            
            default: begin 
                alu_result = 32'b0;
                flag_V = 1'b0;
                flag_C = 1'b0;
            end 
        endcase
    end   
endmodule 
