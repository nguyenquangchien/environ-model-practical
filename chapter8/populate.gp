reset

set term epslatex "default" 10
set size 0.93,1

# Figure 8.1 - Not produced using Gnuplot

# Figure 8.2

set style data points
set xlabel "Time, $t$"
set ylabel "Population size, $N$"
set key top left Right nobox
set output "../population/figures/discrete.eps"
plot '../population/data/discr105.dat' t "$\\lambda=1.05$" pt 7 ps 0.75, \
     '../population/data/discr106.dat' t "$\\lambda=1.06$" pt 5 ps 0.75, \
     '../population/data/discr107.dat' t "$\\lambda=1.07$" pt 6 ps 0.75
set output

# Figure 8.3

set output "../population/figures/discrete1.eps"
plot '../population/data/discr095.dat' t "$\\lambda=0.95$" pt 7 ps 0.75, \
     '../population/data/discr090.dat' t "$\\lambda=0.90$" pt 5 ps 0.75, \
     '../population/data/discr085.dat' t "$\\lambda=0.85$" pt 6 ps 0.75
set output

# Figure 8.4

set logscale y
set key top left Right nobox
set output "../population/figures/discrete2.eps"
plot '../population/data/discr107.dat' t "$\\lambda=1.07$"  w p pt 7 ps 0.75, \
	'../population/data/discr106.dat' t "$\\lambda=1.06$" w p pt 5 ps 0.75, \
	'../population/data/discr105.dat' t "$\\lambda=1.05$" w p pt 6 ps 0.75
set output

# Figure 8.5

set output "../population/figures/discrete3.eps"
set key bottom left Right nobox
plot '../population/data/discr095.dat' t "${\\lambda}=0.95$" pt 7 ps 0.75, \
     '../population/data/discr090.dat' t "${\\lambda}=0.90$" pt 5 ps 0.75, \
     '../population/data/discr085.dat' t "${\\lambda}=0.85$" pt 6 ps 0.75
set output
unset logscale y

# Figure 8.6 - Not produced using Gnuplot

# Figure 8.7 - Not produced using Gnuplot

# Figure 8.8

set style data lines
set key top left
set output "../population/figures/continuous.eps"
plot '../population/data/cont005.dat' t "$r=0.05$" lt 1 lw 2, \
     '../population/data/cont006.dat' t "$r=0.06$" lt 2 lw 2, \
     '../population/data/cont007.dat' t "$r=0.07$" lt 3 lw 2
set output

# Figure 8.9

set output "../population/figures/logistic.eps"
plot '../population/data/c_log005.dat' t "$r=0.05$" lw 2, \
     '../population/data/c_log006.dat' t "$r=0.06$" lw 2, \
     '../population/data/c_log007.dat' t "$r=0.07$" lw 2
set output

# Figure 8.10

unset key
set style data lines
set xlabel "Population size, $N$"
set ylabel "Population growth, $dN/dt$"
r=0.05
K=1000
set dummy t
pop(t)=r*t*(1-t/K)
set xrange [0:1000]
set output "../population/figures/popgrowr.eps"
plot pop(t) w l lw 2
set output

# Figure 8.11

set xrange [*:*]
set style data points
set key top left
set output "../population/figures/dlogistic.eps"
plot '../population/data/d_log005.dat' t "$r=0.05$" pt 7 ps 0.75, \
     '../population/data/d_log006.dat' t "$r=0.06$" pt 5 ps 0.75, \
     '../population/data/d_log007.dat' t "$r=0.07$" pt 6 ps 0.75
set output

# Figure 8.12

set origin 0,0
set size 0.93,1.5
set ylabel "Population size, $N$"
set xlabel "Time, $t$"
set style data lines
set yrange [0:2500]
unset key
set output "../population/figures/logistic_multiplot1.eps"
set multiplot
set size 0.465,0.5
set origin 0,1.0
plot [0:25] '../population/data/dsclog050.dat' w lp pt 7 ps 0.75
set origin 0.5,1.0
plot [0:25] '../population/data/dsclog190.dat' w lp pt 7 ps 0.75
set origin 0,0.5
plot [0:25] '../population/data/dsclog205.dat' w lp pt 7 ps 0.75
set origin 0.5,0.5
plot [0:25] '../population/data/dsclog260.dat' w lp pt 7 ps 0.75
set origin 0,0
plot [0:25] '../population/data/dsclog267.dat' w lp pt 7 ps 0.75
set origin 0.5,0
plot '../population/data/dsclog300.dat' w lp pt 7 ps 0.75
unset multiplot
set output
set origin 0,0
set size 0.93,1

# Figure 8.13

set yrange [0:*]
set style data points 
unset key
set ylabel "Population size, $N$"
set xlabel "Intrinsic growth rate, $r$"
set output '../population/figures/bifurcation.eps'
plot '../population/data/bifurcation.dat' pt 7 ps 0.125
set output

# Figure 8.14

set xrange [2.9:2.95]
set yrange [650:1650]
set xtics 0.01
set output '../population/figures/bifurcation2.eps'
plot '../population/data/bifurcation2.dat' pt 7 ps 0.125
set output
set yrange [*:*]
set xrange [*:*]
set xtics auto

# Figure 8.15

set xlabel "Time, $t$"
set output "../population/figures/logistic2.eps"
plot [0:50] '../population/data/dsclog300xx.dat' w lp pt 7 ps 1.25, \
            '../population/data/dsclog300x.dat' w lp pt 10 ps 1.25
set output

# Figure 8.16 - Not produced using Gnuplot

# Figure 8.17 - Not produced using Gnuplot

# Figure 8.18

# Analytical solution
N=10.0
r=0.5
K=1000.0
set dummy t
pop(t)=K/(1+((K-N)/N)*exp(-r*t))
set key top left
set output "../population/figures/euler.eps"
plot pop(t) t "Analytical solution" w l lw 2, \
     '../population/data/euler1.dat' t "Euler: $\\Delta t=1.0$" w lp pt 7, \
     '../population/data/euler05.dat' every 2 t "Euler: $\\Delta t=0.5$" w lp pt 8, \
     '../population/data/euler01.dat' every 10 t "Euler: $\\Delta t=0.1$" w lp pt 10     
set output

# Figure 8.19 - Not produced using Gnuplot

# Figure 8.20

set output "../population/figures/rungekutta.eps"
plot pop(t) t "Analytical solution" w l lw 2, \
     '../population/data/rk4.dat' every 10  t "rk4: $dt=0.1$" w p pt 7 ps 1.25
set output

# Figure 8.21 - Not produced using Gnuplot

# Figure 8.22

set style data lines
set key bottom right box
set output "../population/figures/compete.eps"
plot '../population/data/compete1.dat' u 1:2 t "Species 1" lw 2, \
     '../population/data/compete1.dat' u 1:3 t "Species 2" lw 2
set output

# Figure 8.23
	  
set output "../population/figures/compete1.eps"
plot '../population/data/compete2.dat' u 1:2 t "Species 1" lw 2, \
     '../population/data/compete2.dat' u 1:3 t "Species 2" lw 2
set output
	  
# Figure 8.24 - Not produced using Gnuplot

# Figure 8.25
	  
unset key
set output "../population/figures/predprey.eps"
plot '../population/data/predprey.dat' u 1:2 lw 2, \
     '../population/data/predprey.dat' u 1:3 lw 2
set output

# Figure 8.26
	  
set xlabel "Prey population"
set ylabel "Predator population"
set output "../population/figures/hysteresis.eps"
plot '../population/data/predprey.dat' u 2:3
set output
