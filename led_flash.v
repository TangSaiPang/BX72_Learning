module led_flash(
    clk,
    rst_n,
    led
    );
    
    input clk;
    input rst_n;
    output reg led;
    
    reg[24:0] counter;
    
    parameter MAX_COUNT = 25_000_000 - 1;
    
    always@(posedge clk or negedge rst_n)
        if(!rst_n)
            counter <= 0;
        else if(counter == MAX_COUNT)
            counter <= 0;
        else
            counter <= counter + 1'd1;
            
     always@(posedge clk or negedge rst_n)
    if(!rst_n)
        led <= 1'd0;
    else if(counter == MAX_COUNT)
        led <= !led;       
    
endmodule
