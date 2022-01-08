(NR>1 && $10!=-999){
	# Wind speed in meters per second
	wind_speed=0.515*$10;
	# Count frequency of different wind speeds
	if(wind_speed<1){++speed_1}
	if(wind_speed>=1 && wind_speed<2){++speed_2}
	if(wind_speed>=2 && wind_speed<3){++speed_3}
	if(wind_speed>=3 && wind_speed<4){++speed_4}
	if(wind_speed>=4 && wind_speed<5){++speed_5}
	if(wind_speed>=5 && wind_speed<6){++speed_6}
	if(wind_speed>=6 && wind_speed<7){++speed_7}
	if(wind_speed>=7 && wind_speed<8){++speed_8}
	if(wind_speed>=8 && wind_speed<9){++speed_9}
	if(wind_speed>=9 && wind_speed<10){++speed_10}
	if(wind_speed>=10 && wind_speed<11){++speed_11}
	if(wind_speed>=11 && wind_speed<12){++speed_12}
	if(wind_speed>=12 && wind_speed<13){++speed_13}
	if(wind_speed>=13 && wind_speed<14){++speed_14}
	if(wind_speed>=14 && wind_speed<15){++speed_15}
	if(wind_speed>=15 && wind_speed<16){++speed_16}
	if(wind_speed>=16 && wind_speed<17){++speed_17}
	if(wind_speed>=17 && wind_speed<18){++speed_18}
	if(wind_speed>=18 && wind_speed<19){++speed_19}
	if(wind_speed>=19){++speed_20}
}

END{
	print "# Wind speed distribution, Llyn Efyrnwy (1998)";
	print "# Speed (m/s)  Frequency";
	printf("%13.1f %10i\n", 0.5,  speed_1);
	printf("%13.1f %10i\n", 1.5,  speed_2);
	printf("%13.1f %10i\n", 2.5,  speed_3);
	printf("%13.1f %10i\n", 3.5,  speed_4);
	printf("%13.1f %10i\n", 4.5,  speed_5);
	printf("%13.1f %10i\n", 5.5,  speed_6);
	printf("%13.1f %10i\n", 6.5,  speed_7);
	printf("%13.1f %10i\n", 7.5,  speed_8);
	printf("%13.1f %10i\n", 8.5,  speed_9);
	printf("%13.1f %10i\n", 9.5,  speed_10);
	printf("%13.1f %10i\n", 10.5, speed_11);
	printf("%13.1f %10i\n", 11.5, speed_12);
	printf("%13.1f %10i\n", 12.5, speed_13);
	printf("%13.1f %10i\n", 13.5, speed_14);
	printf("%13.1f %10i\n", 14.5, speed_15);
	printf("%13.1f %10i\n", 15.5, speed_16);
	printf("%13.1f %10i\n", 16.5, speed_17);
	printf("%13.1f %10i\n", 17.5, speed_18);
	printf("%13.1f %10i\n", 18.5, speed_19);
	printf("%13.1f %10i\n", 19.5, speed_20);
}
