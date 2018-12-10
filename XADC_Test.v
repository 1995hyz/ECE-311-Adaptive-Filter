`timescale 1ns / 1ps

module XADC_Test(
          //daddr_in,            // Address bus for the dynamic reconfiguration port
          dclk_in,             // Clock input for the dynamic reconfiguration port
          //den_in,              // Enable Signal for the dynamic reconfiguration port
          //di_in,               // Input data bus for the dynamic reconfiguration port
          //dwe_in,              // Write Enable for the dynamic reconfiguration port
          reset_in,            // Reset signal for the System Monitor control logic
          vauxp0,              // Auxiliary channel 0
          vauxn0,
          vauxp8,              // Auxiliary channel 8
          vauxn8,
          //busy_out,            // ADC Busy signal
          do_out,              // Output data bus for dynamic reconfiguration port
          //eos_out,             // End of Sequence Signal
          alarm_out,           // OR'ed output of all the Alarms    
          //vp_in,               // Dedicated Analog Input Pair
          //vn_in
          eoc_out
    );
    reg [6:0] daddr_in;
    input dclk_in;              //Y9
    reg [15:0] di_in = 16'h0000;
    reg dwe_in = 1'b0;
    input reset_in;
    input vauxp0;
    input vauxn0;
    input vauxp8;
    input vauxn8;
    reg vp_in;
    reg vn_in;

    output reg [15:0] do_out;
    output alarm_out;

    reg den_in;
    reg channel_select;    
    output wire eoc_out;
    wire [4:0] channel_out;
    wire drdy_out;
    wire eos_out;
    //output wire eos_out;
    wire busy_out;
    //output wire busy_out;
    wire [15:0]temp_out;    
            
    xadc_wiz_0 XADC0 (.daddr_in(daddr_in),
              .dclk_in(dclk_in), .den_in(den_in),
              .di_in(di_in), .dwe_in(dwe_in), .reset_in(reset_in),
              .vauxp0(vauxp0), .vauxn0(vauxn0), .vauxp8(vauxp8),
              .vauxn8(vauxn8), .vp_in(vp_in), .vn_in(vn_in),
              .busy_out(busy_out), .channel_out(channel_out),
              .do_out(temp_out), .drdy_out(drdy_out), .eoc_out(eoc_out),
              .eos_out(eos_out), .alarm_out(alarm_out));

    initial
    begin
        den_in = 1'b0;
        channel_select = 1'b0;
        vp_in = 1'b0;
        vn_in = 1'b0;
    end
    
    always @ (posedge dclk_in)
    begin
        den_in = 0;
        if (eoc_out == 1)
        begin
            den_in = 1;
            if(channel_select == 0)
            begin
                daddr_in = 8'h10;
                channel_select = 1'b1;
            end
            else
            begin
                daddr_in = 8'h18;
                channel_select = 1'b0;
            end
        end
        if (drdy_out == 1)
        begin
            do_out = temp_out;    
        end
    end 
    
endmodule
