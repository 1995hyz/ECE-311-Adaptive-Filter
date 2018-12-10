`timescale 1ns / 1ps

module XADC_0_tb;

    reg VAUXN0, VAUXP0;
    reg VAUXN8, VAUXP8;
    reg RESET;
    reg DCLK;
    wire [15:0] OUT;
    wire [15:0] ALARM;
    wire eoc_out;
    initial
    begin
        DCLK = 0;
        RESET = 1;
        #100 RESET = 0;
    end
    always #5 DCLK= ~DCLK;
    begin
        XADC_Test DUT (.dclk_in(DCLK), .reset_in(RESET), .do_out(OUT),
                       .alarm_out(ALARM), .vauxp0(VAUXP0),
                       .vauxn0(VAUXN0), .vauxp8(VAUXN8),
                       .vauxn8(VAUXP8), .eoc_out(eoc_out));
    end
endmodule
