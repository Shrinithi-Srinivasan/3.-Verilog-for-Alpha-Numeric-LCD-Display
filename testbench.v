module lcd_display_tb;
    reg clk;
    reg reset;
    wire [7:0] lcd_data;
    wire lcd_enable;

    lcd_display uut (
        .lcd_data(lcd_data),
        .lcd_enable(lcd_enable),
        .clk(clk),
        .reset(reset)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
          $dumpfile("dumpfile.vcd");
    $dumpvars(1);

        // Initialize
        clk = 0;
        reset = 1;
        #10 reset = 0;

        // Run for a few cycles to display the message
        #100;

        $finish;
    end
endmodule
