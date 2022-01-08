reset
unset key
set yrange [0:*]
set xrange [0:20]
set xlabel "Mean wind speed, u_0/m.s^{-1}"
set ylabel "Absolute frequency"
plot 'windfreq.out' u 1:2 w boxes lw 2
pause -1

set ylabel "Relative frequency"
plot 'windfrq2.out' u 1:2 w boxes lw 2
pause -1

set key top right Left box
plot 'wind7yr.dat' u 1:2 t "1994-2000" w lp, \
     'windfrq2.out' u 1:2 t "1998 only" w lp	  
pause -1

set xrange [0:5]
set yrange [0:2]
set xlabel "Wind speed, u_0/m.s^{-1}"
set ylabel "Probability density, Phi(u)"
set dummy u
phi(u,c,k)=(k/c)*((u/c)**(k-1))*exp((-1*(u/c)**k))
plot phi(u,1.0,4.0) t "k=4.0" lw 2, \
     phi(u,1.0,2.0) t "k=2.0" lw 2, \
     phi(u,1.0,1.0) t "k=1.0" lw 2, \
     phi(u,1.0,0.5) t "k=0.5" lw 2
pause -1

set fit logfile "weibull.fit"
c=10
k=1
fit phi(u,c,k) 'windfrq2.out' u 1:2 via c,k

set xrange [0:20]
set yrange [0:*]
plot 'windfrq2.out' u 1:2 t "Observed" w boxes, \
     phi(u,c,k) t "Modeled" w l lt 2 lw 3     
pause -1

phi_prime(u_prime,c,k)=exp((-1.0*(u_prime/c)**k))
print phi_prime(1.0,c,k)
print phi_prime(1.0,5.32883,1.55037)
print phi_prime(2.5,c,k)

set xtics auto
set xrange [0:20]
rho=1.225                 # Air density kg/m^3 at sea level
radius=3.0                # Rotor radius in meters
area=pi*(radius**2)       # Area swept by turbine rotors
Cp=0.4                    # Power coefficient
Ng=0.75                   # Generator efficiency
Nb=0.9                    # Mechanical efficiency
Power(u)=area*(rho*(u**3)/2)/1000
set xlabel "Wind speed, u_0/m.s^{-1}"
set ylabel "Wind power, P/kW"
set key top left Left nobox
plot Power(u) t "(a) Potential power" lw 2, \
     Power(u)*Cp*Ng*Nb t "(b) Actual power" lw 2
pause -1

unset key
set xdata time
set timefmt "%Y%m%dT%H%M"
set xrange ["19980101T0000":"19981231T2359"]
set yrange [0:*]
set format x "%b"
set xlabel "Month (1998)"
set ylabel "Power, P/kW.h"
plot 'wind98le.pwr' u 1:2 w i
pause -1
