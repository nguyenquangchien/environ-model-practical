(NR>1 && $10!=-999){
	radius=3.0;          # Length of rotor blades
	pi=3.1415927;        # Pi
	area=pi*(radius**2); # Cross-sectional area of rotors
	rho=1.225;           # Air density at sea level
	Cp=0.4;              # Power coefficient
	Nb=0.9;              # Mechanical efficiency
	Ng=0.75;             # Generator efficiency
	knots2ms=0.515;      # Convert from Kts to m/s
	cut_in=3.0;          # Cut-in wind speed (m/s)
	cut_out=20.0;        # Cut-out wind speed (m/s)
	wind_speed=$10*knots2ms;
	if(wind_speed>=cut_in && wind_speed<cut_out){
		power=area*(rho*(wind_speed**3)/2)*Cp*Nb*Ng;
		printf("%4i%02i%02iT%04i %8.4f\n", \
			$4, $5, $6, $7, power/1000.0);
	}
}
