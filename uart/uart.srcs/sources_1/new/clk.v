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

module uart_clk(
    input clk,
    output reg clk_out
    );
    localparam Baud_Rate=9600;
    localparam div_num='d100_000_000/Baud_Rate;
    
    reg [15:0] num;
    
    always@(posedge clk)
        begin
            if(num == div_num)
                begin
                    num = 0;
                    clk_out = 1;
                end
            else
                begin
                    num = num + 1;
                    clk_out = 0;
                end
        end
endmodule
