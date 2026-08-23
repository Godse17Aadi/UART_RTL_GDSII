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
        rx         = 1;
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

        // Load byte into TX_DATA
        #100 address = 2;
        #100 write_data = 8'b0110_1001;
        #100 we = 1;
        #100 we = 0;

        // Drive RX line with a manual serial frame (start bit, 8 data bits, stop bit)
        #104750 rx = 0;   // start bit
        #104750 rx = 0;
        #104750 rx = 1;
        #104750 rx = 0;
        #104750 rx = 1;
        #104750 rx = 1;
        #104750 rx = 0;
        #104750 rx = 1;
        #104750 rx = 1;   // stop bit

        // Read back RX_DATA register
        #200000 address = 3;
        #100    re = 1;
        #100    re = 0;

        #500000 $finish;
    end

endmodule
