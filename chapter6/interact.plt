set xlabel "Fraction of ground covered by leaves, A"
set ylabel "Spectral reflectance, rho_surface(lambda)"
set key top left
set yrange [0:0.7]
set data style lp
plot 'mixture.red' t "Red (0.65 micrometers)", \
     'mixture.nir' t "NIR (0.85 micrometers)"
pause -1

set ylabel "Spectral reflectance, rho_canopy(lambda)"
plot '2layer.red' t "Red (0.65 micrometers)", \
     '2layer.nir' t "NIR (0.85 micrometers)"
pause -1

plot '2layer2.red' t "Red (0.65 micrometers)", \
     '2layer2.nir' t "NIR (0.85 micrometers)"
pause -1

set xlabel "Leaf Area Index (LAI)"
plot '3layers.red' u 1:2 t "Red (0.65 micrometers)", \
     '3layers.nir' u 1:2 t "NIR (0.85 micrometers)"
pause -1
