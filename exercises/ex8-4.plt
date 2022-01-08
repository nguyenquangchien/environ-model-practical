reset
set xlabel "Time, t"
set ylabel "Population size, N"
set style data lines
set key top right box

plot 'rk4_05.dat' t "delta=0.5", \
     'rk4_01.dat' t "delta=0.1", \
     'rk4_001.dat' t "delta=0.01", \
     'rk4_0001.dat' t "delta=0.001"
pause -1
