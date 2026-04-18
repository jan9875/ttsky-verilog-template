//Adder PC+Imm_Gen
module Adder (
    input [31:0] in_1, input [31:0] in_2, output [31:0] Add_out   
);
    assign Add_out=in_1+in_2;
endmodule