`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:05:01 10/28/2015 
// Design Name: 
// Module Name:    stopwatch 
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
module stopwatch(clk, btnS, btnR, sw, seg, led, an);

    input clk;
    input btnS;
    input btnR;
    input [2:0] sw;

    output [7:0] seg;
    output [3:0] an;
    output led;
    
    wire [7:0] seg;
    wire [3:0] an;
    reg [7:0] led;

    wire clk;
    wire btnS;
    wire btnR;
    wire [2:0] sw;
    
    reg pause = 0;
    reg prevpause = 0;
    reg curpause = 0;
    reg back;
    
    // Secondary clock signals
    wire onehz;
    wire twohz;
    wire fivehundhz;
    
    // Minute outputs
    wire [2:0] high_min;
    wire [3:0] low_min;
    
    // Second outputs
    wire [2:0] high_sec;
    wire [3:0] low_sec;
    wire sec_ovf;
    
    // Switch between 1 and 2 hz signals
    reg clockMin;
    reg clockSec;
    
    always @ (posedge clk)
    begin
        led[0] <= led[0] + onehz;
        led [7:1] <= 7'b1111111;
    end
    
    always @*
    begin
        if (sw[0] == 1)
        begin
            if (sw[1] == 1)
            begin
                clockMin = twohz;
                clockSec = 0;
            end
            else
            begin
                clockSec = twohz;
                clockMin = 0;
            end
        end
        else
        begin
            clockSec = onehz;
            clockMin = sec_ovf;
        end
    end
    

    
    always @ (posedge fivehundhz)
    begin
        prevpause <= curpause;
        curpause <= btnS;
        if (prevpause == 0 && curpause == 1)
            pause <= ~pause;

        if (sw[2] == 1)
        begin
          back <= 1;
          end
        else
        begin
          back <= 0;
        end
    end
    
   clockdivider ck (
    .rst(btnR), 
		.clk(clk), 
		.pause(pause), 
		.onehz(onehz), 
		.twohz(twohz),
    .fivehundhz(fivehundhz)
    );
    
    time_counter seconds (
    .rst(btnR), 
    .clk(clk),
    .ovf(sec_ovf), 
    .high_val(high_sec), 
    .low_val(low_sec),
    .back(sw[2]),
    .clk_en(clockSec),
    .min(0)
    );
    
    time_counter minutes (
    .rst(btnR), 
    .clk(clk),
    .ovf(), 
    .high_val(high_min), 
    .low_val(low_min),
    .back(sw[2]),
    .clk_en(clockMin),
    .min(1)
    );
    
    display disp (
    .clk(clk),
    .minhv(high_min),
    .minlv(low_min),
    .sechv(high_sec),
    .seclv(low_sec),
    .display_seg(seg),
    .an(an),
    .clk_en(fivehundhz)
    );

endmodule
