`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: I am
// 
// Create Date: 
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


module verify;
reg clk;
reg reset;
reg gate;
reg intx;
reg tr;
reg cin;
reg c_t;
wire [15:0] count;

main uut(clk,reset,gate,intx,tr,cin,c_t,count);
initial
begin
clk = 1'b0;
reset =1'b1;
gate =1'b0;
intx = 1'b0;
tr = 1'b0;
cin = 1'b0;
c_t = 1'b0;
end


always #41.6 clk = ~clk;

initial
begin
 #50 reset = 0;
        
      
        #20 tr = 1;
        
        
        #500;

        
        #20 c_t = 1;  
        tr = 1;
        
       
        repeat (10) begin
            #30 cin = 1'b1;
            #30 cin = 1'b0;
        end
        
       
        #20 gate = 1;
        intx = 0;    
        #100 intx = 1; 
        
        
        #500;
        
        
        $stop;
end

   initial begin
        $monitor("Time: %0t | c_t: %b | tr: %b | t_in: %b | gate: %b | int_in: %b | count: %b",
                 $time, c_t, tr, cin, gate, intx, count);
    end

endmodule

