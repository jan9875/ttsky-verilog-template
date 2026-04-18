//Immediate_Generator
module Imm_Gen (input [31:0] Instruction, output [31:0] Imm_Out);
    
    wire[6:0] opcode=Instruction[6:0];
    always @(*) begin
        case (opcode)
            //I-format or load word
            7'b0000011: Imm_Out= {20{Instruction[31]}, Instruction[31:20]};
            //SW-format
            7'b0100011: Imm_Out= {20{Instruction[31]}, Instruction[31:25], Instruction[11:7]};
            //B-format (beq)
            7'b1100011: Imm_Out= {19{Instruction[31]}, Instruction[31], Instruction[7], Instruction[30:25], Instruction[11:8], 1'b0};
            default: 
        endcase
    end

endmodule