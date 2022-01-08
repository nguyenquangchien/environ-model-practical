BEGIN {
	# Initialize main variables
	area_daisy   = 0.01;
	area_suit    = 1.0;
	solar_const  = 917;
	Stefan_Boltz = 5.67E-08;
	albedo_soil  = 0.5;
	death_rate   = 0.3;
	q_factor     = 20;
	threshold    = 0.01;
   
	for(luminosity=0.5;luminosity<=1.7;luminosity+=0.025){
		# Run model until it reaches steady state for
		# current solar luminosity
		do{
			prev_temp_global=temp_global;
			area_avail=area_suit-area_daisy;
			albedo_global=(area_avail*albedo_soil)+ \
				(area_daisy*albedo_daisy);
			temp_global=(((solar_const*luminosity* \
				(1-albedo_global))/Stefan_Boltz)**0.25)-273;
			temp_daisy=((q_factor*(albedo_global-albedo_daisy))+ \
				temp_global);
			growth_daisy=(1-(0.003265*((22.5-temp_daisy)**2)));
			area_daisy+=area_daisy*((area_avail*growth_daisy)- \
				death_rate);
			# Do not allow daisies to become extinct
			if(area_daisy<0.01){area_daisy=0.01};
			# Check whether global average temperature for 
			# current and previous run differ by > threshold
			temp_difference=temp_global-prev_temp_global
			if(temp_difference<=0){temp_difference*=-1}
		} while(temp_difference>threshold)
		printf("%5.3f %7.4f %6.4f\n", \
			luminosity, temp_global, area_daisy);		
	}
}
