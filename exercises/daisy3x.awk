BEGIN {
	# Initialize main variables
	area_black   = 0.01;
	area_gray    = 0.01;
	area_white   = 0.01;
	area_suit    = 1.0;
	solar_const  = 917;
	Stefan_Boltz = 5.67E-08;
	albedo_soil  = 0.5;
	albedo_black = 0.25;
	# albedo_gray  = 0.5;
	albedo_white = 0.75;
	death_rate   = 0.3;
	q_factor     = 20;
	threshold    = 0.01;
   
	for(luminosity=0.5;luminosity<=1.7;luminosity+=0.025){
		# Run model until it reaches steady state for
		# current solar luminosity
		do{
			prev_temp_global=temp_global;
			area_avail=area_suit- \
				(area_black+area_white+area_gray);
			albedo_global= (area_avail*albedo_soil)+ \
				(area_black*albedo_black)+ \
				(area_white*albedo_white) + \
				(area_gray*albedo_gray);
			temp_global=(((solar_const*luminosity* \
				(1-albedo_global))/Stefan_Boltz)**0.25)-273;
			temp_black=((q_factor*(albedo_global-albedo_black))+ \
				temp_global);
			temp_gray=((q_factor*(albedo_global-albedo_gray))+ \
				temp_global);
			temp_white=((q_factor*(albedo_global-albedo_white))+ \
				temp_global);			
			growth_black=(1-(0.003265*((22.5-temp_black)**2)));
			growth_gray=(1-(0.003265*((22.5-temp_gray)**2)));
			growth_white=(1-(0.003265*((22.5-temp_white)**2)));
			area_black+=area_black*((area_avail*growth_black)- \
				death_rate);
			area_gray+=area_gray*((area_avail*growth_gray)- \
				death_rate);
			area_white+=area_white*((area_avail*growth_white)- \
				death_rate);
			# Do not allow daisies to become extinct
			if(area_black<0.01){area_black=0.01};
			if(area_gray<0.01){area_gray=0.01};
			if(area_white<0.01){area_white=0.01};
			# Check whether global average temperature for 
			# current and previous run differ by > threshold
			temp_difference=temp_global-prev_temp_global
			if(temp_difference<0){temp_difference*=-1}
		} while(temp_difference>threshold)
		printf("%5.3f %7.4f %6.4f %6.4f %6.4f\n", \
			luminosity, temp_global, area_black, \
			area_gray, area_white);		
	}
}
