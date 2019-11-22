`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/07/2019 06:46:07 PM
// Design Name: 
// Module Name: top
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


module top(
    input clk,
    output [7:0] out,
    output ile,
    output cs,
    output wr1,
    output wr2,
    output xfer
    );
    
    
    DAC0832 DAC0832(
        .clk(clk),
        .out(out),
        .ile(ile),
        .cs(cs),
        .wr1(wr1),
        .wr2(wr2),
        .xfer(xfer)
    );
    
endmodule
