BEGIN{
   latitude=52.756;           # Latitude (degrees)
   E_0=1380.0;                # Exo-atmos. solar irradiance
   tau=0.7;                   # Atmos. transmittance
   hour_angle=0;              # Solar hour angle (degrees)
   p_alt=1000;                # Atmos. pressure (altitude)
   p_sea=1013;                # Atmos. pressure (sea level)
   	
   deg2rad=(2*3.1415927)/360; # Degrees to radians
   
   latitude*=deg2rad;         # Latitude in radians      
   hour_angle*=deg2rad;       # hour angle in radians
	
   # for-loop to cycle through each day of year
   for(DOY=1;DOY<=365;++DOY){
      # Solar declination angle (Eq. |\emph{\ref{eq: solar declination}}|)
      declination = (-23.4*deg2rad)* \
         cos(deg2rad*(360*(DOY+10)/365));
		
      # Cosine of the solar zenith angle (Eq. |\emph{\ref{eq:solar zenith angle}}|)
      cos_zenith=sin(latitude)*sin(declination)+ \
         cos(latitude)*cos(declination)*cos(hour_angle);
			
      # Atmospheric air mass (Eq. |\emph{\ref{eq:air mass number}}|)
      air_mass=(p_alt/p_sea)/cos_zenith;
		
      # Direct, diffuse and global (total) solar
      # irradiance (Eq. |\emph{\ref{Eq:direct irradiance on horizontal surface}}|, |\emph{\ref{eq:diffuse irradiance on horizontal surface}}| and |\emph{\ref{eq:global solar irradiance}}|)
      I_direct=(E_0)*(tau**air_mass)*cos_zenith;
      I_diffuse=0.3*(1-(tau**air_mass))*(E_0)*cos_zenith;
      I_global=I_direct+I_diffuse;

      # Output results
      printf("%3i %7.3f %7.3f %7.3f\n", \
         DOY, I_global, I_direct, I_diffuse);
   }
}
