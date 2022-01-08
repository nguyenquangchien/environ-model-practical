BEGIN {
	# Initialize main variables
	area_black   = 0.01;
	area_gray    = 0.01;
	area_white   = 0.01;
	area_suit    = 1.0;
	solar_const  = 917;
	Stefan       = 5.67E-08;
	albedo_soil  = 0.5;
	albedo_black = 0.25;
	albedo_gray  = 0.5;
	albedo_white = 0.75;
	death_rate   = 0.3;
	q_factor     = 20;
	threshold    = 0.01;
}
