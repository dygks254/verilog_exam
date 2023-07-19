#include <verilated.h>
#include "Vtop.h"

int main(int argc, char** argv){


    VerilatedContext* contextp = new VerilatedContext;
    contextp->commandArgs(argc, argv);
    Vtop* top = new Vtop{contextp};

    while (!contextp->gotFinish()) {
        top->eval();
    }

    top->final();
    
    delete top;
    return 0;

}