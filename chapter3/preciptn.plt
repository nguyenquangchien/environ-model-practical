reset
unset key
set xdata time
set timefmt "%Y%m%dT%H%M"
set format x "%b"
set xlabel "Month (1998)"
set ylabel "Accumulated precipitation, P/mm"
set xrange ["19980101T0000":"19990101T0000"]
plot 'rain98le.out' u 1:2 w i
pause -1

set datafile missing "-99.9"
replot
pause -1
