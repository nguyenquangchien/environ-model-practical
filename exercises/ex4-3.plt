unset key
set xtics auto
set xrange [0:20]
rho=1.225                 # Air density kg/m^3 at sea level
radius=3.0                # Rotor radius in meters
area=pi*(radius**2)       # Area swept by turbine rotors
Cp=0.4                    # Power coefficient
Ng=0.75                   # Generator efficiency
Nb=0.9                    # Mechanical efficiency
set dummy u
Power(u)=area*(rho*(u**3)/2)/1000
set xlabel "Wind speed, u_0/m.s^{-1}"
set ylabel "Wind power density, P/kW.m^{-2}"
plot Power(u)*Cp*Ng*Nb/area lw 2
