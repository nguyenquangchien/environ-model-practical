{
	sum_power+=$2;
	++sum_hours;
}

END{
	printf("Mean output while WECS active: %6.4f kW.h\n", \
		sum_power/sum_hours);
	printf("Mean output throughout year:   %6.4f kW.h\n", \
		sum_power/(365*24));
}
