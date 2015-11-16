`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:34:48 10/26/2015 
// Design Name: 
// Module Name:    time_counter 
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
module time_counter(rst, clk, ovf, high_val, low_val, back, clk_en, min);
    input rst;
    input clk;
    input back;
    input clk_en;
    input min;
    
    output ovf;
    output [2:0] high_val;
    output [3:0] low_val;
    
    wire [2:0] high_val;
    wire [3:0] low_val;
    wire rst;
    wire min;
    wire clk;
    wire back;
    wire clk_en;
    
    reg ovf = 0;
    reg last_back = 0;
    reg [5:0] val = 0;
    
    assign high_val = val / 10;
    assign low_val = val % 10;
    
   	always @ (posedge clk)
    begin
      last_back <= back;
      if (rst)
      begin // //
        ovf <= 0;
        val <= 0;
      end // //
      else 
      begin
        if (clk_en && !(min && (last_back != back)))
        begin
          if (back)
          begin
            if (val == 0)
            begin
              val <= 59;
              ovf <= 1;
            end
            else
            begin
              val <= val-1;
              ovf <= 0;
            end
          end
          else
          begin
            if (val == 59)
            begin
              val <= 0;
              ovf <= 1;
            end
            else
            begin
              val <= val+1;
              ovf <= 0;
            end 
          end
        end
        else
        begin
          ovf <= 0;
        end
      end
    end
   
   
   /*
  
    input rst;
    input clk;
    input back;
    input clk_en;
    
    output ovf;
    output [2:0] high_val;
    output [3:0] low_val;
	
	wire rst;
	wire clk;
  wire back;
  wire clk_en;
  reg last_back = 0;
  
	reg ovf;
	reg [2:0] high_val = 0;  
	reg [3:0] low_val = 0;
	
	reg low_ovf;
	reg high_ovf;
	wire [2:0] inc_high;
	wire [3:0] inc_low;
	wire [2:0] dec_high;
	wire [3:0] dec_low;
  
  assign inc_high = high_val + 1;
  assign inc_low = low_val + 1;
  assign dec_high = high_val - 1;
  assign dec_low = low_val - 1;
	
  
  

	always @ (posedge clk)
  begin // /
    if (rst)
      begin // //
        ovf <= 0;
        low_val <= 4'b0000;
        high_val <= 3'b000;
      end // //
    else 
    begin    // //
    if (clk_en == 1)
    begin // ///
      last_back <= back;
      if (back)
        begin // ////
          if (dec_low == 0)
            begin // /////
              low_ovf <= 1;
              if (high_val == 0)
                begin // //////
                  high_ovf <= 1;
                  ovf <= 1;
                end // //////
              else
              begin // //////
                high_ovf <= 0;
                ovf <= 0;
              end  // //////
            end // /////
          else
            begin // //////
              low_ovf <= 0;
              ovf <= 0;
            end // //////
          if (low_ovf || (last_back == 0 && low_val == 0))
            begin // //////
              low_val <= 9;
              if (high_ovf)
                high_val <= 5;
              else
                high_val <= dec_high;
            end // //////
          else
            begin // //////
              low_val <= dec_low;
              //high_val stays same
            end // //////
           
        end // /////
        
      else
        begin // //////
          if (inc_low == 9)
            begin // ///////
              low_ovf <= 1;
              if (inc_high == 6)
                high_ovf <= 1;
              else
                high_ovf <= 0;
            end // ///////
          else
            begin // ///////
              low_ovf <= 0;
              high_ovf <= 0;
            end // ///////

          if (low_ovf || (last_back && low_val == 9))
            low_val <= 4'b0000;
          else
            low_val <= inc_low;

          if (low_ovf || (last_back && low_val == 9))
            begin // ///////
              if (high_ovf)
                begin
                  high_val <= 3'b000;
                  ovf <= 1;
                end
              else
                high_val <= inc_high;
            end // ///////
         else
            ovf <= 0;

       end // //////
       end // /////
       else
        ovf <= 0;
      end // ///
     end
*/

endmodule
