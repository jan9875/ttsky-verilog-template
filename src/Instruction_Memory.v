//Instruction memory
module Instruction_Memory(input clk, input rst, input [31:0] Read_Address, output [31:0] instruction_out)

    reg [31:0] temp_out;
    integer k;
    reg [31:0] I_Mem[63:0];

    always @(posedge clk or posedge rst)
        begin
            if(rst) begin
                for(k=0;k<64;k=k+1)
                begin
                    I_Mem[k]<=32'b0;
                end
            end
            else begin
                temp_out<=I_Mem[Read_Address[5:0]];
            end
        end
    assign instruction_out=temp_out;
endmodule