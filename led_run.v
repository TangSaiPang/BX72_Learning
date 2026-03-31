module flowing_led1(
    clk,
    rst_n,
    led
);


    input clk;
    input rst_n;
    output reg [7:0]led;


    reg[24:0] counter;
    always@(posedge clk or negedge rst_n)
        if(!rst_n)
            counter <= 0;
        else if(counter == 25_000_000 - 1)
            counter <= 0;
        else
            counter <= counter + 1'd1;

    always@(posedge clk or negedge rst_n)
        if(!rst_n)
            led <= 8'b0000_0001;
        else if(counter == 25_000_000 - 1) begin
//                led <= led << 1;
            led <= {led[6:0], led[7]};
        end






endmodule

