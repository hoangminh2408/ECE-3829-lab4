`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: WPI
// Engineer: Shannon McCormack, Minh Le
// 
// Create Date: 02/24/2019 03:01:47 PM
// Design Name: Part One
// Module Name: part_one
// Project Name: Lab 4
// Target Devices: 
// Tool Versions: 
// Description: Top module for part one
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module part_one(
    input       clk_in1,
    input       reset,
    input       btnU,
    input       btnL,
    input       btnR,
    input       btnD,
    input       rx,
    output      [6:0] seg,
    output      [3:0] an,
    output      tx,
    output      [15:0] led
    );
    
wire clk;
wire clk_25;
wire [3:0] count;
wire [11:0] data;

//wire [3:0] dbuttons;

  clk_wiz_0 instance_name
(
// Clock out ports
.clk_25(clk_25),     // output clk_25
.clk(clk),     // output clk
// Status and control signals
.reset(reset), // input reset
.locked(locked),       // output locked
// Clock in ports
.clk_in1(clk_in1));      // input 

//debouncer btnU_inst (clk_25, reset, btnU, dbuttons[0]); 
//debouncer btnL_inst (clk_25, reset, btnL, dbuttons[1]);
//debouncer btnR_inst (clk_25, reset, btnR, dbuttons[2]);
//debouncer btnD_inst (clk_25, reset, btnD, dbuttons[3]);
    
microblaze_mcs_0 your_instance_name (
    .Clk(clk),                  // input wire Clk
    .Reset(reset),              // input wire Reset
    .UART_rxd(rx),        // input wire UART_rxd
    .UART_txd(tx),        // output wire UART_txd
    .GPIO1_tri_i({btnU,btnL,btnR,btnD}),  // input wire [3 : 0] GPIO1_tri_i
    .GPIO1_tri_o(led),  // output wire [15 : 0] GPIO1_tri_o
    .GPIO2_tri_i(count),  // input wire [3 : 0] GPIO2_tri_i
    .GPIO2_tri_o(data)  // output wire [11 : 0] GPIO2_tri_o
  );
    
//always @ (posedge clk_25)
//    if(dbuttons[0])
//        led[0] <= 1;
//    else if(dbuttons[1])
//        led[0] <= 0;
//    else if(dbuttons[2])
//        led[1] <= 1;
//    else if(dbuttons[3])
//        led[1] <= 0;
//    else led = 0;
    
//wire [15:0] dummy_led;    
count_1hz clk_inst (
      .clk(clk),
      .reset(reset),
      .count(count)
    );
    
seven_seg ss_inst (
      .data({count,data}), 
      .clk_in(clk_25), 
      .segs(seg), 
      .an(an)
    );
 
endmodule
