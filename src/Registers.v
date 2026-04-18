//register file
module Registers (
    input clk, input rst, input RegWrite,input [4:0] rs1, input [4:0] rs2, input [4:0] rd, input [31:0] write_data, output [31:0] read_data_1, output [31:0] read_data_2);
    
    reg[31:0] Registers[31:0];
    integer k;

    always @(posedge rst or posedge clk)
    begin
        if(rst) begin
            for(k=0;k<31;k=k+1) begin
                Registers[k]<=32'b0;
            end
        end

        else if(RegWrite) begin
            Registers[rd]<= write_data;
        end
    end

    assign read_data_1=Registers[rs1];
    assign read_data_2=Registers[rs2];
    //forwarding ako se u t2 koristi rezultat iz t1
    //assign readData1 = (readReg1 == writeReg && regWrite) ? writeData : registers[readReg1];
endmodule
