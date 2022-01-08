reset

set size 0.93,1
set term epslatex "default" 10
set style data lines

# Figure 9.1 - Not produced using Gnuplot

# Figure 9.2
unset key
set dummy t
set xzeroaxis
beta(t)=1.0-0.003265*(22.5-t)**2
set xlabel "Temperature, $T_{\\mathrm{global}}/\\degC$"
set ylabel "Growth rate, $\\beta$"
set xrange [0:50]
set output "../daisyworld/figures/growth_rate.eps"
plot beta(t)
set output

# Figure 9.3 - not produced in Gnuplot

# Figure 9.4

set xlabel "Time, $t$
set ylabel "Temperature, $T_{\\mathrm{global}}/\\degC$"
unset key
set xrange [0:50]
set output "../daisyworld/figures/sslum100.eps"
plot '../daisyworld/data/daisy1.dat' u 1:2 w l lw 2
set output

# Figure 9.5

set style data lines
set ylabel "Fractional area covered, $a$"
set format y "%4.2f"
set key bottom right box
set output "../daisyworld/figures/sslum100x.eps"
plot '../daisyworld/data/daisy1.dat' u 1:3 t "Black daisies" lw 2, \
     '../daisyworld/data/daisy1.dat' u 1:4 t "White daisies" lw 2
set output

# Figure 9.6

set ylabel "Temperature, $T_{\\mathrm{global}}//\\degC$"
set key top right box
set output "../daisyworld/figures/sslumvar.eps"
plot '../cdrom/exercises/ex9-1_12.dat' u 1:2 t "$L=1.2$", \
     '../cdrom/exercises/ex9-1_11.dat' u 1:2 t "$L=1.1$", \
     '../cdrom/exercises/ex9-1_10.dat' u 1:2 t "$L=1.0$", \
     '../cdrom/exercises/ex9-1_09.dat' u 1:2 t "$L=0.9$", \
     '../cdrom/exercises/ex9-1_08.dat' u 1:2 t "$L=0.8$"
set output

# Figure 9.7

set format y "%g"
set xrange [0.5:1.7]
set xzeroaxis
set key top left Left box
set ylabel "Temperature, $T_{\\mathrm{global}}/\\degC$"
set xlabel "Solar luminosity, $L$"
set output "../daisyworld/figures/daisyworld_nolife.eps"
plot '../daisyworld/data/nolife.dat' u 1:2 t "No biota" lw 2, \
     '../daisyworld/data/daisy2.dat' u 1:2 t "With biota" lw 2
set output

# Figure 9.8

unset key
set ylabel "Fractional area covered, $a$"
set output "../daisyworld/figures/daisyworld_area.eps"
plot '../daisyworld/data/daisy2.dat' u 1:3 lw 2, \
     '../daisyworld/data/daisy2.dat' u 1:4 lw 2
set output
     
# Figure 9.9

set key top left box
set ylabel "Global average temperature, $T_{\\mathrm{global}}/\\degC$"
set output "../daisyworld/figures/daisyworld_gray_temp.eps"
plot '../daisyworld/data/nolife.dat' u 1:2 t "No biota" lt 0 lw 2, \
     '../daisyworld/data/daisy2.dat' u 1:2 t "2 species" lt 1 lw 2, \
     '../daisyworld/data/daisy3.dat' u 1:2 t "3 species" lt 2 lw 2	  
set output

# Figure 9.10

unset key
set ylabel "Fractional area covered, $a$"
set output "../daisyworld/figures/daisyworld_area_gray.eps"
plot '../daisyworld/data/daisy3.dat' u 1:3 lw 2, \
     '../daisyworld/data/daisy3.dat' u 1:4 lw 2, \
     '../daisyworld/data/daisy3.dat' u 1:5 lw 2	  
set output

# Figure 9.11 - not produced in Gnuplot

exit

# Figure 9.12

set style data lines
set xlabel "Solar luminosity, $L$"
set ylabel "Temperature, $T_{\\mathrm{global}}/\\degC$"
set xzeroaxis
set key bottom right box
set output "../daisyworld/figures/sensitb1.eps"
plot '../daisyworld/data/daisy4_b010.dat' t "$A_{\\mathrm{black}}$=0.10", \
     '../daisyworld/data/daisy4_b015.dat' t "$A_{\\mathrm{black}}$=0.15", \
     '../daisyworld/data/daisy4_b020.dat' t "$A_{\\mathrm{black}}$=0.20", \
     '../daisyworld/data/daisy4_b025.dat' t "$A_{\\mathrm{black}}$=0.25", \
     '../daisyworld/data/daisy4_b030.dat' t "$A_{\\mathrm{black}}$=0.30", \
     '../daisyworld/data/daisy4_b035.dat' t "$A_{\\mathrm{black}}$=0.35", \
     '../daisyworld/data/daisy4_b040.dat' t "$A_{\\mathrm{black}}$=0.40", \
     '../daisyworld/data/daisy4_b045.dat' t "$A_{\\mathrm{black}}$=0.45"
set output

# Figure 9.13

set output "../daisyworld/figures/sensitw1.eps"
plot '../daisyworld/data/daisy4_w055.dat' t "$A_{\\mathrm{white}}$=0.55", \
     '../daisyworld/data/daisy4_w060.dat' t "$A_{\\mathrm{white}}$=0.60", \
     '../daisyworld/data/daisy4_w065.dat' t "$A_{\\mathrm{white}}$=0.65", \
     '../daisyworld/data/daisy4_w070.dat' t "$A_{\\mathrm{white}}$=0.70", \
     '../daisyworld/data/daisy4_w075.dat' t "$A_{\\mathrm{white}}$=0.75", \
     '../daisyworld/data/daisy4_w080.dat' t "$A_{\\mathrm{white}}$=0.80", \
     '../daisyworld/data/daisy4_w085.dat' t "$A_{\\mathrm{white}}$=0.85", \
     '../daisyworld/data/daisy4_w090.dat' t "$A_{\\mathrm{white}}$=0.90"
set output

# Figure 9.14

set key top right box
set ylabel "Fractional area covered, $a_{\\mathrm{black}}$"
set output "../daisyworld/figures/sensitb2.eps"
plot '../daisyworld/data/daisy4_b010.dat' u 1:3 t "$A_{\\mathrm{black}}$=0.10", \
     '../daisyworld/data/daisy4_b015.dat' u 1:3 t "$A_{\\mathrm{black}}$=0.15", \
     '../daisyworld/data/daisy4_b020.dat' u 1:3 t "$A_{\\mathrm{black}}$=0.20", \
     '../daisyworld/data/daisy4_b025.dat' u 1:3 t "$A_{\\mathrm{black}}$=0.25", \
     '../daisyworld/data/daisy4_b030.dat' u 1:3 t "$A_{\\mathrm{black}}$=0.30", \
     '../daisyworld/data/daisy4_b035.dat' u 1:3 t "$A_{\\mathrm{black}}$=0.35", \
     '../daisyworld/data/daisy4_b040.dat' u 1:3 t "$A_{\\mathrm{black}}$=0.40", \
     '../daisyworld/data/daisy4_b045.dat' u 1:3 t "$A_{\\mathrm{black}}$=0.45"
set output

# Figure 9.15

set ylabel "Fractional area covered, $a_{\\mathrm{white}}$"
set output "../daisyworld/figures/sensitw2.eps"
plot '../daisyworld/data/daisy4_b010.dat' u 1:4 t "$A_{\\mathrm{black}}$=0.10", \
     '../daisyworld/data/daisy4_b015.dat' u 1:4 t "$A_{\\mathrm{black}}$=0.15", \
     '../daisyworld/data/daisy4_b020.dat' u 1:4 t "$A_{\\mathrm{black}}$=0.20", \
     '../daisyworld/data/daisy4_b025.dat' u 1:4 t "$A_{\\mathrm{black}}$=0.25", \
     '../daisyworld/data/daisy4_b030.dat' u 1:4 t "$A_{\\mathrm{black}}$=0.30", \
     '../daisyworld/data/daisy4_b035.dat' u 1:4 t "$A_{\\mathrm{black}}$=0.35", \
     '../daisyworld/data/daisy4_b040.dat' u 1:4 t "$A_{\\mathrm{black}}$=0.40", \
     '../daisyworld/data/daisy4_b045.dat' u 1:4 t "$A_{\\mathrm{black}}$=0.45"
set output
