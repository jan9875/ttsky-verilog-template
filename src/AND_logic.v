

//AND Branch and zero
module AND_logic (
    input branch, input zero, output AND_out
);
    assign AND_out=branch & zero;
endmodule


