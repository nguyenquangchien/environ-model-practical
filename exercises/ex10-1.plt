reset
unset key
set xlabel "Easting, m"
set ylabel "Northing, m"
set xtics 295000, 1000, 300000
set ytics 315000, 1000, 320000
set xrange [295000:300000]
set yrange [320000:315000]
set dgrid3d 51,51,16
set size square
set tics out
set style line 1 lt -1 lw 0.01
set palette gray gamma 1
set pm3d at s hidden3d 1 map
set colorbox vertical user origin 0.8,0.185 size 0.04,0.655
set cblabel "Irradiance, W.m^{-2}"
splot 'efyrnwy.tot' u 1:2:3 w pm3d
pause -1
splot 'efyrnwy.dif' u 1:2:3 w pm3d
pause -1
splot 'efyrnwy.tot' u 1:2:3 w pm3d
pause -1
