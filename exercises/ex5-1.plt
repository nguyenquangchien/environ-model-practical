reset
unset key
set xdata time
set timefmt "%Y%m%dT%H%M"
set format x "%b"
set xlabel "Month, 1998"
set ylabel "Solar irradiance, W.h.m^-2"
set xrange ["19980101T1200":"19990101T1200"]
plot 'ex5-1.dat' u 1:2 w i
