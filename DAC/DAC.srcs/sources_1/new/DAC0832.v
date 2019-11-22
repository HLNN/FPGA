`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/07/2019 06:46:07 PM
// Design Name: 
// Module Name: DAC0832
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module DAC0832(
    input clk,
    output [7:0] out,
    output reg ile,
    output reg cs,
    output reg wr1,
    output reg wr2,
    output reg xfer
    );
    
    always@(*)
        begin
            ile = 1;
            cs = 0;
            wr1 = 0;
            wr2 = 0;
            xfer = 0;
        end
        
    sin sin(
        .clk(clk),
        .out(out)
    );
    
//    sawtooth sawtooth(
//        .clk(clk),
//        .out(out)
//    );
    
//    square square(
//        .clk(clk),
//        .out(out)
//    );
    
    reg[7:0]  pout;
    
    initial begin
        ile=1;
        cs=0;
        wr1=0;
        wr2=0;
        xfer=0;
    end
    
endmodule
