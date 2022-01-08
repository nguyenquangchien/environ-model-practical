reset
unset key
set xlabel "Easting, m"
set ylabel "Northing, m"
set xtics 295000, 1000, 300000
set ytics 315000, 1000, 320000
set dgrid3d 51,51,16
set size square
set tics out
set style line 1 lt -1 lw 0.01
set palette gray gamma 1
set pm3d at s hidden3d 1 map
set colorbox vertical user origin 0.8,0.185 size 0.04,0.655
set cblabel "Elevation, m"
splot 'efyrnwy.dem' u 1:2:3 w pm3d
pause -1

set xrange [295000:300000]
set yrange [320000:315000]
set cblabel "Gradient, arc degrees"
splot 'gradient.dem' u 1:2:3 w pm3d
pause -1

set cbrange [0:360]
set cbtics 0,30,360
set cblabel "Aspect, arc degrees"
set palette gray rgbformulae -13,-13,-13
splot 'aspect.dem' u 1:2:3 w pm3d
pause -1

set palette gray
set zrange [*:*]
set cbrange [*:*]
set cbtics autofreq
set cblabel "Irradiance W.m^{-2}"
splot 'efyrnwy.dir' u 1:2:3 w pm3d
pause -1

splot 'efyrnwy.dif' u 1:2:3 w pm3d
pause -1

splot 'efyrnwy.tot' u 1:2:3 w pm3d
pause -1

plot 'efyrnwy.ld8' u 1:2:3:4 w vector nohead
pause -1

plot 'efyrnwy.ld8' u 1:2:3:4 w vector nohead,\
     'rivers.dat' w l lt 3 lw 2
pause -1

load 'efyrnwy.arr'
unset key
set style line 1 lt -1 lw 0.01
set dgrid3d 51,51,16
set pm3d at s hidden3d 1
set palette gray
set colorbox vertical user origin 0.8,0.185 size 0.04,0.655
set cblabel "Elevation, m"
set view 45,45,1,1
set surface
splot 'efyrnwy.dem' w pm3d
pause -1

quit
