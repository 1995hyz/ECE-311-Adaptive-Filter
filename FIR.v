`timescale 1ns / 1ps

// Written by: Zheng (Alex) Liu
// ECE-311: Hardware Design
// Final Project: Noise Cancellation Headphones
// November 30, 2018

module LMS_weights(
    clk,
 
    noise_gathered_0,
    noise_gathered_1,
    noise_gathered_2,
    noise_gathered_3,
    noise_gathered_4,
    noise_gathered_5,
    noise_gathered_6,
    noise_gathered_7,
    noise_gathered_8,
    noise_gathered_9,
    noise_gathered_A,
    noise_gathered_B,
    
    weight_0_new,
    weight_1_new,
    weight_2_new,
    weight_3_new,
    weight_4_new,
    weight_5_new,
    weight_6_new,
    weight_7_new,
    weight_8_new,
    weight_9_new,
    weight_A_new,
    weight_B_new,
    );
    
    input clk;
    
    input [15:0] noise_gathered_0;
    input [15:0] noise_gathered_1;
    input [15:0] noise_gathered_2;
    input [15:0] noise_gathered_3;
    input [15:0] noise_gathered_4;
    input [15:0] noise_gathered_5;
    input [15:0] noise_gathered_6;
    input [15:0] noise_gathered_7;
    input [15:0] noise_gathered_8;
    input [15:0] noise_gathered_9;
    input [15:0] noise_gathered_A;
    input [15:0] noise_gathered_B;
    
    
    output reg [31:0] weight_0_new;
    output reg [31:0] weight_1_new;
    output reg [31:0] weight_2_new;
    output reg [31:0] weight_3_new;
    output reg [31:0] weight_4_new;
    output reg [31:0] weight_5_new;
    output reg [31:0] weight_6_new;
    output reg [31:0] weight_7_new;
    output reg [31:0] weight_8_new;
    output reg [31:0] weight_9_new;
    output reg [31:0] weight_A_new;
    output reg [31:0] weight_B_new;

    output reg [47:0] term0;
    output reg [47:0] term0;
    output reg [47:0] term0;
    output reg [47:0] term0;
    output reg [47:0] term0;
    output reg [47:0] term0;
    output reg [47:0] term0;
    output reg [47:0] term0;
    output reg [47:0] term0;
    output reg [47:0] term0;
    output reg [47:0] termA;
    output reg [47:0] noise_out;


    fir_response stage_0 (
      .CLK(clk),                                    // input wire CLK
      .CE(0),                                       // input wire CE
      .SCLR(0),                                     // input wire SCLR
      .A(noise_gathered_0),                         // input wire [32 : 0] A, delayed noise
      .B(weight_0_new),                             // input wire [15 : 0] B, weights
      .PCIN(0),                                     // input wire [48 : 0] PCIN, previous term
      .SUBTRACT(0),                                 // input wire SUBTRACT (0 means addition)
      .PCOUT(term0),                                // output wire [48 : 0] POUT
      .P(),
      .C()                                          // C and P are not used
    );
    fir_response stage_1 (                          
      .CLK(clk),             
      .CE(0),                
      .SCLR(0),              
      .A(noise_gathered_1),  
      .B(weight_1_new),      
      .PCIN(term0),          
      .SUBTRACT(0),          
      .PCOUT(term1),         
      .P(),
      .C()                   
    );
    fir_response stage_2 (
      .CLK(clk),             
      .CE(0),                
      .SCLR(0),              
      .A(noise_gathered_2),  
      .B(weight_2_new),      
      .PCIN(term1),          
      .SUBTRACT(0),          
      .PCOUT(term2),         
      .P(),
      .C()                   
    );
    fir_response stage_3 (
      .CLK(clk),             
      .CE(0),                
      .SCLR(0),              
      .A(noise_gathered_3),  
      .B(weight_3_new),      
      .PCIN(term2),          
      .SUBTRACT(0),          
      .PCOUT(term3),         
      .P(),
      .C()                   
    );
    fir_response stage_4 (
      .CLK(clk),             
      .CE(0),                
      .SCLR(0),              
      .A(noise_gathered_4),  
      .B(weight_4_new),      
      .PCIN(term3),          
      .SUBTRACT(0),          
      .PCOUT(term4),         
      .P(),
      .C()                   
    );
    fir_response stage_5 (
      .CLK(clk),             
      .CE(0),                
      .SCLR(0),              
      .A(noise_gathered_5),  
      .B(weight_5_new),      
      .PCIN(term4),          
      .SUBTRACT(0),          
      .PCOUT(term5),         
      .P(),
      .C()                   
    );
    fir_response stage_6 (
      .CLK(clk),             
      .CE(0),                
      .SCLR(0),              
      .A(noise_gathered_6),  
      .B(weight_6_new),      
      .PCIN(term5),          
      .SUBTRACT(0),          
      .PCOUT(term6),         
      .P(),
      .C()                   
    );
    fir_response stage_7 (
      .CLK(clk),             
      .CE(0),                
      .SCLR(0),              
      .A(noise_gathered_7),  
      .B(weight_7_new),      
      .PCIN(term6),          
      .SUBTRACT(0),          
      .PCOUT(term7),         
      .P(),
      .C()                   
    );
    fir_response stage_8 (
      .CLK(clk),             
      .CE(0),                
      .SCLR(0),              
      .A(noise_gathered_8),  
      .B(weight_8_new),      
      .PCIN(term7),          
      .SUBTRACT(0),          
      .PCOUT(term8),         
      .P(),
      .C()                   
    );
    fir_response stage_9 (
      .CLK(clk),             
      .CE(0),                
      .SCLR(0),              
      .A(noise_gathered_9),  
      .B(weight_9_new),      
      .PCIN(term8),          
      .SUBTRACT(0),          
      .PCOUT(term9),         
      .P(),
      .C()                   
    );
    fir_response stage_A (
      .CLK(clk),             
      .CE(0),                
      .SCLR(0),              
      .A(noise_gathered_A),  
      .B(weight_A_new),      
      .PCIN(term9),          
      .SUBTRACT(0),          
      .PCOUT(termA),         
      .P(),
      .C()                   
    );
    fir_response final_out (
      .CLK(clk),             
      .CE(0),                
      .SCLR(0),              
      .A(noise_gathered_B),  
      .B(weight_B_new),      
      .PCIN(termA),          
      .SUBTRACT(0),          
      .PCOUT(noise_out),     
      .P(),
      .C()                   
    );