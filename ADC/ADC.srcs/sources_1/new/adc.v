`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2019 09:22:13 PM
// Design Name: 
// Module Name: adc
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


module adc(
    input clk,
    input sdata,
    output reg cs = 1,
    output wire sclk,
    output [15:0] out,
    output [3:0] led
    );
    
    reg update;
    reg [15:0] result;
    
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
    
    reg [15:0] divcount;
    reg divclk;
    parameter COUNTER_MAX=39062;
    
    always @(posedge clk)
        begin
            divcount=divcount+1;
            if(divcount==COUNTER_MAX)
                begin
                divcount=0;
                divclk = ~divclk;
                end
        end

    assign sclk = divclk;
    reg [4:0] counter = 5'b00000;
    integer bit=15;
    
    
    always @(posedge divclk)
        begin
            counter=counter+1;
            if(counter == 5'b10000)
                begin
                    cs = ~cs;
                    counter = 5'b00000;
                end
        end
    
    always @(negedge sclk)
        begin
            if(cs == 0)
                begin
                    result[bit] <= sdata;
                    if(bit == 0)
                        bit = 15;
                    else
                        bit = bit-1;
                end
        end
endmodule
