`timescale 1ns/1ns
module uart_tb;

    reg clk;
    reg rst;
    reg [1:0] address;
    reg [31:0] write_data;
    reg we;
    wire tx;
    reg rx;
    reg re;
    wire [7:0] read_data;

    // f = 20 MHz, Bd = 9600 -> baud_division = f/(16*Bd) ~= 130
    // 1 baud_tick period = 130 * 50ns = 6500ns
    // 1 bit period = 16 * 6500ns = 104000ns
    localparam BIT_TIME = 104000;



    uart_top_design uut (
        .clk        (clk),
        .rst        (rst),
        .address    (address),
        .write_data (write_data),
        .we         (we),
        .tx         (tx),
        .rx         (rx),
        .re         (re),
        .read_data  (read_data)
    );
initial
begin
$sdf_annotate("delays.sdf",uart_tb.uut,,"sdf.log","MAXIMUM");
end

    initial begin
        $dumpfile("./temp/UART_tb.vcd");
        $dumpvars(0, uart_tb);
    end

    // Time Period : T = 50 ns
    // Duty Cycle = 50 %
    initial clk = 0;
    always #25 clk = ~clk;

    initial begin
        rst        = 0;
        address    = 0;
        write_data = 0;
        we         = 0;
        rx         = 1;   // idle
        re         = 0;

        #10  rst = 1;
        #100 rst = 0;

        // Program baud rate divider
        #100 address = 0;
        #100 write_data = 130;
        #100 we = 1;
        #100 we = 0;

        // Enable UART
        #100 address = 1;
        #100 write_data = 1;
        #100 we = 1;
        #100 we = 0;

        // Load byte into TX_DATA (0x69 = 0110_1001, sent MSB-first)
        #100 address = 2;
        #100 write_data = 8'b0110_1001;
        #100 we = 1;
        #100 we = 0;

        // Drive rx with a full 10-bit UART frame for the same byte 0x69,
        // MSB-first: start(0), 0,1,1,0,1,0,0,1, stop(1)
        #(BIT_TIME) rx = 0; // start bit
        #(BIT_TIME) rx = 0; // bit 7
        #(BIT_TIME) rx = 1; // bit 6
        #(BIT_TIME) rx = 1; // bit 5
        #(BIT_TIME) rx = 0; // bit 4
        #(BIT_TIME) rx = 1; // bit 3
        #(BIT_TIME) rx = 0; // bit 2
        #(BIT_TIME) rx = 0; // bit 1
        #(BIT_TIME) rx = 1; // bit 0
        #(BIT_TIME) rx = 1; // stop bit
        #(BIT_TIME);        // let stop bit hold for a full period

        // Read back RX_DATA register
        #100 address = 3;
        #100 re = 1;
        #100 re = 0;

        #500000 $finish;
    end

endmodule
