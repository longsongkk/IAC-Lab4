module ALU_mux #(
    input logic         ALUsrc,
    input logic [31:0]  regOp2,
    input logic [31:0]  ImmOp,
    output logic [31:0] AluOp2
);

always_comb 
    if (ALUsrc) AluOp2 <= ImmOp;
    else AluOp2 <= regOp2;
endmodule
