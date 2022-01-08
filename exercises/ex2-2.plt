reset
unset key
set style data points
set xlabel "Easting, m"
set ylabel "Northing, m"
set zlabel "Elevation, m"
set xtics 295000, 1000, 300000
set ytics 315000, 1000, 320000
set ztics 250, 100, 550
splot 'efyrnwy.dem' u 1:2:3
pause -1 "Press the return key to continue"

set view 45, 45, 1, 1
replot
pause -1 "Press the return key to continue"

set view 45, 60, 1, 1
replot
pause -1 "Press the return key to continue"

set view 60, 60, 1, 1
replot
pause -1  "Press the return key to continue"
