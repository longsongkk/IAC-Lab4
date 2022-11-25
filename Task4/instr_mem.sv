module instrMemory #(
    parameter   ADDRESS_WIDTH = 5,
                DATA_WIDTH = 32,
)(
    input logic                     clk,
    input logic [ADDRESS_WIDTH-1:0] A,
    output logic [DATA_WIDTH-1:0]   RD
);

logic [DATA_WIDTH-1:0] instr_array [2**ADDRESS_WIDTH-1:0];

initial begin
    $display("Loading instr ROM.");
    $readmemh("instruction.mem", instr_array);
end;

always_ff @(posedge clk)
    RD <= instr_array [A];

endmodule
