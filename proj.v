`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.10.2024 19:25:42
// Design Name: 
// Module Name: proj
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


module proj(clk,timer,timer_run,gate,intx,y,select);
input clk,timer,timer_run,gate,intx,select;
output reg y;

wire a; //OR gate output
wire b; //AND gate output
wire inp_drive; //MUX selective
wire select; //MuX control line
assign a = ~gate | intx;

assign b = timer_run & a;

assign inp_drive = select ? timer : clk; 

                                               //select=0;counter                                                    //select=1;timer
always @(posedge inp_drive)
y = b;
endmodule
