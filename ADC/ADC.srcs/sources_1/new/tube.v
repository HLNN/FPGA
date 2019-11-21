`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2019 09:22:13 PM
// Design Name: 
// Module Name: tube
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


module tube(
    input clk,
    input update,
    input [3:0] num_0,
    input [3:0] num_1,
    input [3:0] num_2,
    input [3:0] num_3,
    output reg [7:0] out, // dp, g, f, e, d, c, b, a
    output reg [3:0] led
    );
    
//    reg [7:0] tube_0;
//    reg [7:0] tube_1;
//    reg [7:0] tube_2;
//    reg [7:0] tube_3;
    
    
//    always@(posedge update)
//    begin
//        case(num_0)
//            4'b0000: tube_0 = 8'b00111111;
//            4'b0001: tube_0 = 8'b00000110;
//            4'b0010: tube_0 = 8'b01011011;
//            4'b0011: tube_0 = 8'b01001111;
//            4'b0100: tube_0 = 8'b01100110;
//            4'b0101: tube_0 = 8'b01101101;
//            4'b0110: tube_0 = 8'b01111101;
//            4'b0111: tube_0 = 8'b00000111;
//            4'b1000: tube_0 = 8'b01111111;
//            4'b1001: tube_0 = 8'b01101111;
//            4'b1010: tube_0 = 8'b01110111;
//            4'b1011: tube_0 = 8'b01111100;
//            4'b1100: tube_0 = 8'b00111001;
//            4'b1101: tube_0 = 8'b01011110;
//            4'b1110: tube_0 = 8'b01111001;
//            4'b1111: tube_0 = 8'b01110001;
//            default: tube_0 = 8'b00000000;
//        endcase 
        
//        case(num_1)
//            4'b0000: tube_1 = 8'b00111111;
//            4'b0001: tube_1 = 8'b00000110;
//            4'b0010: tube_1 = 8'b01011011;
//            4'b0011: tube_1 = 8'b01001111;
//            4'b0100: tube_1 = 8'b01100110;
//            4'b0101: tube_1 = 8'b01101101;
//            4'b0110: tube_1 = 8'b01111101;
//            4'b0111: tube_1 = 8'b00000111;
//            4'b1000: tube_1 = 8'b01111111;
//            4'b1001: tube_1 = 8'b01101111;
//            4'b1010: tube_1 = 8'b01110111;
//            4'b1011: tube_1 = 8'b01111100;
//            4'b1100: tube_1 = 8'b00111001;
//            4'b1101: tube_1 = 8'b01011110;
//            4'b1110: tube_1 = 8'b01111001;
//            4'b1111: tube_1 = 8'b01110001;
//            default: tube_1 = 8'b00000000;
//        endcase 
        
//        case(num_2)
//            4'b0000: tube_2 = 8'b00111111;
//            4'b0001: tube_2 = 8'b00000110;
//            4'b0010: tube_2 = 8'b01011011;
//            4'b0011: tube_2 = 8'b01001111;
//            4'b0100: tube_2 = 8'b01100110;
//            4'b0101: tube_2 = 8'b01101101;
//            4'b0110: tube_2 = 8'b01111101;
//            4'b0111: tube_2 = 8'b00000111;
//            4'b1000: tube_2 = 8'b01111111;
//            4'b1001: tube_2 = 8'b01101111;
//            4'b1010: tube_2 = 8'b01110111;
//            4'b1011: tube_2 = 8'b01111100;
//            4'b1100: tube_2 = 8'b00111001;
//            4'b1101: tube_2 = 8'b01011110;
//            4'b1110: tube_2 = 8'b01111001;
//            4'b1111: tube_2 = 8'b01110001;
//            default: tube_2 = 8'b00000000;
//        endcase 
        
//        case(num_3)
//            4'b0000: tube_3 = 8'b00111111;
//            4'b0001: tube_3 = 8'b00000110;
//            4'b0010: tube_3 = 8'b01011011;
//            4'b0011: tube_3 = 8'b01001111;
//            4'b0100: tube_3 = 8'b01100110;
//            4'b0101: tube_3 = 8'b01101101;
//            4'b0110: tube_3 = 8'b01111101;
//            4'b0111: tube_3 = 8'b00000111;
//            4'b1000: tube_3 = 8'b01111111;
//            4'b1001: tube_3 = 8'b01101111;
//            4'b1010: tube_3 = 8'b01110111;
//            4'b1011: tube_3 = 8'b01111100;
//            4'b1100: tube_3 = 8'b00111001;
//            4'b1101: tube_3 = 8'b01011110;
//            4'b1110: tube_3 = 8'b01111001;
//            4'b1111: tube_3 = 8'b01110001;
//            default: tube_3 = 8'b00000000;
//        endcase
//    end
    
    
    reg [20:0] count;
    reg [1:0] disSelect;
    
    always@(posedge clk)
    begin
        if(count == 20'h186a0) // 1ms
            begin
                count = 20'h0;
                case(disSelect)
                    2'b00: disSelect = 2'b01;
                    2'b01: disSelect = 2'b10;
                    2'b10: disSelect = 2'b11;
                    2'b11: disSelect = 2'b00;
                    default: disSelect = 2'b00;
                endcase
            end
        else
            count = count + 1'h1;
    end
    
    
    always@(disSelect)
        begin
            case(disSelect)
                2'b00: 
                    begin
                        led = 4'b0000;
                        case(num_0)
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
                        led = 4'b0001;
                    end
                2'b01: 
                    begin
                        led = 4'b0000;
                        case(num_1)
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
                        led = 4'b0010;
                    end
                2'b10: 
                    begin
                        led = 4'b0000;
                        case(num_2)
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
                        led = 4'b0100;
                    end
                2'b11: 
                    begin
                        led = 4'b0000;
                        case(num_3)
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
                        led = 4'b1000;
                    end
            endcase
        end
endmodule