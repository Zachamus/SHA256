`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2024 05:20:03 PM
// Design Name: 
// Module Name: SHA256_tb
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


module SHA256_tb();

logic clk = 1'b1;

always #5 clk = ~clk;

logic [31:0] test_vecs;
logic [31:0] outs0, outs1, outS0, outS1, outMaj, outChoice;

SHA256_Core core (
    .test(test_vecs),
    .outs0(outs0),
    .outs1(outs1),
    .outS0(outS0),
    .outS1(outS1),
    .outMaj(outMaj),
    .outChoice(outChoice)
    );
    
initial begin

    test_vecs = 32'h1234abcd;
    
    #200
    
    test_vecs = 32'habcd1234;
    
    #200
    
    test_vecs = 32'hdeadbeef;
    
    #200
    
    test_vecs = 32'hbeefdead;
    
    #500
    $finish;
end
    
    
    


endmodule
