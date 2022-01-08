BEGIN{
   latitude=52.756;           # Latitude (degrees)
   E_0=1380.0;                # Exo-atmos. solar irradiance
   tau=0.7;                   # Atmos. transmittance
   p_alt=1000;                # Atmos. pressure (altitude)
   p_sea=1013;                # Atmos. pressure (sea level)
   DOY=172;                   # Day of year (June 21)
   	
   deg2rad=(2*3.1415927)/360; # Degrees to radians
   
   latitude*=deg2rad;         # Latitude in radians      
	
   # Solar declination angle
   declination = (-23.4*deg2rad)* \
      cos(deg2rad*(360*(DOY+10)/365));
		
   # for-loop to cycle through 24 hours in a day
   for(hour_angle=-180;hour_angle<=180;hour_angle+=15){
      # Cosine of the solar zenith angle
      cos_zenith=sin(latitude)*sin(declination)+ \
         cos(latitude)*cos(declination)*\
	 cos(hour_angle*deg2rad);
	 		
      # Atmospheric air mass
      air_mass=(p_alt/p_sea)/cos_zenith;
		
      # Direct, diffuse and global solar irradiance
      I_direct=(E_0)*(tau**air_mass)*cos_zenith;
      I_diffuse=0.3*(1-(tau**air_mass))*(E_0)*cos_zenith;
      I_global=I_direct+I_diffuse;

      hour=12+(hour_angle/15.0);
      
      # Output results
      if(I_global>=0){
         printf("%4i %7.3f %7.3f %7.3f\n", \
           hour, I_global, I_direct, I_diffuse);
      }
   }
}
