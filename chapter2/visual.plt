reset

plot 'le98temp.dat' using 1:3
pause -1

set xlabel "Measurement number, n"
set ylabel "Temperature, T/degree Celsius"
set key top right box 
set yrange [-5:30]
plot 'le98temp.dat' using 1:3 title "Maximum temperature"
pause -1

plot 'le98temp.dat' u 1:3 t "Maximum temperature", \
     'le98temp.dat' u 1:4 t "Minimum temperature"
pause -1

set style data lines
set xrange [200:300]
replot
pause -1

plot 'le98temp.dat' u 1:3 t "Maximum temperature" w lp,\
     'le98temp.dat' u 1:4 t "Minimum temperature" w boxes
pause -1

set xdata time
set timefmt "%Y%m%dT%H%M"
set format x "%d/%m"
set xlabel "Day/Month (1998)"
set xrange ["19980401T0000":"19980701T0000"]
plot 'le98temp.dat' u 2:3 t "Maximum temperature" w lp, \
     'le98temp.dat' u 2:4 t "Minimum temperature" w lp 
pause -1

set y2label "Precipitation, P/mm"
set ytics nomirror
set y2tics nomirror
set xlabel "Month (1998)"
set format x "%b"
set xrange ["19980101T0000":"19990101T0000"]
plot 'le98temp.dat' u 2:3 t "Maximum temperature" w lp, \
     'le98rain.dat' u 2:3 axes x1y2 t "Precipitation" w i
pause -1

test
pause -1

reset
unset key
set style data points
set xlabel "Easting/m"
set ylabel "Northing/m"
set zlabel "Elevation/m"
set xtics 295000, 1000, 300000
set ytics 315000, 1000, 320000
set ztics 250, 100, 550
splot 'efyrnwy.dem' u 1:2:3
pause -1

set view 45, 45, 1, 1
replot
pause -1

set style data lines
set dgrid3d 10, 10, 16
replot
pause -1

set dgrid3d 51, 51, 16
replot
pause -1

set hidden3d
replot
pause -1

set style line 9
set pm3d at s hidden3d 9
unset hidden3d
splot 'efyrnwy.dem' u 1:2:3 with pm3d
pause -1

unset pm3d
set hidden3d
set contour base
set cntrparam levels discrete 250, 300, 350, 400, 450, 500
splot 'efyrnwy.dem' u 1:2:3
pause -1

unset surface
set view map
set size square
replot
pause -1

set terminal push
set terminal table
set output 'contours.dat'
splot 'efyrnwy.dem' using 1:2:3
set output
set terminal pop
set grid
plot 'contours.dat' index 0 u 1:2, \
     'contours.dat' index 1 u 1:2, \
     'contours.dat' index 2 u 1:2, \
     'contours.dat' index 3 u 1:2, \
     'contours.dat' index 4 u 1:2, \
     'contours.dat' index 5 u 1:2
pause -1

set terminal push
set terminal emf "Times Roman" 12
set output 'myplot.emf'
replot
set output
set terminal pop

# load 'visual.plt'
