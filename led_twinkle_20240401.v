module led_twinkle_20240401(
    clk,
    rst_n,
    led
);

    input clk;
    input rst_n;
    output wire [3:0]led;



    led_flash led_twinkle_inst0(
        .clk(clk),
        .rst_n(rst_n),
        .led(led[0])
    );
    
    defparam led_twinkle_inst0.MAX_COUNT = 25_000_000 - 1;
    
    
    led_flash led_twinkle_inst1(
        .clk(clk),
        .rst_n(rst_n),
        .led(led[1])
    );
    
    defparam led_twinkle_inst1.MAX_COUNT = 12_500_000 - 1;
    
    
    led_flash led_twinkle_inst2(
        .clk(clk),
        .rst_n(rst_n),
        .led(led[2])
    );
    
    defparam led_twinkle_inst2.MAX_COUNT = 6_250_000 - 1;
    
    
    led_flash led_twinkle_inst3(
        .clk(clk),
        .rst_n(rst_n),
        .led(led[3])
    );
    
    defparam led_twinkle_inst3.MAX_COUNT = 2_500_000 - 1;


endmodule
