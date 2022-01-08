reset
set size 0.93,1
set term epslatex "default" 10

# Figure 5.1 - not produced using Gnuplot

# Figure 5.2 - not produced using Gnuplot

# Figure 5.3 - not produced using Gnuplot

# Figure 5.4

unset key
set xdata time
set timefmt "%Y%m%dT%H%M"
set format x "%b"
set xlabel "Month (1998)"
set ylabel "Solar irradiance, \\SI{}{W.h.m^{-2}}"
set xrange ["19980101T0000":"19990101T0000"]
set output "../solar_radiation/figures/solar_irradiance.eps"
plot '../solar_radiation/data/radt98le.out' u 1:2 w i
set output

# Figure 5.5

set format x "%H%M"
set xlabel "Hour"
set xrange ["19980621T0000":"19980621T2359"]
set output "../solar_radiation/figures/solar_irradiance_daily.eps"
plot '../solar_radiation/data/radt98le.out' u 1:2 w boxes
set output

# Figure 5.6 - not produced using Gnuplot

# Figure 5.7 - not produced using Gnuplot

# Figure 5.8 

unset key
set xdata
set xrange [*:*]
set format x "%g"
set ylabel "Spectral emittance, $M(\\lambda)$/\\SI{}{MW.m^{-2}.\\mu m^{-1}}"
set xlabel "Wavelength, $\\lambda$/\\SI{}{\\mu m}"
set output "../solar_radiation/figures/blackbody_5800.eps"
plot '../solar_radiation/data/blackbody_5800.dat' u ($1):($2/1000000.0) w l lw 2
set output

# Figure 5.9

set yrange [0:2500]
set ylabel "Spectral irradiance, $E_{0}(\\lambda)$/\\SI{}{W.m^{-2}.\\mu m^{-1}}"
set output "../solar_radiation/figures/blackbody_5800_inverse_square.eps"
plot '../solar_radiation/data/inver_sq.dat' u 1:2 w l lw 2
set output

# Figure 5.10 

set key top right box
set xdata
set xrange [*:*]
set yrange [*:*]
set format x "%g"
set samples 200
set ylabel "Spectral irradiance, \\SI{}{W.m^{-2}.\\mu m^{-1}}"
set output "../solar_radiation/figures/standard_solar_irradiance.eps"
plot '../solar_radiation/data/standard_solar_irradiance.out' u 1:2 smooth unique t "Exo-atmospheric solar spectrum" w l lw 2, \
     '../solar_radiation/data/standard_solar_irradiance_sea_level.dat' u 1:3 smooth unique t "Sea-level solar spectrum" w l lw 2
set output

# Figure 5.11 - not produced using Gnuplot

# Figure 5.12

unset key
set xlabel "Wavelength, $\\lambda$/\\SI{}{\\mu m}"
set yrange [0:1]
set ylabel "Atmospheric transmittance, $\\tau$
set y2label "Atmospheric absorbtance"
set y2range [1:0]
set y2tics (1,0.8,0.6,0.4,0.2,0)
set output "../solar_radiation/figures/atmospheric_transmittance.eps"
plot '../solar_radiation/data/atmospheric_transmission.out' u 1:2 smooth unique w l lw 1.5
set output

# Figure 5.13 - not produced using Gnuplot

# Figure 5.14 - not produced using Gnuplot

# Figure 5.15

unset y2label
unset key
unset y2tics
set yrange [*:*]
set xrange [0:365]
set zeroaxis
set ylabel "Solar declination angle, $\\delta$"
set xlabel "Day of Year, $DoY$"
set output "../solar_radiation/figures/solar_declination.eps"
plot '../solar_radiation/data/solar_declination.dat' u 1:2 w l lw 2
set output

# Figure 5.16 - not produced using Gnuplot

# Figure 5.17 - not produced using Gnuplot

# Figure 5.18 - not produced using Gnuplot

# Figure 5.19

reset
set size 0.93,1
set term epslatex "default" 10
set xrange [0:365]
set style data lines
set key top left Left box
set xlabel "Day of Year (1998), $DoY$"
set ylabel "Solar irradiance, \\SI{}{W.h.m^{-2}}"
set output "../solar_radiation/figures/simulated_irradiance.eps"
plot '../solar_radiation/data/solarrd2.out' u 1:2 t "Global" lw 2, \
     '../solar_radiation/data/solarrd2.out' u 1:3 t "Direct" lw 2, \
     '../solar_radiation/data/solarrd2.out' u 1:4 t "Diffuse" lw 2
set output

# Figure 5.20

unset key
set xdata time
set timefmt "%Y%m%dT%H%M"
set format x "%b"
set xlabel "Month (1998)"
set x2label "Day of Year (1998), $DoY$"
set xrange ["19980101T0000":"19990101T0000"]
set x2range [0:365]
set xtics nomirror 
set x2tics nomirror auto 
set output "../solar_radiation/figures/solar_irradiance_compared.eps"
plot '../solar_radiation/data/radt98le.out' u 1:2 w i, \
     '../solar_radiation/data/solarrd2.out' u 1:2 w l axes x2y1 lw 2
set output
