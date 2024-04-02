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
    output logic [31:0] outs0,
    output logic [31:0] outs1,
    output logic [31:0] outS0,
    output logic [31:0] outS1,
    output logic [31:0] outMaj,
    output logic [31:0] outChoice,
    input logic reset,
    input logic clk
    );
    
    
    logic [511:0] key;
    assign key = 512'd58923;

    
    
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
            
            
    function automatic [31:0] Choice (input logic [31:0] word,
                                      input logic [31:0] word2,
                                      input logic [31:0] word3);
                                       
            begin
                for (int i = 0; i < 32; i++) begin
                    if (word[i] == 1)
                        Choice[i] = word2[i];
                    else
                        Choice[i] = word3[i];
            end
                end
    endfunction
    
    
    function automatic [31:0] Maj (input logic [31:0] word,
                                   input logic [31:0] word2,
                                   input logic [31:0] word3);
                                       
            begin
                for (int i = 0; i < 32; i++) begin
                    if (((word[i] == 1) && ((word2[i] == 1) || (word3[i] == 1))) || (word2[i] == 1 && word3[i] ==1)) //if at least 2 bits are 1 then output is 1, else 0
                        Maj[i] = 1;
                    else
                        Maj[i] = 0;
            end
                end
    endfunction
    
    
    logic [31:0] hash_a;
    logic [31:0] hash_b;
    logic [31:0] hash_c;
    logic [31:0] hash_d;
    logic [31:0] hash_e;
    logic [31:0] hash_f;
    logic [31:0] hash_g;
    logic [31:0] hash_h;
    
    logic  [31:0] message_words [63:0]  ;

    
    
    always @(key or reset) begin //create message schedule
        if (reset) begin
        for (integer i = 0; i < 64; i++) begin
            message_words[i] = 32'h0;
        end
        end
        
        else begin
        
        message_words[0] = key[31:0];
        message_words[1] = key[63:32];
        message_words[2] = key[95:64];
        message_words[3] = key[127:96];
        message_words[4] = key[159:128];
        message_words[5] = key[191:160];
        message_words[6] = key[223:192];
        message_words[7] = key[255:224];
        message_words[8] = key[287:256];
        message_words[9] = key[319:288];
        message_words[10] = key[351:320];
        message_words[11] = key[383:352];
        message_words[12] = key[415:384];
        message_words[13] = key[447:416];
        message_words[14] = key[479:448];
        message_words[15] = key[511:480];
        
        for (integer j = 16; j < 64; j++) begin
            message_words[j] = (s1(message_words[j-2]) + message_words[j-7] + s0(message_words[j-15]) + message_words[j-16]); 
        
        
        
        end
        
        end
        
    end
    
    
    
    
    
    
    
    
    
    
    
    
    
endmodule
