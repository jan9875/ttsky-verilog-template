//ALU 
module ALU_unit (
    input [31:0] A, input [31:0] B, input [3:0] ALU_control_in, output reg zero, output reg [31:0] ALU_result 
);
    always @(ALU_control_in or A or B) begin
        case (ALU_control_in)
            //AND
            4'b0000: begin
                ALU_result=A & B;
                zero=0; 
            end 
            //OR
            4'b0001: begin
                
                ALU_result=A | B;
                zero=0; 
            end 
            //ADD
            4'b0010: begin
                
                ALU_result=A + B;
                zero=0; 
            end 
            //SUB
            4'b0110: begin
                ALU_result=A - B;
                if(ALU_result==32'b0) zero=1;
                else zero=0; 
            end 
            default: ALU_result=32'b0;

        endcase
    end
endmodule
