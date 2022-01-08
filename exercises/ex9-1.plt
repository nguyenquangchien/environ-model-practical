reset
set yrange [0:0.7]
set style data lines
set key top right box
set xlabel "Time, t"
set ylabel "Fractional area covered by black daisies"
plot 'ex9-1_08.dat' u 1:3 t "L=0.8", \
     'ex9-1_09.dat' u 1:3 t "L=0.9", \
     'ex9-1_10.dat' u 1:3 t "L=1.0", \
     'ex9-1_11.dat' u 1:3 t "L=1.1", \
     'ex9-1_12.dat' u 1:3 t "L=1.2"
pause -1

set ylabel "Fractional area covered by white daisies"
plot 'ex9-1_08.dat' u 1:4 t "L=0.8", \
     'ex9-1_09.dat' u 1:4 t "L=0.9", \
     'ex9-1_10.dat' u 1:4 t "L=1.0", \
     'ex9-1_11.dat' u 1:4 t "L=1.1", \
     'ex9-1_12.dat' u 1:4 t "L=1.2"
pause -1
