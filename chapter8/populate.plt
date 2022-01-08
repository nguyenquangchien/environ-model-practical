reset
set style data points
set xlabel "Time, t"
set ylabel "Population size, N"
set key top left
plot 'discr105.dat' t "lambda=1.05" lt 3 pt 7, \
     'discr106.dat' t "lambda=1.06" lt 3 pt 6, \
     'discr107.dat' t "lambda=1.07" lt 3 pt 5
pause -1

set logscale y
replot
pause -1

unset logscale y
pause -1

set style data lines
plot 'cont005.dat' t "r=0.05", \
     'cont006.dat' t "r=0.06", \
     'cont007.dat' t "r=0.07"
pause -1

plot 'c_log005.dat' t "r=0.05" lw 2, \
     'c_log006.dat' t "r=0.06" lw 2, \
     'c_log007.dat' t "r=0.07" lw 2
pause -1

set style data points
plot 'd_log005.dat' t "r=0.05" w p, \
     'd_log006.dat' t "r=0.06" w p, \
     'd_log007.dat' t "r=0.07" w p
pause -1

N=10.0
r=0.5
K=1000.0
set dummy t
pop(t)=K/(1+((K-N)/N)*exp(-r*t))
plot pop(t) t "Analytical solution" w l lw 2, \
     'euler1.dat' t "Euler: dt=1.0" w lp pt 7, \
     'euler05.dat' every 2 t "Euler: dt=0.5" w lp pt 8, \
     'euler01.dat' every 10 t "Euler: dt=0.1" w lp pt 10     
pause -1

plot pop(t) t "Analytical solution" w l lw 2, \
     'rk4.dat' every 10  t "rk4: dt=0.1" w p pt 7 ps 2
pause -1

set style data lines
set key bottom right box
plot 'compete1.dat' u 1:2 t "Species 1" lw 2, \
     'compete1.dat' u 1:3 t "Species 2" lw 2
pause -1
	  
plot 'compete2.dat' u 1:2 t "Species 1" lw 2, \
     'compete2.dat' u 1:3 t "Species 2" lw 2
pause -1
	  
unset key
plot 'predprey.dat' u 1:2 lw 2, \
     'predprey.dat' u 1:3 lw 2
pause -1

set xlabel "Prey population"
set ylabel "Predator population"
plot 'predprey.dat' u 2:3 lw 2
pause -1
