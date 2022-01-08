reset
set key top right box 
set xdata time
set timefmt "%Y%m%d%H%M"
set format x "%b"
set xlabel "Month, 1998"
set xrange ["199801010000":"199901010000"]
set ylabel "Temperature, degrees Celsius"
set yrange [-5:30]
set y2label "Precipitation, mm"
set ytics nomirror
set y2tics nomirror
set term png
set output "myplot2.png"
plot 'le98temp.dat' u 2:3 t "Maximum temperature" w lp, \
     'le98rain.dat' u 2:3 axes x1y2 t "Precipitation" w i
set output
