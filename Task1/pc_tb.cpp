#include "Vpc"
#include "verilated.h"
#include "verilated_vcd_c.h"
#include "vbuddy.cpp"

int main(int argc, char **argv, char **env) {
    int i;
    int clk;

    Verilated::commandArgs(argc, argv);
    // init top verilog instance
    Vpc* top = new Vpc;
    //init trace dump
    Verilated::traceEverOn(true);
    VerilatedVcdC* tfp = new VerilatedVcdC; 
    top->trace (tfp, 99);
    tfp->open ("pc.vcd")

    //init Vbuddy
    if (vbdOpen()!=1) return(-1);
    vbdHeader("Lab 4: Task 1");
    //vbdSetMode(1);        // Flag mode set to one-shot

    // initialize simulation inputs
    top->clk = 1;
    top->rst = 1;

    for (simcyc=0; simcyc<MAX_SIM_CYC; simcyc++) {
    // dump variables into VCD file and toggle clock
    for (clk=0; clk<2; clk++) {
      tfp->dump (2*simcyc+clk);
      top->clk = !top->clk;
      top->eval ();
    }
    
    //  ++++  Send count value to Vbuddy - Output count values to 7-seg display 
        vbdHex(4, (int(top->PC_out) >> 16) & 0xF);
        vbdHex(3, (int(top->PC_out) >> 8) & 0xF);
        vbdHex(2, (int(top->PC_out) >> 4) & 0xF);
        vbdHex(1, int(top->PC_out) & 0xF);

        
    
    if ((Verilated::gotFinish()) || (vbdGetkey()=='q')) 
      exit(0);                // ... exit if finish OR 'q' pressed
  }

  vbdClose();     // ++++
  tfp->close(); 
  exit(0);
}
}
