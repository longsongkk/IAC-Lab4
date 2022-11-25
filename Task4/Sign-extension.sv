module Sign-extension(
    input logic [11:0]       Imm_br,
    input logic [11:0]       Imm_imm,
    input logic              ImmSrc,
    output logic [31:0]      ImmOp
);

assign [11:0] Imm;
always_comb begin
    if(ImmSrc)
        Imm<=Imm_imm;
    else 
        Imm<=Imm_br;

    ImmOp={20{Imm[11],Imm[11:0]}};
end
endmoule