reset

set term epslatex "default" 10
set size 0.93,1

# Figure 7.1 - not produced using Gnuplot

# Figure 7.2 - not produced using Gnuplot

# Figure 7.3 - not produced using Gnuplot

# Figure 7.4 - not produced using Gnuplot

# Figure 7.5 - not produced using Gnuplot

# Figure 7.6 - not produced using Gnuplot

# Figure 7.7 - not produced using Gnuplot

# Figure 7.8 - not produced using Gnuplot

# Figure 7.9 - not produced using Gnuplot

# Figure 7.10 - not produced using Gnuplot

# Figure 7.11

set ylabel "Spectral reflectance, $\\rho_{\\mathrm{canopy}}$"
set xlabel "Leaf Area Index, LAI"
set style data linespoints
set key 1.25,0.75
set output "../iterative_solutions/figures/layers-both.eps"
plot '../iterative_solutions/data/layers.red' title "Red" lt 1 lw 2, \
     '../iterative_solutions/data/layers.nir' title "NIR" lt 2 lw 2
set output

# Figure 7.12

unset key
set xlabel "Number of iterations"
set output "../iterative_solutions/figures/iterations-both.eps"
plot '../iterative_solutions/data/iterate2.nir' w lp
set output

# Figure 7.13 - not produced using Gnuplot

# Figure 7.14

set dummy z
phi_0=1.0
phi(k,z) = phi_0*exp(-k*z)
set key top right
set xlabel "Distance, $z$"
set ylabel "$\\Phi(z)$"
set output "../iterative_solutions/figures/Beers.eps"
plot [0:10] phi(0.25,z) w l t "$k=0.25$", \
            phi(0.50,z) w l t "$k=0.50$", \
            phi(1.00,z) w l t "$k=1.00$"
set output

# Figure 7.15

unset key
set ylabel "Fraction of incident solar radiation"
set xlabel "Number of leaf layers traversed"
set output "../iterative_solutions/figures/extinction-both.eps"
plot '../iterative_solutions/data/bouguer.red' w lp
set output

# Figure 7.16

set fit logfile '../iterative_solutions/data/bouguer.fit'
fit phi(k,z) '../iterative_solutions/data/bouguer.red' via k

# Figure 7.17

set output "../iterative_solutions/figures/extinction-both-fitted.eps"
plot '../iterative_solutions/data/bouguer.red' w p, phi(k,z) w l
set output
