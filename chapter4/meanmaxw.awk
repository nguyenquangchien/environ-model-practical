(NR>1 && $10!=-999){
	wind_speed=$10;
	sum_speed+=wind_speed;
	++num_obs;
	if(wind_speed>max_speed){
		max_speed=wind_speed;
	}
}

END{
	mean_wind_speed=0.515*sum_speed/num_obs;
	printf("Mean wind speed=%3.1f m/s\n", mean_wind_speed);
	max_speed*=0.515;
	printf("Max. wind speed=%4.1f m/s\n", max_speed);
}
