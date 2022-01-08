BEGIN {
	for(luminosity=0.5;luminosity<=1.7;luminosity+=0.025){
		# Run model until it reaches steady state for
		# current solar luminosity
		do{
			prev_temp_global=temp_global;
			
			area_avail=area_suit- \
				(area_black+area_white+area_gray);
			albedo_global=(area_avail*albedo_soil)+ \
				(area_black*albedo_black)+ \
				(area_white*albedo_white) + \
				(area_gray*albedo_gray);
			temp_global=(((solar_const*luminosity* \
				(1-albedo_global))/Stefan)**0.25)-273;
			
			temp_black=fn_temp(albedo_black);
			temp_gray=fn_temp(albedo_gray);
			temp_white=fn_temp(albedo_white);
			
			growth_black=fn_growth(temp_black);
			growth_gray=fn_growth(temp_gray);
			growth_white=fn_growth(temp_white);
			
			area_black+=fn_area(area_black,growth_black);
			area_gray+=fn_area(area_gray,growth_gray);
			area_white+=fn_area(area_white,growth_white);
			
			# Do not allow daisies to become extinct
			if(area_black<0.01){area_black=0.01};
			if(area_gray<0.01){area_gray=0.01};
			if(area_white<0.01){area_white=0.01};
			
			# Check whether global average temperature for current
			# and previous model run differ by more than threshold
			temp_difference=temp_global-prev_temp_global
			if(temp_difference<0){temp_difference*=-1}
		} while(temp_difference>threshold)
		
		printf("%5.3f %7.4f %6.4f %6.4f %6.4f\n", \
			luminosity, temp_global, area_black, \
			area_gray, area_white);			
	}
}
