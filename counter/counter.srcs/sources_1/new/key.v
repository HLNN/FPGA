`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2019 10:42:17 PM
// Design Name: 
// Module Name: counter
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


module key(clk, key, key_pulse);

input clk;
input key;
output key_pulse;

reg key_rst;
reg key_rst_pre;
wire key_edge;

always@(posedge clk)
    begin
        key_rst = key;
        key_rst_pre = key_rst;
    end

assign key_edge = key_rst_pre & ~key_rst;

reg [21:0]count;

always@(posedge clk)
    begin
        if(key_edge)
            count = 21'h0;
        else
            count = count + 1'h1;
    end

reg key_sec_pre;
reg key_sec;

always@(posedge clk)
    if(count == 21'h1e8480) // 20ms
        key_sec = key;

always@(posedge clk)
    key_sec_pre = key_sec;
    
assign key_pulse = key_sec_pre & ~key_sec;

endmodule
