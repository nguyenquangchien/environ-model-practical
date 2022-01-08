reset
set style data lines
set ylabel "Temperature, T_global/deg C"
set xlabel "Time, t"
unset key
set xrange [0:50]
plot 'daisy1.dat' u 1:2 lw 2
pause -1

set ylabel "Fractional area, a"
set format y "%4.2f"
set key bottom right box
plot 'daisy1.dat' u 1:3 t "Black daisies" lw 2, \
     'daisy1.dat' u 1:4 t "White daisies" lw 2
pause -1

set format y "%g"
set xrange [0.5:1.7]
set xzeroaxis
set key top left Left box
set ylabel "Temperature, T_global/deg C"
set xlabel "Solar luminosity, L"
plot 'nolife.dat' u 1:2 t "No biota" lw 2, \
     'daisy2.dat' u 1:2 t "With biota" lw 2
pause -1

unset key
set ylabel "Fractional area covered, a"
plot 'daisy2.dat' u 1:3 lw 2, \
     'daisy2.dat' u 1:4 lw 2
pause -1
     
set key top left box
set ylabel "Temperature, T_global/deg C"
plot 'nolife.dat' u 1:2 t "No biota" lt 0 lw 2, \
     'daisy2.dat' u 1:2 t "2 species" lt 1 lw 2, \
     'daisy3.dat' u 1:2 t "3 species" lt 2 lw 2	  
pause -1

unset key
set ylabel "Fractional area, a"
plot 'daisy3.dat' u 1:3 t "Black daisies" lw 2, \
     'daisy3.dat' u 1:4 t "Gray daisies" lw 2, \
     'daisy3.dat' u 1:5 t "White daisies" lw 2	  
pause -1
