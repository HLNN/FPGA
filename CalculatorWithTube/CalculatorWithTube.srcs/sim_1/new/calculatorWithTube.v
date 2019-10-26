`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2019 10:35:01 AM
// Design Name: 
// Module Name: calculatorWithTube
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


module calculatorWithTube(
    );
    
    reg clk;
    reg [7:0] x;
    reg [7:0] y;
    reg key;
    
    wire [7:0] out; // dp, g, f, e, d, c, b, a
    wire [3:0] led;
    wire [15:0] result;
    
    always #100 clk = ~clk;
    
    initial begin
        x = 8'b00001111;
        y = 8'b00000001;
        key = 1'b0;
        #100000;
        x = 8'b01010101;
        #100000;
        
    end
    
    top t(
        .clk(clk),
        .x(x),
        .y(y),
        .key(key),
        .out(out),
        .led(led),
        .result(result)
    );
    
endmodule
