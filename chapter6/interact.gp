reset

set term epslatex "default" 10
set size 0.93,1

# Figure 6.1 - not produced using Gnuplot

# Figure 6.2 - not produced using Gnuplot

# Figure 6.3

set data style lines
set ylabel "Spectral reflectance, $\\rho(\\lambda)$"
set xlabel "Wavelength, $\\lambda/\\SI{}{\\mu m}$"
set key top left
set output "../interaction/figures/spectra.eps"
plot '../interaction/data/spectra.dat' u 1:2 t "Vegetation", \
     '../interaction/data/spectra.dat' u 1:3 t "Soil"
set output

# Figure 6.4 - not produced using Gnuplot

# Figure 6.5 - not produced using Gnuplot

# Figure 6.6 - not produced using Gnuplot

# Figure 6.7 - not produced using Gnuplot

# Figure 6.8 - not produced using Gnuplot

# Figure 6.9

set xlabel "Fraction of ground covered by leaves, $A$"
set ylabel "Spectral reflectance, $\\rho_{\\mathrm{surface}}(\\lambda)$"
set key top left
set yrange [0:0.7]
set data style lp
set output "../interaction/figures/mixture.eps"
plot '../interaction/data/mixture.red' t "Red ($\\SI{0.65}{\\mu m}$)", \
     '../interaction/data/mixture.nir' t "NIR ($\\SI{0.85}{\\mu m}$)"
set output

# Figure 6.10

set xlabel "Vegetation amount, $LAI$"
set ylabel "Spectral reflectance, $\\rho_{\\mathrm{canopy}}(\\lambda)$"
set output "../interaction/figures/canopy.eps"
plot [0:5] '../interaction/data/sail_standard.dat' u 1:($2/100) smooth csplines t "Red (\\SI{0.65}{\\mu m})", \
           '../interaction/data/sail_standard.dat' u 1:($3/100) smooth csplines t "NIR (\\SI{0.85}{\\mu m})"
set output

# Figure 6.11 - not produced using Gnuplot

# Figure 6.12

set xlabel "Fraction of ground covered by leaves, $A$"
set output "../interaction/figures/two-layer.eps"
plot '../interaction/data/2layer.red' t "Red (\\SI{0.65}{\\mu m})", \
     '../interaction/data/2layer.nir' t "NIR (\\SI{0.85}{\\mu m})"
set output

# Figure 6.13 - not produced using Gnuplot

# Figure 6.14

set output "../interaction/figures/two-layer-multiple-scattering.eps"
plot '../interaction/data/2layer2.red' t "Red (\\SI{0.65}{\\mu m})", \
     '../interaction/data/2layer2.nir' t "NIR (\\SI{0.85}{\\mu m})"
set output

# Figure 6.15

set output "../interaction/figures/threelayer.eps"
plot '../interaction/data/3layers.red' u 1:2 t "Red (\\SI{0.65}{\\mu m})", \
     '../interaction/data/3layers.nir' u 1:2 t "NIR (\\SI{0.85}{\\mu m})"
set output
