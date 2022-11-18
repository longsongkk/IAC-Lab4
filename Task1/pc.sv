module pc(
    input  logic [31:0] ImmOp, 
    input  logic clk, rst, PCsrc, 
    output logic [31:0] PC_out
    
);

logic [31:0] PC_in, 
logic [31:0] branch_PC,
logic [31:0] ImmOp, 
logic [31:0] inc_PC, 
logic [31:0] next_PC,


assign branch_PC = PC_in + ImmOp;
assign inc_PC    = PC_out + 32'b100;
assign next_PC   = PCsrc ? branch_PC : inc_PC;



always_ff @(posedge clk, posedge rst) 
    if (rst) PC_out <= 0;
    else     PC_out <= next_PC;


endmodule