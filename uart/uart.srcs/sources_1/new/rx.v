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

module uart_rx(
    input clk,
    input rx,
    output reg[7:0] data_i,
    output ack
    );
    localparam IDLE = 0,
               RECEIVE = 1,
               RECEIVE_END = 2;
    
    reg[3:0] current_state, next_state;
    reg[4:0] count;
    
    always @(posedge clk)
        current_state = next_state;
    
    always @(*) 
    begin   
        next_state = current_state;
        case(current_state)
            IDLE: if(!rx) next_state = RECEIVE;
            RECEIVE: if(count == 7) next_state = RECEIVE_END;
            RECEIVE_END: next_state = IDLE;
            default: next_state = IDLE;
        endcase    
    end
    
    always @(posedge clk) 
    begin
        if (current_state == RECEIVE)
            count = count + 1;
        else if (current_state == IDLE | current_state == RECEIVE_END)
            count = 0;
    end
    
    always @(posedge clk)
    begin
        if (current_state == RECEIVE)
        begin
            data_i[6:0] = data_i[7:1];
            data_i[7] = rx;
        end 
    end
    
    assign ack = (current_state == RECEIVE_END) ? 1 : 0;
endmodule
