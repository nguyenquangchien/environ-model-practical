(NR>1 && $10!=-999){ 
	wind_speed=$10;
	sum_speed=sum_speed+wind_speed;
	num_obs=num_obs+1;
}

END{
	mean_wind_speed=0.515*sum_speed/num_obs;
	printf("Mean wind speed=%3.1f m/s\n", mean_wind_speed);
}
