reset
set term epslatex "default" 10
set size 0.93,1

unset key

# Figure 4.1 - not produced using Gnuplot

# Figure 4.2

set xlabel "Longitude/\\SI{}{\\arcdeg E}"
set ylabel "Latitude/\\SI{}{\\arcdeg N}"
set yrange [51:54]
set xrange [-5.5:-2.5]
set size 0.75, 1.5
set output "../wind_speed/figures/wind_farms_wales.eps"
plot '../wind_speed/data/uk-eire.dat' w l lt -1, \
     '../wind_speed/data/wind_farm_list.dat' u 2:1 w p lt 2 pt 7 ps 1.25, \
     '../wind_speed/data/lake_vyrnwy_location.dat' w p lt 1 pt 10 ps 1.25
set output

# Figure 4.3 - not produced using Gnuplot

# Figure 4.4 - not produced using Gnuplot

# Figure 4.5 - not produced using Gnuplot

# Figure 4.6 - not produced using Gnuplot

# Figure 4.7 - not produced using Gnuplot

set size 0.95,1
set yrange [0:*]
set xrange [0:20]
set xlabel "Mean wind speed, $\\bar{u_{0}}$/\\SI{}{m.s^{-1}}"
set ylabel "Absolute frequency"
set output "../wind_speed/figures/wind_frequency.eps"
plot '../cdrom/chapter4/windfreq.out' u 1:2 w boxes lw 2
set output

# Figure 4.8 - not produced using Gnuplot

# Figure 4.9 - not produced using Gnuplot

# Figure 4.10

set ylabel "Relative frequency"
set output "../wind_speed/figures/wind_relative_frequency.eps"
plot '../cdrom/chapter4/windfrq2.out' u 1:2 w boxes lw 2
set output

# Figure 4.11

set key top right Left box
set output "../wind_speed/figures/wind_frequency_5yr.eps"
plot '../cdrom/chapter4/wind7yr.dat' u 1:2 t "1994--2000" w lp pt 7, \
     '../cdrom/chapter4/windfrq2.out' u 1:2 t "1998 only" w lp pt 10	  
set output

# Figure 4.12

c=1
set xrange [0:5]
set yrange [0:2]
set xlabel "Wind speed, $u$/\\SI{}{m.s^{-1}}"
set ylabel "Probability density, \$\\Phi(u)\$"
set output "../wind_speed/figures/weibull.eps"
set dummy u
phi(u,c,k)=(k/c)*((u/c)**(k-1))*exp((-1*(u/c)**k))
plot phi(u,1.0,4.0) t "$k=4.0$" lw 2, \
     phi(u,1.0,2.0) t "$k=2.0$" lw 2, \
     phi(u,1.0,1.0) t "$k=1.0$" lw 2, \
     phi(u,1.0,0.5) t "$k=0.5$" lw 2
set output

# Figure 4.13 

set fit logfile "../cdrom/chapter4/weibull.fit"
c=10
k=1
fit phi(u,c,k) '../cdrom/chapter4/windfrq2.out' u 1:2 via c,k

# Figure 4.14

set yrange [0:*]
set xrange [0:*]
set output "../wind_speed/figures/wind_frequency_modelled.eps"
plot '../cdrom/chapter4/windfrq2.out' u 1:2 t "Observed" w boxes, \
     phi(u,c,k) t "Modeled" w l lt 2 lw 3     
set output

phi_prime(u_prime,c,k)=exp((-1.0*(u_prime/c)**k))
print phi_prime(1.0,c,k)
print phi_prime(1.0,5.32883,1.55037)
print phi_prime(2.5,c,k)

# Figure 4.14

set xtics auto
set xrange [0:20]
rho=1.225                 # Air density kg/m^3 at sea level
radius=3.0                # Rotor radius in meters
area=pi*(radius**2)       # Area swept by turbine rotors
Cp=0.4                    # Power coefficient
Ng=0.75                   # Generator efficiency
Nb=0.9                    # Mechanical efficiency
Power(u)=area*(rho*(u**3)/2)/1000
set xlabel "Wind speed, $u_{0}/\\SI{}{m.s^{-1}}"
set ylabel "Wind power, $P$/\\SI{}{kW}"
set key top left Left nobox
set output "../wind_speed/figures/windpower.eps"
Power(u)=(pi*(radius**2))*(rho*(u**3)/2)/1000
set xlabel "Wind speed, $u_0$/\\SI{}{m.s^{-1}}"
set ylabel "Wind power, $P$/kW"
set key top left Left nobox
plot Power(u) t "(a) Potential power" lw 2, \
     Power(u)*Cp*Ng*Nb t "(b) Actual power" lw 2
set output

# Figure 4.15 - not produced using Gnuplot

# Figure 4.16

unset key
set xdata time
set timefmt "%Y%m%dT%H%M"
set xrange ["19980101T0000":"19981231T2359"]
set yrange [0:*]
set format x "%b"
set xlabel "Month (1998)"
set ylabel "Power, $P$/\\SI{}{kW.h}"
set output "../wind_speed/figures/power-series.eps"
plot '../cdrom/chapter4/wind98le.pwr' u 1:2 w i
set output
