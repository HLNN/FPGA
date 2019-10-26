`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2019 11:22:27 AM
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
    input [7:0] x,
    input [7:0] y,
    input key,
    
    output [7:0] out, // dp, g, f, e, d, c, b, a
    output [3:0] led,
    output [15:0] result
    );
    
    
    wire key_pulse;
    
    key key_gen(
        .clk(clk),
        .key(key),
        .key_pulse(key_pulse)
    );
    
    
    
    
//    wire [15:0] result;
    
    calculator cal(
        .clk(clk),
        .x(x),
        .y(y),
        .key_pulse(key_pulse),
        .result(result),
        .out(out),
        .led(led)
    );
    
    
//    assign num_0 = result[3:0];
//    assign num_1 = result[7:4];
//    assign num_2 = result[11:8];
//    assign num_3 = result[15:12];
    
//    reg update_sec_pre;
//    reg update_sec;
    
//    always@(result)
//        update_sec = 1;
    
//    always@(posedge clk)
//        update_sec = update_sec_pre;
        
//    assign update = update_sec_pre & ~update_sec;

    
endmodule
