//Data memory
module Data_Memory (
    input clk, input rst, input [31:0] Adress, input MemWrite, input MemRead, input [31:0] WriteData, output [31:0] MemData_Out
);
    integer i;
    wire [5:0] actual_adress=Adress[7:2];
    reg[31:0] memory[63:0];

    always @(posedge clk, or posedge rst) begin
        if(rst) begin
            for (i=0; i<64; i=i+1 ) begin
                memory[i]<=32'b0;
            end
        end
        else if(MemWrite) begin
            memory[actual_adress]<=write_data;
        end
    end 
    assign MemData_Out= (MemRead)? memory[actual_adress]: 32'b0;
endmodule