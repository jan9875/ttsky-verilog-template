//Control module
module Control_Unit (
    input [6:0] Instruction, output Branch, output MemRead, output MemToReg, output[1:0] ALUOp, output MemWrite, output ALUSrc, output RegWrite
);
    always @(*) begin
        ALUSrc=0;
        MemToReg=0;
        RegWrite=0;
        MemRead=0;
        MemWrite=0;
        Branch=0;
        ALUOp=2'b00;
        case (Instruction)
            //R_Format
            7'b0110011: {ALUSrc,MemToReg, RegWrite, MemRead, MemWrite, Branch,ALUOp} = 8'b00100010
            //I_Format lw
            7'b0000011: {ALUSrc,MemToReg, RegWrite, MemRead, MemWrite, Branch,ALUOp} = 8'b11110000
            //I_Format sw
            7'b0100011: {ALUSrc,MemToReg, RegWrite, MemRead, MemWrite, Branch,ALUOp} = 8'b1x001000
            //I_Format b
            7'b1100011: {ALUSrc,MemToReg, RegWrite, MemRead, MemWrite, Branch,ALUOp} = 8'b0x000101
            default: 
        endcase
    end
endmodule