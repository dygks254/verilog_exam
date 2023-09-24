# verilog_exam

- Single repo for RTL example simulation
- Executed based on the "verilator" tool.
- The Verilator installation follows the tool installation below
- Two files are required for simulation. ( `top.v`, `sim_main.cpp` )

# install verilator
```
sudo apt-get install libfl2 help2man libfl-dev

git clone https://git.veripool.org/git/verilator
unset VERILATOR_ROOT
cd verilator
git checkout {tag-version}

autoconf
./configure --prefix={tool-path}
make
sudo make install
```

# command
### example test simulation
```
make
```
### TARGET test simulation
```
make TARGET=.default_sim
```

### check lint
```
cd scripts
flake8 --count --show-source --statistics
```

Used Quartus II ( Or vcs )
