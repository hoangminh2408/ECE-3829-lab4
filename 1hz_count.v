`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: WPI
// Engineer: Shannon McCormack, Minh Le
// 
// Create Date: 02/24/2019 03:41:44 PM
// Design Name: 
// Module Name: 1hz_count
// Project Name: lab 4
// Target Devices: 
// Tool Versions: 
// Description: Creates a count to F incrementing every 1 second
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module count_1hz(
    input clk,
    input reset,
    output reg [3:0] count
    );
    
    reg [26:0] en = 27'b0;
    reg clk_1h;
    
    always @ (posedge clk)
        if (en <= 27'd50000000) begin
            clk_1h <= 0;
            en <= en + 1;
        end
        else if (en <= 27'd100000000) begin
            clk_1h <= 1;
            en <= en + 1;
        end
        else 
            en <= 0;  
    
    always @ (posedge clk_1h, posedge reset) begin
        if (reset)
            count <= 4'd0;
        else if (count > 4'hF)
            count <= 4'd0;
        else
            count <= count + 1'b1;
    end
    
endmodule
