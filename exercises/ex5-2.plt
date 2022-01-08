set xdata time
set timefmt "%Y%m%dT%H%M"
set xrange ["19980621T0000":"19980622T0000"]
set x2range [0:24]
set key top left Left box
set xlabel "Time"
set xtics nomirror
set format x "%H:%M"
set ylabel "Global solar irradiance, W.m^2"
plot 'radt98le.out' u 1:2 t "Measured" w lp lw 2 pt 7, \
     'ex5-2.out' axes x2y1 t "Modeled" w lp lw 2 pt 7
