module ALU #(
    input logic [31:]       ALUop1,
    input logic [31:]       ALUop2,
    input logic [2:0]       ALUctrl,
    output logic [31:0]     SUM,
    output logic            EQ,

);

always_comb
case (ALUctrl)
3'b000: SUM = ALUop1 + ALUop2; //ADD
3'b001: SUM = ALUop1 - ALUop2; //SUB
3'b010: SUM = ALUop1 & ALUop2; //AND
3'b011: SUM = ALUop1 | ALUop2; //OR
3'b101: SUM = ALUop1 + ALUop2; //SLT
default: SUM = 32'b0;
endcase

endmodule
