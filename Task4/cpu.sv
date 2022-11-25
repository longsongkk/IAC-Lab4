module cpu #(
    input logic             clk,
    input logic             rst,
    output logic [31:0]     a0 [4:0]
);

logic [31:0]    PCout;
logic [31:0]    instr;
logic [6:0]     instr_opcode;
logic [5:0]     rs1;
logic [5:0]     rs2;
logic [5:0]     rd;

assign instr_opcode = {instr[6:0]};
assign rs1 = {instr[19:15]};
assign rs2 = {instr[24:20]};
assign rd = {instr[11:7]};

logic [2:0]     ALUctrl;
logic           ALUsrc;
logic           ImmSrc;
logic           RegWrite;
logic           PCsrc;

logic [31:0]    ALUop1;
logic [31:0]    regOp2;
logic [31:0]    ImmOp;
logic [31:0]    ALUop2;
logic [31:0]    ALUout;
logic           EQ;

pc programCounter (
    .clk(clk),
    .rst(rst),
    .PCsrc(PCsrc),
    .PC_out(PCout),
    .ImmOp(ImmOp)
)

control controlUnit (
    .EQ(EQ),
    .instr_opcode(instr_opcode),
    .RegWrite(RegWrite),
    .ALUctrl(ALUctrl),
    .ALUsrc(ALUsrc),
    .ImmSrc(ImmSrc),
    .PCsrc(PCsrc)
)

register registerFile (
    .clk(clk),
    .AD1(rs1),
    .AD2(rs2),
    .AD3(rd),
    .WE3(RegWrite),
    .WD3(ALUout),
    .RD1(ALUop1),
    .RD2(ALUop2),
    .a0(a0)
)

ALU ALU (
    .ALUop1(ALUop1),
    .ALUop2(ALUop2),
    .ALUctrl(ALUctrl),
    .ALUout(ALUout),
    .EQ(EQ)
)

ALU_mux ALUMux (
    .ALUsrc(ALUsrc),
    .regOp2(regOp2),
    .ImmOp(ImmOp),
    .ALUop2(ALUop2)
)

