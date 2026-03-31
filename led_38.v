module flowing_led2(
    clk,
    rst_n,
    led
);

    input clk;
    input rst_n;
    output wire [7:0]led;

    reg[24:0] counter;
    always@(posedge clk or negedge rst_n)
        if(!rst_n)
            counter <= 0;
        else if(counter == 25_000_000 - 1)
            counter <= 0;
        else
            counter <= counter + 1'd1;

    reg[2:0] cnt;
    always@(posedge clk or negedge rst_n)
        if(!rst_n)
            cnt <= 0;
        else if(counter == 25_000_000 - 1)
            cnt <= cnt + 1'd1;

    decoder_3_8 decoder_3_8_inst0(
        .A0(cnt[0]),
        .A1(cnt[1]),
        .A2(cnt[2]),
        .Y0(led[0]),
        .Y1(led[1]),
        .Y2(led[2]),
        .Y3(led[3]),
        .Y4(led[4]),
        .Y5(led[5]),
        .Y6(led[6]),
        .Y7(led[7])
    );

endmodule