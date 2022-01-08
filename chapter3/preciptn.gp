reset
set size 0.93,1
set term epslatex "default" 10

# Figure 3.1 - not produced using Gnuplot

# Figure 3.2 - not produced using Gnuplot

# Figure 3.3 - not produced using Gnuplot

# Figure 3.4 - not produced using Gnuplot

# Figure 3.5

unset key
set xdata time
set timefmt "%Y%m%d%H%M"
set format x "%b"
set xlabel "Month (1998)"
set ylabel "Accumulated precipitation, $P$/\\SI{}{mm}"
set xrange ["199801010000":"199901010000"]
set output "../precipitation/figures/rain98le.eps"
plot '../cdrom/chapter3/rain98le.out' u 1:2 w i lt 1
set output

# Figure 3.6

set datafile missing "-99.9"
set output "../precipitation/figures/rain98le_nomissing.eps"
replot
set output
