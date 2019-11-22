`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2019 10:23:08 AM
// Design Name: 
// Module Name: square
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


module square(
    input clk,
    output reg [7:0] out
    );
    
    
    localparam N = 8'hff;
    reg [7:0] count;
    
    always@(posedge clk)
        begin
            if(count == N)
                begin
                    count = 8'h00;
                    case(out)
                        8'h00: out = 8'hff;
                        8'hff: out = 8'h00;
                        default: out = 8'h00;
                    endcase 
                end
            else
                begin
                    count = count + 1'b1;
                end
        end
        
endmodule
