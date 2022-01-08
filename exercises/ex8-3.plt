reset
set xlabel "Time, t"
set ylabel "Population size, N"
set style data lines
set key top right box
plot 'ex8-3.dat' t "r=0.07, K=100"
pause -1
