`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2019 09:22:13 PM
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
    input sdata,
    input clk,
    output cs,
    output sclk,
    output [7:0] out, // dp, g, f, e, d, c, b, a
    output [3:0] led
    );
    
    
    adc adc(
        .clk(clk),
        .sdata(sdata),
        .cs(cs),
        .sclk(sclk),
        .out(out),
        .led(led)
        );
        
endmodule
