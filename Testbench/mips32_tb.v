`timescale 1ns/1ps


module mips32_tb();
    reg clk, rst;
    
    mips32_top DUT (.clk(clk), .rst(rst));
    
    
    initial begin 
        clk = 1'b0;
        forever #5 clk = ~clk;
    end
    
    
    initial begin 
        rst = 1'b1;
        #20 rst = 1'b0;
       
        #500 $stop;
    end 
endmodule
