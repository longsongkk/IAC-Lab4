module ALU_mux #(
    input logic         ALUsrc,
    input logic [31:0]  din0,
    input logic [31:0]  din1,
    output logic [31:0] dout
);

always_comb 
    if (ALUsrc == 1'b1) dout <= din1;
    else dout <= din0;
endmodule
