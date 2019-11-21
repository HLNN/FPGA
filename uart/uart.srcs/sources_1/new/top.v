`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/07/2019 03:17:32 PM
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
    input rx,
    output tx
    );
    
    wire clk_9600;
    wire ack;
    wire [7:0] data;
    
    uart_tx uart_tx(
        .clk(clk_9600),
        .ack(ack),
        .data_o(data),
        .tx(tx)
        );
    uart_rx uart_rx(
        .clk(clk_9600),
        .rx(rx),
        .data_i(data),
        .ack(ack)
        );
    uart_clk uart_clk(
        .clk(clk),
        .clk_out(clk_9600)
        );
    
endmodule
