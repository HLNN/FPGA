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

module uart_tx(
    input clk,
    input ack,
    input [7:0] data_o,
    output reg tx
    );
    
    localparam IDLE = 0,
               SEND_START = 1,
               SEND_DATA = 2,
               SEND_END = 3;
    
    reg [3:0] current_state, next_state;
    reg [4:0] count;
    reg [7:0] data_o_tmp;
    
    always@(posedge clk)
        current_state = next_state;
    
    always@(*)
    begin   
        next_state = current_state;
        case (current_state)
            IDLE: if(ack) next_state = SEND_START;
            SEND_START: next_state = SEND_DATA;
            SEND_DATA: if(count == 7) next_state = SEND_END;
            SEND_END: if(ack) next_state = SEND_START;
            default: next_state = IDLE;
        endcase
    end
    
    always @(posedge clk)
    begin
        if (current_state == SEND_DATA)
            count = count + 1;
        else if (current_state == IDLE | current_state == SEND_END)
            count = 0;
    end
    
    always @(posedge clk)
        if (current_state == SEND_START)
            data_o_tmp = data_o;
        else if (current_state == SEND_DATA)
            data_o_tmp[6:0] = data_o_tmp[7:1];
    
    always @(posedge clk)
        if(current_state == SEND_START)
            tx = 0;
        else if(current_state == SEND_DATA)
            tx = data_o_tmp[0];
        else if(current_state == SEND_END)
            tx = 1; 
endmodule
