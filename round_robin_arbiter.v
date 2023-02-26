`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:20:12 02/26/2023 
// Design Name: 
// Module Name:    round_robin_arbiter 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module round_robin_arbiter(input clk, rst, input [3:0] REQ, output reg [3:0] GNT);
reg [2:0] pr_state;
reg [2:0] nxt_state;

parameter [2:0] s_ideal = 3'b000;
parameter [2:0] s0 = 3'b001;
parameter [2:0] s1 = 3'b010;
parameter [2:0] s2 = 3'b011;
parameter [2:0] s3 = 3'b100;
always @(posedge clk or negedge rst)
begin
if(!rst)
pr_state <= s_ideal;
else
pr_state <= nxt_state;
end

always@(*)
begin
case (pr_state)

s_ideal:
begin
if(REQ[0])
nxt_state = s0;
else if (REQ[1])
nxt_state = s1;
else if (REQ[2])
nxt_state = s2;
else if (REQ[3])
nxt_state = s3;
else
nxt_state = s_ideal;
end

s0:
begin
if(REQ[1])
nxt_state = s1;
else if (REQ[2])
nxt_state = s2;
else if (REQ[3])
nxt_state = s3;
else if (REQ[0])
nxt_state = s0;
else
nxt_state = s_ideal;
end

s1:
begin
if(REQ[2])
nxt_state = s2;
else if (REQ[3])
nxt_state = s3;
else if (REQ[0])
nxt_state = s0;
else if (REQ[1])
nxt_state = s1;
else
nxt_state = s_ideal;
end

s2:
begin
if(REQ[3])

nxt_state = s3;
else if (REQ[0])
nxt_state = s0;
else if (REQ[1])
nxt_state = s1;
else if (REQ[2])
nxt_state = s2;
else
nxt_state = s_ideal;
end

s3:
begin
if(REQ[0])
nxt_state = s0;
else if (REQ[1])
nxt_state = s1;
else if (REQ[2])
nxt_state = s2;
else if (REQ[3])
nxt_state = s3;
else
nxt_state = s_ideal;
end

default:
begin
if(REQ[0])
nxt_state = s0;
else if (REQ[1])
nxt_state = s1;
else if (REQ[2])
nxt_state = s2;
else if (REQ[3])
nxt_state = s3;
else
nxt_state = s_ideal;
end
endcase
end
always@(*)
begin
case(pr_state)
s0:GNT=4'b0001;
s1:GNT=4'b0010;
s2:GNT=4'b0100;
s3:GNT=4'b1000;
default : GNT = 4'b0000;
endcase
end


 



endmodule
