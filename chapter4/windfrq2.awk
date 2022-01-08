(NR>1 && $10!=-999){
	# Wind speed in meters per second
	wind_speed=0.515*$10;
	# Count frequency of different wind speeds
	if(wind_speed<1){++speed_1}
	else if(wind_speed>=1 && wind_speed<2){++speed_2}
	else if(wind_speed>=2 && wind_speed<3){++speed_3}
	else if(wind_speed>=3 && wind_speed<4){++speed_4}
	else if(wind_speed>=4 && wind_speed<5){++speed_5}
	else if(wind_speed>=5 && wind_speed<6){++speed_6}
	else if(wind_speed>=6 && wind_speed<7){++speed_7}
	else if(wind_speed>=7 && wind_speed<8){++speed_8}
	else if(wind_speed>=8 && wind_speed<9){++speed_9}
	else if(wind_speed>=9 && wind_speed<10){++speed_10}
	else if(wind_speed>=10 && wind_speed<11){++speed_11}
	else if(wind_speed>=11 && wind_speed<12){++speed_12}
	else if(wind_speed>=12 && wind_speed<13){++speed_13}
	else if(wind_speed>=13 && wind_speed<14){++speed_14}
	else if(wind_speed>=14 && wind_speed<15){++speed_15}
	else if(wind_speed>=15 && wind_speed<16){++speed_16}
	else if(wind_speed>=16 && wind_speed<17){++speed_17}
	else if(wind_speed>=17 && wind_speed<18){++speed_18}
	else if(wind_speed>=18 && wind_speed<19){++speed_19}
	else {++speed_20}
	++num_obs;
}

END{
	print "# Wind speed distribution, Llyn Efyrnwy (1998)";
	print "# Speed (m/s)   Rel. Freq.";
	printf("%13.1f %12.4f\n", 0.5,  speed_1/num_obs);
	printf("%13.1f %12.4f\n", 1.5,  speed_2/num_obs);
	printf("%13.1f %12.4f\n", 2.5,  speed_3/num_obs);
	printf("%13.1f %12.4f\n", 3.5,  speed_4/num_obs);
	printf("%13.1f %12.4f\n", 4.5,  speed_5/num_obs);
	printf("%13.1f %12.4f\n", 5.5,  speed_6/num_obs);
	printf("%13.1f %12.4f\n", 6.5,  speed_7/num_obs);
	printf("%13.1f %12.4f\n", 7.5,  speed_8/num_obs);
	printf("%13.1f %12.4f\n", 8.5,  speed_9/num_obs);
	printf("%13.1f %12.4f\n", 9.5,  speed_10/num_obs);
	printf("%13.1f %12.4f\n", 10.5, speed_11/num_obs);
	printf("%13.1f %12.4f\n", 11.5, speed_12/num_obs);
	printf("%13.1f %12.4f\n", 12.5, speed_13/num_obs);
	printf("%13.1f %12.4f\n", 13.5, speed_14/num_obs);
	printf("%13.1f %12.4f\n", 14.5, speed_15/num_obs);
	printf("%13.1f %12.4f\n", 15.5, speed_16/num_obs);
	printf("%13.1f %12.4f\n", 16.5, speed_17/num_obs);
	printf("%13.1f %12.4f\n", 17.5, speed_18/num_obs);
	printf("%13.1f %12.4f\n", 18.5, speed_19/num_obs);
	printf("%13.1f %12.4f\n", 19.5, speed_20/num_obs);
}
