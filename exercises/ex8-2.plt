reset
set xlabel "Time, t"
set ylabel "Population size, N"
set style data lines
set key top right box

plot 'ex8-2a.dat' t "r=-0.05", \
     'ex8-2b.dat' t "r=-0.10", \
     'ex8-2c.dat' t "r=-0.15"
pause -1

set key bottom left box
set logscale y
replot
pause -1
