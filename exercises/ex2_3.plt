reset
unset key
set style data lines
set xlabel "Easting, m"
set ylabel "Northing, m"
set zlabel "Elevation, m"
set xtics 295000, 1000, 300000
set ytics 315000, 1000, 320000
set ztics 250, 100, 550
set dgrid3d 51,51,16
set style line 9
set pm3d at s hidden3d 9
splot 'efyrnwy.dem' u 1:2:3 with pm3d
pause -1 "Press the return key to continue"
set pm3d at b
splot 'efyrnwy.dem' u 1:2:3 with pm3d
pause -1 "Press the return key to continue"
set pm3d at t
replot
pause -1 "Press the return key to continue"
set pm3d at bst
replot
