//Program Counter
module Program_Counter(input clk, input rst, input [31:0] PC_in, output [31:0] PC_out)

    reg[31:0] temp;
    always @(posedge rst or posedge clk)
    begin
        if(rst==1'b1)
            temp<= 32'b0;
        else
            temp<=PC_in;
    end
    
    assign PC_out=temp;
endmodule