BEGIN {

	# Initialise main variables
	area_black   = 0.01;
	area_white   = 0.01;
	area_suit    = 1.0;
	solar_const  = 917.0;
	Stefan_Boltz = 5.67E-08;
	albedo_soil  = 0.5;
	albedo_black = 0.25;
	albedo_white = 0.75;
	death_rate   = 0.3;
	q_factor     = 20.0;
   
	# Run model for 100 time steps
	for(time=0;time<=100;++time){
		# Equation 9.6
		area_soil=area_suit-(area_black+area_white);
		# Equation 9.5		
		albedo_global=(area_soil*albedo_soil)+ \
			(area_black*albedo_black)+(area_white*albedo_white);
		# Equation 9.4
		temp_global=(((solar_const*luminosity* \
			(1-albedo_global))/Stefan_Boltz)**0.25)-273;
		# Equations 9.7 and 9.8 
		temp_black=((q_factor*(albedo_global-albedo_black))+ \
			temp_global);
		temp_white=((q_factor*(albedo_global-albedo_white))+ \
			temp_global);			
		# Print current time, global temperature and daisy areas
		printf("%3i %7.4f %6.4f %6.4f\n", \
			time, temp_global, area_black, area_white);
		# Equations 9.9 and 9.10 
		growth_black=(1-(0.003265*((22.5-temp_black)**2)));
		growth_white=(1-(0.003265*((22.5-temp_white)**2)));
		# Update daisy area for next time step		
		# Equations 9.11 and 9.12
		area_black+=area_black*((area_soil*growth_black)- \
			death_rate);
		area_white+=area_white*((area_soil*growth_white)- \
			death_rate);
		# Do not allow daisies to become extinct
		if(area_black<0.01){area_black=0.01};
		if(area_white<0.01){area_white=0.01};
	}
	
}
