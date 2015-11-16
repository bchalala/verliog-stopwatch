`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:13:36 10/28/2015 
// Design Name: 
// Module Name:    clockdivider 
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
module clockdivider(rst, clk, pause, onehz, twohz, fivehundhz);

    input rst;
    input clk;
    input pause;
    output onehz;
    output twohz;
    output fivehundhz;

    wire rst;
    wire clk;
    wire pause;
    reg onehz;
    reg twohz;
    reg fivehundhz;

    // Counts to 50000000 to split 100MHz clock signal
    // into a 2 Hz clock signal
    reg [25:0] twohzcounter = 0;
    reg twohzovf = 0;
    reg onehzcounter = 0;
    reg [17:0] fhundcounter = 0;

    // depending on pause sets the clk to 0.
    
    always @ (posedge clk)
    begin
      if (fhundcounter == 18'b110000110101000000)
      begin
          fivehundhz <= 1;
          fhundcounter <= 0;
      end
      else
      begin
        fivehundhz <= 0;
        fhundcounter <= fhundcounter + 1;
      end
    end

    always @ (posedge clk)
    begin  
      if (pause == 0)
      begin
        if (rst == 1)
          begin
            onehzcounter <= 0;
            twohzcounter <= 0;
          end
        else
        begin
          if (twohzcounter == 26'b10111110101111000001111111)
          begin
              onehzcounter <= onehzcounter + 1;
              twohzcounter <= 0;  
              twohz <= 1;
              if (onehzcounter == 1)
                onehz <= 1;
          end
          else
          begin
              twohzcounter <= twohzcounter + 1;
              onehz <= 0;
              twohz <= 0;
          end        
        end
        end
    end
    
endmodule