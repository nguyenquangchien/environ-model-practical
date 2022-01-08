BEGIN {

	# Initialize main variables
	area_black      = 0.01;
	area_dkgray     = 0.01;
	area_gray       = 0.01;
	area_palegray   = 0.01;
	area_white      = 0.01;
	area_suit       = 1.0;
	solar_const     = 917;
	Stefan          = 5.67E-08;
	albedo_soil     = 0.5;
	albedo_black    = 0.22;
	albedo_dkgray   = 0.375;
	albedo_gray     = 0.5;
	albedo_palegray = 0.675;
	albedo_white    = 0.75;
	death_rate      = 0.3;
	q_factor        = 20;
	threshold       = 0.01;
	
	for(luminosity=0.5;luminosity<=1.7;luminosity+=0.025){
		# Run model until it reaches steady state for
		# current solar luminosity
		do{
			prev_temp_global=temp_global;
			
			area_avail=area_suit- \
				(area_black+area_dkgray+area_gray+\
				area_palegray+area_white);
			albedo_global=(area_avail*albedo_soil)+ \
				(area_black*albedo_black)+ \
				(area_dkgray*albedo_dkgray)+ \
				(area_gray*albedo_gray)+ \
				(area_palegray*albedo_palegray)+ \
				(area_white*albedo_white);
			temp_global=(((solar_const*luminosity* \
				(1-albedo_global))/Stefan)**0.25)-273;
			
			temp_black=fn_temp(albedo_black);
			temp_dkgray=fn_temp(albedo_dkgray);
			temp_gray=fn_temp(albedo_gray);
			temp_palegray=fn_temp(albedo_palegray);
			temp_white=fn_temp(albedo_white);
			
			growth_black=fn_growth(temp_black);
			growth_dkgray=fn_growth(temp_dkgray);
			growth_gray=fn_growth(temp_gray);
			growth_palegray=fn_growth(temp_palegray);
			growth_white=fn_growth(temp_white);
			
			area_black+=fn_area(area_black,growth_black);
			area_dkgray+=fn_area(area_dkgray,growth_dkgray);
			area_gray+=fn_area(area_gray,growth_gray);
			area_palegray+=fn_area(area_palegray,growth_palegray);
			area_white+=fn_area(area_white,growth_white);
			
			# Do not allow daisies to become extinct
			if(area_black<0.01){area_black=0.01};
			if(area_dkgray<0.01){area_dkgray=0.01};
			if(area_gray<0.01){area_gray=0.01};
			if(area_palegray<0.01){area_palegray=0.01};
			if(area_white<0.01){area_white=0.01};
			
			# Check whether global average temperature for 
			# current and previous model run differ by more 
			# than threshold
			temp_difference=temp_global-prev_temp_global
			if(temp_difference<0){temp_difference*=-1}
		} while(temp_difference>threshold)
		
		printf("%5.3f %7.4f %6.4f %6.4f %6.4f %6.4f %6.4f\n", \
			luminosity, temp_global, area_black, \
			area_dkgray, area_gray, \
			area_palegray, area_white);			
	}
}

# Function to calculate local temperatures
function fn_temp(albedo_daisy)
{
	return ((q_factor*(albedo_global-albedo_daisy))+ \
		temp_global);
}

# Function to calculate daisy growth rates
function fn_growth(temp_daisy)
{
	return (1-(0.003265*((22.5-temp_daisy)**2)));
}

# Function to calculate change in daisy area
function fn_area(area_daisy,growth_daisy)
{
	return (area_daisy*((area_avail*growth_daisy)- \
		death_rate));
}