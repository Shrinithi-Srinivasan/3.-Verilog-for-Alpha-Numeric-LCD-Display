module lcd_display(
    output reg [7:0] lcd_data,
    output reg lcd_enable,
    input clk,
    input reset
);

    reg [7:0] message [0:4]; // HELLO message
    reg [2:0] index;

    initial begin
        message[0] = 8'h48; // 'H'
        message[1] = 8'h45; // 'E'
        message[2] = 8'h4C; // 'L'
        message[3] = 8'h4C; // 'L'
        message[4] = 8'h4F; // 'O'
    end

    always @(posedge clk or posedge reset) begin
        if (reset)
            index <= 0;
        else begin
            if (index < 5) begin
                lcd_data <= message[index];
                lcd_enable <= 1;
                index <= index + 1;
            end else
                lcd_enable <= 0;
        end
    end
endmodule
