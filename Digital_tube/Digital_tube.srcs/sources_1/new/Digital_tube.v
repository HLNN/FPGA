`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2019 09:15:25 PM
// Design Name: 
// Module Name: Digital_tube
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


module Digital_tube(
    input [3:0] a,
    input enable,
    output reg [7:0] out, // dp, g, f, e, d, c, b, a
    output reg led
    );
    
    always@(a, enable)
        begin
            if(enable == 1)
                begin
                    led = 0;
                    case(a)
                        4'b0000: out = 8'b00111111;
                        4'b0001: out = 8'b00000110;
                        4'b0010: out = 8'b01011011;
                        4'b0011: out = 8'b01001111;
                        4'b0100: out = 8'b01100110;
                        4'b0101: out = 8'b01101101;
                        4'b0110: out = 8'b01111101;
                        4'b0111: out = 8'b00000111;
                        
                        4'b1000: out = 8'b01111111;
                        4'b1001: out = 8'b01101111;
                        4'b1010: out = 8'b01110111;
                        4'b1011: out = 8'b01111100;
                        4'b1100: out = 8'b00111001;
                        4'b1101: out = 8'b01011110;
                        4'b1110: out = 8'b01111001;
                        4'b1111: out = 8'b01110001;
                        default: out = 8'b00000000;
                    endcase
                    led = 1;
                end
            else
                begin
                    led = 0;
                    out = 8'b00000000;
                end
        end
endmodule
