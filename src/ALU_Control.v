//ALU_Control
module ALU_control (
    input [1:0] ALUOp, input fun7, input[2:0] fun3, output [3:0] Control_out
);
    always @(*) begin
        casez ({ALUOp, fun7, fun3})
            6'b00_?_???: Control_out=4'b0010;
            6'b?1_?_???: Control_out=4'b0110;
            6'b1?_0_000: Control_out=4'b0010;
            6'b1?_1_000: Control_out=4'b0110;
            6'b1?_0_111: Control_out=4'b0000;
            6'b1?_0_110: Control_out=4'b0001; 
            default: Control_out=4'b1111;
        endcase
    end
endmodule

