module ALU #(
    input logic [31:0]      ALUop1,
    input logic [31:0]      ALUop2,
    input logic [2:0]       ALUctrl,
    output logic [31:0]     ALUout,
    output logic            EQ,

);

always_comb 
case (ALUctrl) 
3'b000: ALUout = ALUop1 + ALUop2; //ADD
3'b001: ALUout = ALUop1 - ALUop2; //SUB
3'b010: ALUout = ALUop1 & ALUop2; //AND
3'b011: ALUout = ALUop1 | ALUop2; //OR
3'b101: ALUout = ALUop1 + ALUop2; //SLT
default: ALUout = 32'b0;
endcase

endmodule
