module uart_byte_tx(
    clk,
    rst_n,
    data,
    uart_tx,
    led
);

    input clk;
    input rst_n;
    input [7:0]data;
    output reg uart_tx;
    output reg led;

    //
    reg [25:0]delay_cnt;
    reg [12:0]baud_div_cnt;
    reg [3:0]bit_cnt;
    reg uart_tx_en;
    reg [7:0]r_Data;

    parameter TIME_UNIT_1S = 50_000_000 - 1;
    parameter TIME_UNIT_BAUD = 5208 - 1;
    parameter MAX_BIT_CNT = 10 - 1;
    parameter START_BIT = 1'b0;
    parameter STOP_BIT = 1'b1;


    // this is to delay 1s.
    always @(posedge clk or negedge rst_n)
    if(!rst_n)
        delay_cnt <= 1'd0;
    else if(delay_cnt == TIME_UNIT_1S)
        delay_cnt <= 1'd0;
    else
        delay_cnt <= delay_cnt + 1'd1;

    // this is how to enable uart tx
    always @(posedge clk or negedge rst_n)
    if(!rst_n)
        uart_tx_en <= 1'b0;
    else if(delay_cnt == TIME_UNIT_1S)
        uart_tx_en <= 1'b1;
    else if((bit_cnt == MAX_BIT_CNT) && (baud_div_cnt == TIME_UNIT_BAUD))
        uart_tx_en <= 1'b0;

    // Baudrate counter: This is delay the time when we send data with uart. 
    always @(posedge clk or negedge rst_n)
    if(!rst_n)
        baud_div_cnt <= 1'd0;
    else if(uart_tx_en) begin
        if(baud_div_cnt == TIME_UNIT_BAUD)
            baud_div_cnt <= 1'd0;
        else
            baud_div_cnt <= baud_div_cnt + 1'd1;
    end
    else
        baud_div_cnt <= 1'd0;


    // Bit Counter: This is to counter data bit
    always @(posedge clk or negedge rst_n)
    if(!rst_n)
        bit_cnt <= 1'd0;
    else if(baud_div_cnt == TIME_UNIT_BAUD) begin
        if(bit_cnt == MAX_BIT_CNT)
            bit_cnt <= 1'd0;
        else
            bit_cnt <= bit_cnt + 1'd1;
    end
//    else
//        bit_cnt <= 0;

    
    always @(posedge clk or negedge rst_n)
    if(!rst_n)
        r_Data <= 0;
    else if(delay_cnt == TIME_UNIT_1S)
        r_Data <= data;
    else
        r_Data <= r_Data;


    // this is to transmit data
    always @(posedge clk or negedge rst_n)
    if(!rst_n)
        uart_tx <= 1'b1;
    else if(!uart_tx_en)
        uart_tx <= 1'b1;
    else begin
        case(bit_cnt)
            4'b0000: uart_tx <= START_BIT;
            4'b0001: uart_tx <= r_Data[0];
            4'b0010: uart_tx <= r_Data[1];
            4'b0011: uart_tx <= r_Data[2];
            4'b0100: uart_tx <= r_Data[3];
            4'b0101: uart_tx <= r_Data[4];
            4'b0110: uart_tx <= r_Data[5];
            4'b0111: uart_tx <= r_Data[6];
            4'b1000: uart_tx <= r_Data[7];
            4'b1001: uart_tx <= STOP_BIT;
            default: uart_tx <= uart_tx;
        endcase
    end


    // this is led blink when we transmit a byte
    always @(posedge clk or negedge rst_n)
    if(!rst_n)
        led <= 1'b0;
    else if((bit_cnt == MAX_BIT_CNT) && (baud_div_cnt == TIME_UNIT_BAUD))
        led <= !led;



endmodule



