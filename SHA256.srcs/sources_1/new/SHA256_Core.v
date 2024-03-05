`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2024 11:41:02 PM
// Design Name: 
// Module Name: SHA256_Core
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


module SHA256_Core #(
    parameter PERIOD = 10
    )
    (
    input logic [31:0] test,
    //input [511:0] key, //This is going to be same size every time with precomputed values for now
    //output [255:0] computed_hash
    output logic [31:0] out
    );
    
    logic clk;
    initial begin
    clk = 1'b1;
    end
    
    //logic [31:0] out;
    
    always #PERIOD clk = ~clk;
    
   // logic [31:0] test;
    //assign test = 32'h00000011;
    
    
    function automatic [31:0] s0 (input logic [31:0] word); //sigma 0
        begin
            logic [31:0] rotr7;
            logic [31:0] rotr18;
            logic [31:0] shr3;
            
            rotr7 = {word[6:0], word[31:7]};
            rotr18 = {word[17:0], word[31:18]};
            shr3 = word >> 3;
            
            s0 = rotr7 ^ rotr18 ^ shr3;
        end
    endfunction
    
    function automatic [31:0] s1 (input logic [31:0] word); //sigma1
        begin
            logic [31:0] rotr17;
            logic [31:0] rotr19;
            logic [31:0] shr10;
            
            rotr17 = {word[16:0], word[31:17]};
            rotr19 = {word[18:0], word[31:19]};
            shr10 = word >> 10;
            
            s1 = rotr17 ^ rotr19 ^ shr10;
           end
    endfunction
    
    function automatic [31:0] S0 (input logic [31:0] word); //Sigma 0
        begin
            logic [31:0] rotr2;
            logic [31:0] rotr13;
            logic [31:0] rotr22;
            
            rotr2 = {word[1:0], word[31:2]};
            rotr13 = {word[12:0], word[31:13]};
            rotr22 = {word[21:0], word[31:22]};
            
            S0 = rotr2 ^ rotr13 ^ rotr22;
            end
            endfunction
            
            
      function automatic [31:0] S1 (input logic [31:0] word); //Sigma 1
        begin
            logic [31:0] rotr6;
            logic [31:0] rotr11;
            logic [31:0] rotr25;
            
            rotr6 = {word[5:0], word[31:6]};
            rotr11 = {word[10:0], word[31:11]};
            rotr25 = {word[24:0], word[31:25]};
            
            S1 = rotr6 ^ rotr11 ^ rotr25;
            end
            endfunction
    
    
    
    assign out = s0(test);
    logic [31:0] out2;
    assign out2 = s1(test);
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
endmodule
