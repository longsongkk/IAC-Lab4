module task3 #(
    input logic             clk,
    input logic [4:0]       AD1,
    input logic [4:0]       AD2,
    input logic [4:0]       AD3,
    input logic             WE3,
    input logic [31:0]      ImmOp,
    input logic             ALUsrc,
    input logic             ALUctrl,
    output logic            EQ,
    output logic [31:0]     a0 [4:0]
);

logic [31:0] ALUout;
logic [31:1] ALUop1;
logic [31:0] regOp2;
logic [31:0] ALUop2;

regsiter regfile(
    .clk(clk),
    .AD1(AD1),
    .AD2(AD2),
    .AD3(AD3),
    .WE3(WE3),
    .WD3(ALUout),
    .RD1(ALUop1),
    .RD2(regOp2)
)

ALU_mux mux1(
    .ALUsrc(ALUsrc),
    .din0(regOp2),
    .din1(ImmOp),
    .dout(ALUop2)
)

ALU ALU1(
    .ALUop1(ALUop1),
    .ALUop2(ALUop2),
    .ALUctrl(ALUctrl),
    .SUM(ALUout),
    .EQ(EQ)
)

endmodule
