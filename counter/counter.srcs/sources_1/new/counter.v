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


module top(
    input clk,
    input key,
    
    output reg [7:0] out, // dp, g, f, e, d, c, b, a
    output reg [3:0] led
    );
    
    
    wire key_pulse;
    
    key key_gen(
        .clk(clk),
        .key(key),
        .key_pulse(key_pulse)
    );
    
    reg [8:0] count;
    
    always@(posedge clk)
        begin
            if(key_pulse)
                begin
                    if(count == 8'h3c)
                        begin
                             count = 0;
                        end
                    else
                        begin
                            count = count + 1'h1;
                        end
                end
        end
    
    
    reg [20:0] disCount;
    reg [1:0] disSelect;
    
    always@(posedge clk)
    begin
        if(disCount == 20'h186a0) // 1ms
            begin
                disCount = 20'h0;
                case(disSelect)
                    2'b00: disSelect = 2'b01;
                    2'b01: disSelect = 2'b10;
                    2'b10: disSelect = 2'b11;
                    2'b11: disSelect = 2'b00;
                    default: disSelect = 2'b00;
                endcase
            end
        else
            disCount = disCount + 1'h1;
    end
    
    
    always@(disSelect)
        begin
            case(disSelect)
                2'b00: 
                    begin
                        led = 4'b0000;
                        case(count[3:0])
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
                        case(count[7:4])
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
//                2'b10: 
//                    begin
//                        led = 4'b0000;
//                        case(num_2)
//                            4'b0000: out = 8'b00111111;
//                            4'b0001: out = 8'b00000110;
//                            4'b0010: out = 8'b01011011;
//                            4'b0011: out = 8'b01001111;
//                            4'b0100: out = 8'b01100110;
//                            4'b0101: out = 8'b01101101;
//                            4'b0110: out = 8'b01111101;
//                            4'b0111: out = 8'b00000111;
//                            4'b1000: out = 8'b01111111;
//                            4'b1001: out = 8'b01101111;
//                            4'b1010: out = 8'b01110111;
//                            4'b1011: out = 8'b01111100;
//                            4'b1100: out = 8'b00111001;
//                            4'b1101: out = 8'b01011110;
//                            4'b1110: out = 8'b01111001;
//                            4'b1111: out = 8'b01110001;
//                            default: out = 8'b00000000;
//                        endcase 
//                        led = 4'b0100;
//                    end
//                2'b11: 
//                    begin
//                        led = 4'b0000;
//                        case(num_3)
//                            4'b0000: out = 8'b00111111;
//                            4'b0001: out = 8'b00000110;
//                            4'b0010: out = 8'b01011011;
//                            4'b0011: out = 8'b01001111;
//                            4'b0100: out = 8'b01100110;
//                            4'b0101: out = 8'b01101101;
//                            4'b0110: out = 8'b01111101;
//                            4'b0111: out = 8'b00000111;
//                            4'b1000: out = 8'b01111111;
//                            4'b1001: out = 8'b01101111;
//                            4'b1010: out = 8'b01110111;
//                            4'b1011: out = 8'b01111100;
//                            4'b1100: out = 8'b00111001;
//                            4'b1101: out = 8'b01011110;
//                            4'b1110: out = 8'b01111001;
//                            4'b1111: out = 8'b01110001;
//                            default: out = 8'b00000000;
//                        endcase 
//                        led = 4'b1000;
//                    end
            endcase
        end
    
endmodule
