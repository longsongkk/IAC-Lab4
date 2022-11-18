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
logic       EQ;


endmodule
