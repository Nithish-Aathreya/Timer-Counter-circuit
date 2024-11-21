`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.10.2024 10:00:31
// Design Name: 
// Module Name: verify
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


module verify();
reg clk,timer,timer_run,gate,intx;
reg select;
wire y;

proj uut(clk,timer,timer_run,gate,intx,y,select);

initial
begin
$monitor("timer=%b,clk=%b,timer_run=%b,gate=%b,intx=%b,y=%b,select=%b",timer,clk,timer_run,gate,intx,y,select);
timer = 0;
forever
#5 timer = ~timer; 
end 

initial
begin
clk = 0;
forever
#2 clk = ~clk;
end

initial
begin
   timer_run = 1; gate = 0; select = 0; intx = 0;

end
endmodule
