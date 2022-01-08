set ylabel "Spectral reflectance, rho_canopy"
set xlabel "Leaf Area Index, LAI"
set style data linespoints
set key 1.25,0.75
plot 'layers.red' title "Red" lt 1 lw 2, \
     'layers.nir' title "NIR" lt 2 lw 2
pause -1

unset key
set xlabel "Number of iterations"
plot 'iterate2.nir' w lp
pause -1

set dummy z
phi_0=1.0
phi(k,z) = phi_0*exp(-k*z)
set key top right
set xlabel "Distance, z"
set ylabel "Phi(z)"
plot [0:10] phi(0.25,z) w l t "k=0.25", \
            phi(0.50,z) w l t "k=0.50", \
            phi(1.00,z) w l t "k=1.00"
pause -1

unset key
set ylabel "Fraction of incident solar radiation"
set xlabel "Number of leaf layers traversed"
plot 'bouguer.red' w lp
pause -1

set fit logfile 'bouguer.fit'
fit phi(k,z) 'bouguer.red' via k

plot 'bouguer.red' w p, phi(k,z) w l
pause -1
