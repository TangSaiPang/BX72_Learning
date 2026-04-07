module led_ctr3(
    clk,
    rst_n,
    sw,
    led
);

    input clk;
    input rst_n;
    input [7:0]sw;
    output reg led;

    reg [24:0]cnt0;
//    reg en_cnt0;
    wire en_cnt0;    // enable timer_250ms
    reg [2:0]cnt1;
    reg [25:0]cnt2;
    reg en_cnt2;    // enable timer_1000ms

    parameter TIME_UNIT_250MS = 12_500_000 - 1;

    always@(posedge clk or negedge rst_n)
    if(!rst_n)
        cnt0 <= 0;
    else if(en_cnt0)begin
        if(cnt0 == TIME_UNIT_250MS)
            cnt0 <= 0;
        else
            cnt0 <= cnt0 + 1'd1;
    end
    else
        cnt0 <= 0;

    

    always@(posedge clk or negedge rst_n)
    if(!rst_n)
        cnt1 <= 0;
    else if(cnt0 == TIME_UNIT_250MS)
        cnt1 <= cnt1 + 1'd1;
    
 

    parameter TIME_UNIT_1S = 50_000_000 - 1;

    always@(posedge clk or negedge rst_n)
    if(!rst_n)
        cnt2 <= 0;
    else if(en_cnt2)begin
        if(cnt2 == TIME_UNIT_1S)
            cnt2 <= 0;
        else
            cnt2 <= cnt2 + 1'd1;
    end
    else
        cnt2 <= 0;

    // en_cnt0
//    always@(posedge clk or negedge rst_n)
//    if(!rst_n)
//        en_cnt0 <= 1'b0;
//    else if(cnt2 == TIME_UNIT_1S)
//        en_cnt0 <= 1'b1;
//    else if((cnt1 == 3'b111) && (cnt0 == TIME_UNIT_250MS))
//        en_cnt0 <= 1'b0;
    assign en_cnt0 = ~en_cnt2;

    // en_cnt2
    always@(posedge clk or negedge rst_n)
    if(!rst_n)
        en_cnt2 <= 1'b1;
    else if((cnt1 == 3'b111) && (cnt0 == TIME_UNIT_250MS))
        en_cnt2 <= 1'b1;
    else if(cnt2 == TIME_UNIT_1S)
        en_cnt2 <= 1'b0;



    always@(posedge clk or negedge rst_n)
    if(!rst_n)
        led <= 1'b0;
    else if(en_cnt2 == 1)
        led <= 1'b0;
    else begin
        case(cnt1)
            3'b000: led <= sw[0];
            3'b001: led <= sw[1];
            3'b010: led <= sw[2];
            3'b011: led <= sw[3];
            3'b100: led <= sw[4];
            3'b101: led <= sw[5];
            3'b110: led <= sw[6];
            3'b111: led <= sw[7];
            default: led <= led;
        endcase
    end

endmodule
