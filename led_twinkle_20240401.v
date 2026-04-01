module led_twinkle(
    clk,
    rst_n,
    led
);

input clk;
input rst_n;
output wire [3:0]led;

//reg [24:0]counter0;
//always@(posedge clk or negedge rst_n)
//    if(!rst_n)
//        counter0 <= 0;
//    else if(counter0 == 25_000_000 - 1)
//        counter0 <= 0;
//    else
//        counter0 <= counter0 + 1'd1;

//always@(posedge clk or negedge rst_n)
//    if(!rst_n)
//        led[0] <= 1'd0;
//    else if(counter0 == 25_000_000 - 1)
//        led[0] <= !led[0];


//reg [24:0]counter1;
//always@(posedge clk or negedge rst_n)
//    if(!rst_n)
//        counter1 <= 0;
//    else if(counter1 == 12_500_000 - 1)
//        counter1 <= 0;
//    else
//        counter1 <= counter1 + 1'd1;

//always@(posedge clk or negedge rst_n)
//    if(!rst_n)
//        led[1] <= 1'd0;
//    else if(counter0 == 12_500_000 - 1)
//        led[1] <= !led[1];


//reg [24:0]counter2;
//always@(posedge clk or negedge rst_n)
//    if(!rst_n)
//        counter2 <= 0;
//    else if(counter2 == 6_250_000 - 1)
//        counter2 <= 0;
//    else
//        counter2 <= counter2 + 1'd1;

//always@(posedge clk or negedge rst_n)
//    if(!rst_n)
//        led[2] <= 1'd0;
//    else if(counter0 == 6_250_000 - 1)
//        led[2] <= !led[2];


//reg [23:0]counter3;
//always@(posedge clk or negedge rst_n)
//    if(!rst_n)
//        counter3 <= 0;
//    else if(counter3 == 2_500_000 - 1)
//        counter3 <= 0;
//    else
//        counter3 <= counter3 + 1'd1;

//always@(posedge clk or negedge rst_n)
//    if(!rst_n)
//        led[3] <= 1'd0;
//    else if(counter0 == 2_500_000 - 1)
//        led[3] <= !led[3];

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
