//Instruction memory
module Instruction_Memory(input clk, input rst, input [31:0] Read_Address, output [31:0] instruction_out);

    
    integer k;
    reg [31:0] I_Mem[16:0];

    always @(posedge clk or posedge rst)
        begin
            if(rst) begin
                for(k=0;k<64;k=k+1)
                begin
                    I_Mem[k]<=32'b0;
                end
            end
            else begin
                //R_TYPE
                I_Mem[0]<= 32'b0000000_00000_00000_000_00000_0000000; //NO_OP
                I_Mem[4]<= 32'b0000000_11001_10000_000_01101_0110011; //ADD x13, x16, x25
                I_Mem[8]<= 32'b0100000_00011_01000_000_00101_0110011; //SUB x5, x8, x3
                I_Mem[12]<= 32'b0000000_00011_00010_111_00001_0110011; //AND x1, x2, x3
                I_Mem[16]<= 32'b0100000_00101_00011_110_00100_0110011; //ADD x4, x3, x5
                
            end
            
        end

    assign instruction_out=I_Mem[Read_Address[5:0]];
endmodule
