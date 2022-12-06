#include "verilated_vcd_c.h"
#include "verilated.h"
#include "Vcpu.h"

int main (int argc, char **argv, char **env) {
    int i;
    int clk;

    Verilated::commandArgs(argc, argv);

    Vcpu* top = new Vcpu;

    Verilated::traceEverOn(true);
    VerilatedDvdC* tfp = new VerilatedVcdC;
    top->trace (tfp, 99)
    tfp->open ("cpu.vcd");

    top->clk = 1;
    top->rst = 0;

    for (i=0; i<300; i++) {
        for (clk=0; clk<2; clk++) {
            tfp->dump (2*i+clk);
            top->clk = !top->clk;
            top->eval();
        }
        if (Verilated::gotFinish()) exit(0);
    }
    tfp->close();
    exit(0);
}
