module Sign-extension(
    input logic [11:0]        Imm_br,
    input logic [11:0]       Imm_imm,
    input logic              Immsrc,
    output logic [31:0]      ImmOp
);
assign [11:0] Imm;
always_comb begin
    if(Immsrc)
        Imm<=Imm_mm;
    else 
        Imm<=Imm_br;

    Immop={20{Imm[11],Imm[11:0]}};
end
endmoule