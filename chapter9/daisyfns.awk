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
