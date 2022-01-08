gawk -f mixture.awk -v rho_leaf=0.475 -v rho_soil=0.125 > mixture.nir
gawk -f mixture.awk -v rho_leaf=0.04 -v rho_soil=0.08 > mixture.red
gawk -f twolayer.awk -v rho_leaf=0.475 -v tau_leaf=0.475 -v rho_soil=0.125 > 2layer.nir
gawk -f twolayer.awk -v rho_leaf=0.04 -v tau_leaf=0.04 -v rho_soil=0.08 > 2layer.red
gawk -f twolayr2.awk -v rho_leaf=0.475 -v tau_leaf=0.475 -v rho_soil=0.125 > 2layer2.nir
gawk -f twolayr2.awk -v rho_leaf=0.04 -v tau_leaf=0.04 -v rho_soil=0.08 > 2layer2.red
gawk -f 3layers.awk -v rho_leaf=0.475 -v tau_leaf=0.475 -v rho_soil=0.125 > 3layers.nir
gawk -f 3layers.awk -v rho_leaf=0.04 -v tau_leaf=0.04 -v rho_soil=0.08 > 3layers.red
