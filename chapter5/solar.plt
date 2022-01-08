reset
unset key
set xdata time
set timefmt "%Y%m%dT%H%M"
set format x "%b"
set xlabel "Month (1998)"
set ylabel "Solar irradiance, W.h.m^-2"
set xrange ["19980101T0000":"19990101T0000"]
plot 'radt98le.out' u 1:2 w i
pause -1

set format x "%H%M"
set xlabel "Hour"
set xrange ["19980621T0000":"19980621T2359"]
plot 'radt98le.out' u 1:2 w boxes
pause -1

reset
set xrange [0:365]
set style data lines
set key top left Left box
set xlabel "Day of Year (1998), DoY"
set ylabel "Solar irradiance, W.h.m^-2"
plot 'solarrd2.out' u 1:2 t "Global" lw 2, \
     'solarrd2.out' u 1:3 t "Direct" lw 2, \
     'solarrd2.out' u 1:4 t "Diffuse" lw 2
pause -1

unset key
set xdata time
set timefmt "%Y%m%dT%H%M"
set format x "%b"
set xlabel "Month (1998)"
set x2label "Day of Year (1998), DoY"
set xrange ["19980101T0000":"19990101T0000"]
set x2range [0:365]
set xtics nomirror 
set x2tics nomirror auto 
plot 'radt98le.out' u 1:2 w i, \
     'solarrd2.out' u 1:2 w l axes x2y1 lw 2
pause -1
