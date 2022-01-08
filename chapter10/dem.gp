reset

set size 0.93,1
set term epslatex color "default" 10

# Figure 10.1

unset key
set size 1.24, 1.333
set xtics 295000, 1000, 300000
set ytics 315000, 1000, 320000
set xrange [295000:300000]
set yrange [315000:320000]
set ztics 250, 100, 550
set xlabel "Easting, \\SI{}{m}"
set ylabel "Northing, \\SI{}{m}"
set size square
set tics out
set style line 1 lt -1 lw 0.01
set dgrid3d 51,51,16
set pm3d at s hidden3d 1 map
set palette gray gamma 1.0
set palette ps_allcF
set colorbox vertical user origin 0.95,0.265 size 0.04,0.85
set cblabel "Elevation, \\SI{}{m}"
set output "../further_topics/figures/dem_planimetric.eps"
splot '../cdrom/chapter10//efyrnwy.dem' w pm3d
set output

# Figure 10.2

# Figure 10.3

set size 1.24, 1.333
set colorbox vertical user origin 0.95,0.265 size 0.04,0.85
set cblabel "Gradient, \\arcdeg"
set output "../further_topics/figures/dem_gradient.eps"
splot '../cdrom/chapter10/gradient.dem' w pm3d
set output

# Figure 10.4

set cblabel "Aspect, \\arcdeg"
set cbrange [0:360]
set cbtics 0,30,360
set palette gray rgbformulae -13,-13,-13
set output "../further_topics/figures/dem_aspect.eps"
splot '../cdrom/chapter10//aspect.dem' w pm3d
set output
set palette gray

# Figure 10.5

set zrange [*:*]
set cbrange [*:*]
set cbtics autofreq
set cblabel "Irradiance, \\SI{}{W.m^{-2}}"
set output "../further_topics/figures/direct_irradiance.eps"
splot '../cdrom/chapter10/efyrnwy.dir' u 1:2:3
set output

# Figure 10.5

set output "../further_topics/figures/diffuse_irradiance.eps"
splot '../cdrom/chapter10/efyrnwy.dif' u 1:2:3
set output

# Figure 10.5

set output "../further_topics/figures/total_irradiance.eps"
splot '../cdrom/chapter10/efyrnwy.tot' u 1:2:3
set output

# Figure 10.6

#set output "../further_topics/figures/dem_irradiance_172.eps"
#splot '../cdrom/chapter10/efyrnwy.172' u 1:2:3
#set output

# Figure 10.7

#set output "../further_topics/figures/dem_irradiance_001.eps"
#splot '../cdrom/chapter10/efyrnwy.001' u 1:2:3
#set output

# Figure 10.8

set term epslatex mono "default" 10
set size 0.93,1
set output "../further_topics/figures/ldd_d8.eps"
plot '../cdrom/chapter10/efyrnwy.ld8' u 1:2:3:4 w vector nohead
set output

# Figure 10.9

set output "../further_topics/figures/ldd_d8x.eps"
plot '../cdrom/chapter10/efyrnwy.ld8' u 1:2:3:4 w vector nohead,\
     '../cdrom/chapter10/rivers.dat' w l lt 1 lw 3
set output

# Figure 10.10

load '../cdrom/chapter10/efyrnwy.arr'
unset key
set size nosquare
set format x "\\small{%g}"
set format y "\\small{%g}"
set format z "\\small{%g}"
set xlabel "\\small{Eastings}"
set ylabel "\\small{Northings}"
set zlabel "\\small{Elevation}"
set style line 1 lt 1 lw 0.01
set ticslevel 0.25
set dgrid3d 51,51,16
set pm3d at s corners2color geomean hidden3d 1
set palette gray
set view 40,70,1.145,1
unset surface
unset colorbox
set output "../further_topics/figures/ldd_drape.eps"
splot '../cdrom/chapter10/efyrnwy.dem' w pm3d lt 0 lw 0.1
set output
unset arrow
