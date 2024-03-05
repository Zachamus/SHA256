`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2024 04:22:55 PM
// Design Name: 
// Module Name: SHA256_constants
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


module SHA256_constants( //module that returns the k constant, which is the fractional part of the cube root of the first 64 prime numbers
    input [5:0] index,
    output [31:0] k_constant
    );
    
    logic [31:0] intermediate_out;
    assign k_constant = intermediate_out;
    
    
    always_comb 
        begin
            case(index)
            6'd00: intermediate_out = 32'h428a2f98;
            6'b01: intermediate_out = 32'h71374491;
            6'd02: intermediate_out = 32'hb5c0fbcf;
            6'd03: intermediate_out = 32'he9b5dba5;
            6'd04: intermediate_out = 32'h3956c25b;
            6'd05: intermediate_out = 32'h59f111f1;
            6'd06: intermediate_out = 32'h923f82a4;
            6'd07: intermediate_out = 32'hab1c5ed5;
            6'd08: intermediate_out = 32'hd807aa98;
            6'd09: intermediate_out = 32'h12835b01;
            6'd10: intermediate_out = 32'h243185be;
            6'd11: intermediate_out = 32'h550c7dc3;
            6'd12: intermediate_out = 32'h72be5d74;
            6'd13: intermediate_out = 32'h80deb1fe;
            6'd14: intermediate_out = 32'h9bdc06a7;
            6'd15: intermediate_out = 32'hc19bf174;
            6'd16: intermediate_out = 32'he49b69c1;
            6'd17: intermediate_out = 32'hefbe4786;
            6'd18: intermediate_out = 32'h0fc19dc6;
            6'd19: intermediate_out = 32'h240ca1cc;
            6'd20: intermediate_out = 32'h2de92c6f;
            6'd21: intermediate_out = 32'h4a7484aa;
            6'd22: intermediate_out = 32'h5cb0a9dc;
            6'd23: intermediate_out = 32'h76f988da;
            6'd24: intermediate_out = 32'h983e5152;
            6'd25: intermediate_out = 32'ha831c66d;
            6'd26: intermediate_out = 32'hb00327c8;
            6'd27: intermediate_out = 32'hbf597fc7;
            6'd28: intermediate_out = 32'hc6e00bf3;
            6'd29: intermediate_out = 32'hd5a79147;
            6'd30: intermediate_out = 32'h06ca6351;
            6'd31: intermediate_out = 32'h14292967;
            6'd32: intermediate_out = 32'h27b70a85;
            6'd33: intermediate_out = 32'h2e1b2138;
            6'd34: intermediate_out = 32'h4d2c6dfc;
            6'd35: intermediate_out = 32'h53380d13;
            6'd36: intermediate_out = 32'h650a7354;
            6'd37: intermediate_out = 32'h766a0abb;
            6'd38: intermediate_out = 32'h81c2c92e;
            6'd39: intermediate_out = 32'h92722c85;
            6'd40: intermediate_out = 32'ha2bfe8a1;
            6'd41: intermediate_out = 32'ha81a664b;
            6'd42: intermediate_out = 32'hc24b8b70;
            6'd43: intermediate_out = 32'hc76c51a3;
            6'd44: intermediate_out = 32'hd192e819;
            6'd45: intermediate_out = 32'hd6990624;
            6'd46: intermediate_out = 32'hf40e3585;
            6'd47: intermediate_out = 32'h106aa070;
            6'd48: intermediate_out = 32'h19a4c116;
            6'd49: intermediate_out = 32'h1e376c08;
            6'd50: intermediate_out = 32'h2748774c;
            6'd51: intermediate_out = 32'h34b0bcb5;
            6'd52: intermediate_out = 32'h391c0cb3;
            6'd53: intermediate_out = 32'h4ed8aa4a;
            6'd54: intermediate_out = 32'h5b9cca4f;
            6'd55: intermediate_out = 32'h682e6ff3;
            6'd56: intermediate_out = 32'h748f82ee;
            6'd57: intermediate_out = 32'h78a5636f;
            6'd58: intermediate_out = 32'h84c87814;
            6'd59: intermediate_out = 32'h8cc70208;
            6'd60: intermediate_out = 32'h90befffa;
            6'd61: intermediate_out = 32'ha4506ceb;
            6'd62: intermediate_out = 32'hbef9a3f7;
            6'd63: intermediate_out = 32'hc67178f2;
            endcase
            end
    
    
    
    
    
    
    
    
    
endmodule
