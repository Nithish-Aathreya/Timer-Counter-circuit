`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: I am 
// 
// Create Date: 
// Design Name: 
// Module Name: main
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


module main(clk,reset,gate,intx,tr,cin,c_t,count);
input clk,reset,gate,intx,tr,cin,c_t;
output reg [15:0] count;

wire enable;
reg [3:0] clk_div;

assign enable = tr & (gate ? intx:1'b1);

always @(posedge clk or posedge reset) 
begin
if(reset == 1'b1)
begin 
count<=16'b0;
clk_div<=4'b0;
end

else if(enable==1'b1) 
begin
if(c_t==1'b0)
begin
clk_div=clk_div+1;
if(clk_div==4'b11)
begin
count = count + 1;
clk_div<=16'b0;
end
end
else
begin
if(cin==1'b1)
count<=count+1;
end
end
end
endmodule

