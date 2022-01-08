gawk -f 3layers.awk -v rho_leaf=0.15 -v tau_leaf=0.07 -v rho_soil=0.05 > ex6-2a.dat
gawk -f 3layers.awk -v rho_leaf=0.07 -v tau_leaf=0.15 -v rho_soil=0.05 > ex6-2b.dat
gawk -f 3layers.awk -v rho_leaf=0.15 -v tau_leaf=0.07 -v rho_soil=0.20 > ex6-2c.dat
gawk -f 3layers.awk -v rho_leaf=0.07 -v tau_leaf=0.15 -v rho_soil=0.20 > ex6-2d.dat
gawk -f 3layers.awk -v rho_leaf=0.0 -v tau_leaf=0.475 -v rho_soil=0.125 > ex6-2e.dat
gawk -f 3layers.awk -v rho_leaf=0.475 -v tau_leaf=0.0 -v rho_soil=0.125 > ex6-2f.dat
gawk -f 3layers.awk -v rho_leaf=0.0 -v tau_leaf=0.0 -v rho_soil=0.125 > ex6-2g.dat
