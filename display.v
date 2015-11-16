`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:25:55 11/02/2015 
// Design Name: 
// Module Name:    display 
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
module display(clk, minhv, minlv, sechv, seclv, display_seg, an, clk_en);
    
    input clk;
    input clk_en;
    input [2:0] minhv; 
    input [3:0] minlv;
    input [2:0] sechv;
    input [3:0] seclv;
    output [7:0] display_seg;
    output [3:0] an;
    
    wire [2:0] minhv;
    wire [3:0] minlv;
    wire [2:0] sechv;
    wire [3:0] seclv;
    wire clk_en;
    
    reg [7:0] display_seg;
    reg [3:0] an;
    
    // Element select
    reg [3:0] esel;
    
    // mod 4 Counter
    reg [1:0] counter = 0; 
   

    always @ (posedge clk)
    begin
    if (clk_en == 1)
    begin
        if (counter == 3)
            counter <= 0;
        else 
            counter <= counter + 1;
            
        case (counter)
          0: an <= 4'b0111;
          1: an <= 4'b1011;
          2: an <= 4'b1101;
          3: an <= 4'b1110;
        endcase
        
        case (counter)
          0: esel <= minlv;
          1: esel <= sechv;
          2: esel <= seclv;
          3: esel <= minhv;
        endcase
     
        
        if (esel == 2 || esel == 3 || esel == 5 || esel == 6 || esel == 7 || esel == 8 || esel == 9 || esel == 0)
          display_seg[0] <= 0;
        else 
          display_seg[0] <= 1;
          
        if (esel == 1 || esel == 2 || esel == 3 || esel == 4 || esel == 7 || esel == 8 || esel == 9 || esel == 0)
          display_seg[1] <= 0;
        else 
          display_seg[1] <= 1;
          
        if (esel == 1 || esel == 3 || esel == 4 || esel == 5 || esel == 6 || esel == 7 || esel == 8 || esel == 9 || esel == 0)
          display_seg[2] <= 0;
        else 
          display_seg[2] <= 1;
          
        if (esel == 2 || esel == 3 || esel == 5 || esel == 6 || esel == 8 || esel == 0)
          display_seg[3] <= 0;
        else 
          display_seg[3] <= 1;
          
        if (esel == 2 || esel == 6 || esel == 8 || esel == 0)
          display_seg[4] <= 0;
        else 
          display_seg[4] <= 1;
          
        if (esel == 4 || esel == 5 || esel == 6 ||  esel == 8 || esel == 9 || esel == 0)
          display_seg[5] <= 0;
        else 
          display_seg[5] <= 1;
          
        if (esel == 2 || esel == 3 || esel == 5 || esel == 6 || esel == 4 || esel == 8 || esel == 9)
          display_seg[6] <= 0;
        else 
          display_seg[6] <= 1;

        display_seg[7] <= 1;

       end
    end

endmodule
