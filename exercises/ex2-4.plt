reset
unset key
set xlabel "Easting, m"
set ylabel "Northing, m"
set zlabel "Elevation, m"
set xtics 295000, 1000, 300000
set ytics 315000, 1000, 320000
set style data lines
set dgrid3d 51,51,16
unset surface
set contour base
set cntrparam levels discrete 300, 325, 350, 375, 400, \
	  425, 450, 475, 500
set terminal push
set terminal table
set output 'contours.dat'
splot 'efyrnwy.dem' using 1:2:3
set output
set terminal pop
plot 'contours.dat' index 0 u 1:2, \
     'contours.dat' index 1 u 1:2, \
     'contours.dat' index 2 u 1:2, \
     'contours.dat' index 3 u 1:2, \
     'contours.dat' index 4 u 1:2, \
     'contours.dat' index 5 u 1:2, \
     'contours.dat' index 6 u 1:2, \
     'contours.dat' index 7 u 1:2, \
     'contours.dat' index 8 u 1:2
