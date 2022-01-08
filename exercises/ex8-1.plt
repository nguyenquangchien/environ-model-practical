reset
set xlabel "Time, t"
set ylabel "Population size, N"
set style data points
set key top right box

plot 'ex8-1a.dat' t "lambda=0.95", \
     'ex8-1b.dat' t "lambda=0.90", \
     'ex8-1c.dat' t "lambda=0.85"
pause -1

set key bottom left box
set logscale y
replot
pause -1
