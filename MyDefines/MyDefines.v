//Global definitions
//Control Signals

`define RST_ENABLE      1'b1
`define RST_DISABLE     1'b0
`define WRITE_ENABLE    1'b1
`define WRITE_DISABLE   1'b0
`define TRUE            1'b1
`define FALSE           1'b0
`define CHIP_ENABLE     1'b1
`define CHIP_DISABLE    1'b0


//Register File
`define REG_ADDRBUS           4:0
`define REG_DATABUS           31:0
`define REG_DATABUS_WIDTH     32
`define REG_NUM               32
`define REG_NUM_WIDTH         5
`define REG_ZERO              5'b0



//OPCODE [31:26]

`define OP_R_TYPE             6'b000000
`define OP_ADDI               6'b001000
`define OP_ORI                6'b001101 


//func [5:0] R-Type
`define FUNC_ADD              6'b100000
`define FUNC_SUB              6'b100010
`define FUNC_AND              6'b100100
`define FUNC_OR               6'b100101
`define FUNC_XOR              6'b100110
`define FUNC_NOR              6'b100111


//Instruction  ROM(InsROM)
`define INST_ADDRBUS          31:0
`define INST_DATABUS          31:0


//OPCODE for ALU

`define ALUOP_ADD              7'd1
`define ALUOP_SUB              7'd2
`define ALUOP_AND              7'd3
`define ALUOP_OR               7'd4
`define ALUOP_XOR              7'd5
`define ALUOP_NOR              7'd6
