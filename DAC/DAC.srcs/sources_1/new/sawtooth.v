`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2019 11:09:57 PM
// Design Name: 
// Module Name: sawtooth
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


module sawtooth(
    input clk,
    output reg [7:0] out
    );
    
    reg [15:0] count;
    
    always@(posedge clk)
        begin 
            if(count == 16'hffff)
                begin
                    count = 16'h0000;
                    out = out + 1'b1;                
                end
            else
                begin
                    count = count + 1'b1;
                end
        end
        
endmodule
