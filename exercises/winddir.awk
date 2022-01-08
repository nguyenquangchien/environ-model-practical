(NR>1 && $9!=-999){
	if($9>345 || $9<=15){++N}
	if($9>15 && $9<=45){++NNE}
	if($9>45 && $9<=75){++ENE}
	if($9>75 && $9<=105){++E}
	if($9>105 && $9<=135){++ESE}
	if($9>135 && $9<=165){++SSE}
	if($9>165 && $9<=195){++S}
	if($9>195 && $9<=225){++SSW}
	if($9>225 && $9<=255){++WSW}
	if($9>255 && $9<=285){++W}
	if($9>285 && $9<=315){++WNW}
	if($9>315 && $9<=345){++NNW}
	++num_obs;
}
END{
	printf("%3i %5.2f\n", 0, N/num_obs);
	printf("%3i %5.2f\n", 30, NNE/num_obs);
	printf("%3i %5.2f\n", 60, ENE/num_obs);
	printf("%3i %5.2f\n", 90, E/num_obs);
	printf("%3i %5.2f\n", 120, ESE/num_obs);
	printf("%3i %5.2f\n", 150, SSE/num_obs);
	printf("%3i %5.2f\n", 180, S/num_obs);
	printf("%3i %5.2f\n", 210, SSW/num_obs);
	printf("%3i %5.2f\n", 240, WSW/num_obs);
	printf("%3i %5.2f\n", 270, W/num_obs);
	printf("%3i %5.2f\n", 300, WNW/num_obs);
	printf("%3i %5.2f\n", 330, NNW/num_obs);	
}
