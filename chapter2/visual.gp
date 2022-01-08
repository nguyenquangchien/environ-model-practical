reset
set size 0.93,1
set term epslatex "default" 10

# Figure 2.1 - not produced using Gnuplot

# Figure 2.2 - not produced using Gnuplot
					
# Figure 2.3 

set key nobox
set output "../visualization/figures/x-yplot1.eps"
plot '../visualization/data/le98temp.dat' u 1:3 pt 7 ps 0.75 t "\`le98temp.dat using 1:3\'"
set output

# Figure 2.4

set xlabel "Measurement number, $n$"
set ylabel "Temperature, $T$/degree Celsius"
set key top right box
set yrange [-5:30]
set output "../visualization/figures/x-yplot2.eps"
plot '../visualization/data/le98temp.dat' u 1:3 pt 7 ps 0.75 t "Maximum temperature"
set output

# Figure 2.5

set output "../visualization/figures/x-yplot3.eps"
plot '../visualization/data/le98temp.dat' u 1:3 pt 7 ps 0.75 t "Maximum temperature", \
     '../visualization/data/le98temp.dat' u 1:4 pt 2 ps 0.75 t "Minimum temperature"
set output

# Figure 2.6

set style data lines
set xrange [200:300]
set output "../visualization/figures/x-yplot4.eps"
plot '../visualization/data/le98temp.dat' u 1:3 t "Maximum temperature", \
     '../visualization/data/le98temp.dat' u 1:4 lt 3 t "Minimum temperature"
set output

# Figure 2.7

set output "../visualization/figures/x-yplot4a.eps"
plot '../visualization/data/le98temp.dat' u 1:3 t "Maximum temperature" w lp pt 7 ps 0.75, \
     '../visualization/data/le98temp.dat' u 1:4 lt 1 t "Minimum temperature" w boxes
set output

# Figure 2.8

set xdata time
set timefmt "%Y%m%dT%H%M"
set format x "%d/%m"
set xlabel "Day/Month (1998)"
set xrange ["19980401T0000":"19980701T0000"]
set xtics ("19980401T0000", "19980501T0000", "19980601T0000", "19980701T0000")
set output "../visualization/figures/x-yplot5.eps"
plot '../visualization/data/le98temp.dat' u 2:3 t "Maximum temperature" w lp pt 7 ps 0.75, \
     '../visualization/data/le98temp.dat' u 2:4 t "Minimum temperature" w lp lt 3 ps 0.75 
set output

# Figure 2.9 - not produced using Gnuplot

# Figure 2.10 

set y2label "Precipitation, $P$/\\SI{}{mm}"
set xtics ("19980101T0000", "19980201T0000", "19980301T0000", "19980401T0000", "19980501T0000", "19980601T0000", "19980701T0000", "19980801T0000", "19980901T0000", "19981001T0000", "19981101T0000", "19981201T0000")
set ytics nomirror
set y2tics nomirror
set xlabel "Month (1998)"
set format x "%b"
set xrange ["19980101T0000":"19990101T0000"]
set output "../visualization/figures/x-yplot6.eps"
plot '../visualization/data/le98temp.dat' u 2:3 t "Maximum temperature" w lp lt 1 pt 7 ps 0.75, \
     '../visualization/data/le98rain.dat' u 2:3 axes x1y2 t "Precipitation" w i lt 1
set output

# Figure 2.11

set output "../visualization/figures/epslatex_test.eps"
test
set output

# Figure 2.12 - not produced using gnuplot commands

# Figure 2.13

reset
unset key
set style data points
set xlabel "Easting/\\SI{}{m}"
set ylabel "Northing/\\SI{}{m}"
set zlabel "Elevation/\\SI{}{m}"
set xlabel -4
set format x "\\small{%g}"
set format y "\\small{%g}"
set format z "\\small{%g}"
set xrange [295000:300000]
set yrange [315000:320000]
set xtics 295000,1000,300000
set ytics 315000,1000,320000
set ztics 250,100,550
set ticslevel 0.25
set output "../visualization/figures/efyrnwy_dem_xyz.eps"
splot '../visualization/data/efyrnwy.dem' u 1:2:3 w p pt 7 ps 0.5
set output

# Figure 2.14

set view 45,45,1,1
set output "../visualization/figures/efyrnwy_dem_xyz2.eps"
replot
set output

# Figure 2.15

set style data lines
set dgrid3d 10,10,16
set output "../visualization/figures/efyrnwy_dem_grid.eps"
splot '../visualization/data/efyrnwy.dem' u 1:2:3
set output

# Figure 2.16

set dgrid3d 51,51,16
set output "../visualization/figures/efyrnwy_dem_grid2.eps"
splot '../visualization/data/efyrnwy.dem' u 1:2:3
set output

# Figure 2.17

set hidden3d
set output "../visualization/figures/efyrnwy_dem_grid3.eps"
splot '../visualization/data/efyrnwy.dem' u 1:2:3
set output

# Figure 2.18

set style line 9
set pm3d at s hidden3d 9
unset hidden3d
set cbrange [250:600]
set pm3d at s corners2color geomean hidden3d 9
set output "../visualization/figures/efyrnwy_dem_solid.eps"
splot '../visualization/data/efyrnwy.dem' u 1:2:3 with pm3d
set output

# Figure 2.19

unset pm3d
set hidden3d
set contour base
set cntrparam levels discrete 250, 300, 350, 400, 450, 500
set output "../visualization/figures/efyrnwy_dem_contours.eps"
splot '../visualization/data/efyrnwy.dem' u 1:2:3
set output

# Figure 2.20 - not produced using Gnuplot

# Figure 2.21

set format x "%g"
set format y "%g"
set format z "%g"
unset surface
set view map
set size square

set terminal push
set terminal table
set output "../visualization/data/contours.dat"
splot '../visualization/data/efyrnwy.dem' using 1:2:3
set output
set terminal pop
set grid

set output "../visualization/figures/efyrnwy_contours_grid.eps"
plot '../visualization/data/contours.dat' index 0 u 1:2, \
     '../visualization/data/contours.dat' index 1 u 1:2, \
     '../visualization/data/contours.dat' index 2 u 1:2, \
     '../visualization/data/contours.dat' index 3 u 1:2, \
     '../visualization/data/contours.dat' index 4 u 1:2, \
     '../visualization/data/contours.dat' index 5 u 1:2
set output

set terminal push
set terminal png
set output "../visualization/figures/myplot.png"
replot
set output
set terminal pop

# load 'visual.gp'
