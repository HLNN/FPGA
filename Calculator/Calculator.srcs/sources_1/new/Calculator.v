`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2019 10:33:09 PM
// Design Name: 
// Module Name: Calculator
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


module Calculator(
    input clk,
    input [7:0] x,
    input [7:0] y,
    output reg [15:0] out,
    input key
    );
    
    wire key_pulse;
    reg [1:0] op;
    
    key key_gen(
        .clk(clk),
        .key(key),
        .key_pulse(key_pulse)
    );
    
    
    always@(posedge clk)
        begin
            if(key_pulse)
                begin
                    case(op)
                        2'b00: op = 2'b01;
                        2'b01: op = 2'b10;
                        2'b10: op = 2'b11;
                        2'b11: op = 2'b00;
                        default: op = 2'b00;
                    endcase
                end
        end
        
    always@(x, y, op)
        begin
            case(op)
                2'b00: out = x + y;
                2'b01: out = x - y;
                2'b10: out = x * y;
                2'b11: out = x / y;
                default: out = 16'b0000000000000000;
            endcase
        end 
        
endmodule
