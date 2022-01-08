reset
set xlabel "Leaf Area Index, LAI"
set ylabel "Spectral reflectance, rho_canopy"
set style data linespoints
set key bottom right
set yrange [0:*]
plot 'ex6-2a.dat' \
     t "rho_leaf=0.15, tau_leaf=0.07, rho_soil=0.05", \
     'ex6-2b.dat' \
     t "rho_leaf=0.07, tau_leaf=0.15, rho_soil=0.05", \
     'ex6-2c.dat' \
     t "rho_leaf=0.15, tau_leaf=0.07, rho_soil=0.20", \
     'ex6-2c.dat' \
     t "rho_leaf=0.07, tau_leaf=0.15, rho_soil=0.20"
pause -1

set key top right
plot 'ex6-2a.dat' \
     t "rho_leaf=0.0, tau_leaf=0.475, rho_soil=0.125", \
     'ex6-2d.dat' \
     t "rho_leaf=0.475, tau_leaf=0.0, rho_soil=0.125", \
     'ex6-2e.dat' \
     t "rho_leaf=0.0, tau_leaf=0.0, rho_soil=0.125"
pause -1
