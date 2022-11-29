module cpu #(
    input logic             clk,
    input logic             rst,
    input logic             rst,
    output logic [31:0]     a0 [4:0]
);

logic [31:0] instr;
logic [4:0] rs1;
logic [4:0] rs2;
logic [4:0] rd;
logic       RegWrite;
logic [2:0] ALUctrl;
logic       ALUsrc;
logic       ImmSrc;
logic       PCsrc;
logic [31:0] ImmOp;
logic [31:0] PC;
logic       EQ;

pc pc(
    .ImmOp(ImmOp),
    .clk(clk),
    .rst(rst),
    .PCsrc(PCsrc),
    .PC_out(PC)
);

control control(
    .EQ(EQ),
    .instr_opcode(instr),
    .RegWrite(RegWrite),
    .ALUctrl(ALUctrl),
    .ALRsrc(ALUsrc),
    .ImmSrc(ImmSrc),
    .PCsrc(PCsrc)
);

Signextension signextend(
    .Imm_br(),
    .Imm_imm(),
    .Immsrc(ImmSrc),
    .ImmOp(ImmOp)
);

task2 task2(
    .clk(clk),
    .AD1(rs1),
    .AD2(rs2),
    .AD3(rd),
    .WE3(RegWrite),
    .ImmOp(ImmOp),
    .ALUsrc(ALUsrc),
    .ALUctrl(ALUctrl),
    .EQ(EQ),
    .a0(a0)
);

endmodule
