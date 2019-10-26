`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2019 11:24:21 AM
// Design Name: 
// Module Name: calculator
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


module calculator(
    input clk,
    input [7:0] x,
    input [7:0] y,
    output reg [15:0] result,
    input key_pulse,
    output [7:0] out, // dp, g, f, e, d, c, b, a
    output [3:0] led
    );
    
    
    reg [1:0] op;
    
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
        
    
    
    reg update;
    
    always@(x, y, op)
        begin
            update = 0;
            case(op)
                2'b00: result = x + y;
                2'b01: result = x - y;
                2'b10: result = x * y;
                2'b11: result = x / y;
                default: result = 16'b0000000000000000;
            endcase
            update = 1;
        end 
        
    
    
    
    tube display(
        .clk(clk),
        .update(update),
        .num_0(result[3:0]),
        .num_1(result[7:4]),
        .num_2(result[11:8]),
        .num_3(result[15:12]),
        .out(out),
        .led(led)
    );
endmodule
