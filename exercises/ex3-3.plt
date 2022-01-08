reset
set xdata time
set timefmt "%Y%m%dT%H%M"
set format x "%d/%m"
set xlabel "Day/Month, 1998"
set ylabel "Temperature, t/degree Celsius"
set xrange ["19980401T0000":"19980701T0000"]
set yrange [-5:30]
set key top right box
set data style linespoints
plot 'le98temp.out' u 2:3 t "Maximum temperature", \
     'le98temp.out' u 2:4 t "Minimum temperature"
