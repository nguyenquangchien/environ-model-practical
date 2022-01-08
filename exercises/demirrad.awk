# Takes a 2D DEM in the form Easting, Northing, elevation
# and for determines the local gradient and aspect of
# each cell using the method of Zevenbergen and
# Thorne (1987). It then uses this information to
# calculate the direct, diffuse and total solar irradiance 
# on each cell given prescribed values of total exo-
# atmospheric solar irradiance, atmospheric transmittance
# and atmospheric pressue (at the altitude of the site and
# at sea level), and user-defined values of the latitude 
# of the site, the day of year and the solar hour angle.
#
# Usage: gawk -f dsirrad.awk -v size=value -v latitude=value
#             -v DOY=value -v hour_angle=value input_file 
#             [> output_file]
#
# Variables:
# ----------
# E_0        Exo-atmospheric solar irradiance (W.m^{-2})
# tau        Atmospheric transmittance
# p_alt      Atmospheric pressure at average altitude (mbar)
# p_sea      Atmospheric pressure at sea level (mbar)
# rad2deg    Conversion factor - radians to degrees
# deg2rad    Conversion factor - degrees to radians
# latitude   Latitude of site (initially in degrees)
# hour_angle Solar hour angle at site (initially degrees)
# zenith     Solar zenith angle (radians)
# azimuth    Solar azimuth angle (radians)
# declinatn  Solar declination angle (degrees)
# air_mass   Atmospheric air mass
# zeta       Angle between sun and surface normal (radians)
# I_direct   Direct solar irradiance on surface (W.m^{-2})
# I_diffuse  Diffuse solar irradiance on surface (W.m^{-2})
# I_total    Total solar irradiance on surface (W.m^{-2})
# sky_view   Sky view factor
# min_E      eastern-most Easting in DEM (metres)
# max_E      western-most Easting in DEM (metres)
# min_N      southern-most Northing in DEM (metres)
# min_N      northern-most Northing in DEM (metres)
# this_E     Easting of current cell (metres)
# this_N     Northing of current cell (metres)
# size       DEM cell size (metres)
# grad_NS    N-Sg radient of current cell (degrees)
# grad_EW    E-W gradient of current cell (degrees)
# gradient   Gradient of current cell (degrees)
# aspect     Aspect of current cell (degrees)
 
BEGIN{
   # Initialize key variables
   E_0=1380.0;
   tau=0.7;
   p_alt=1000.0;
   p_sea=1013.0;
   PI=3.14159263359;
   rad2deg=360/(2*3.1415927);
   deg2rad=1/rad2deg;

   # Convert latitude and hour angle values provided 
   # via command line from degrees to radians
   latitude*=deg2rad;      
   hour_angle*=deg2rad;

   # Calculate solar declination angle (radians)
   declinatn=(-23.4*deg2rad)* \
      cos(deg2rad*(360*(DOY+10)/365));

   # Calculate solar zenith angle (radians)
   if(hour_angle<(deg2rad*90) || hour_angle>(-90*deg2rad)){
      zenith=fn_acos(sin(latitude)*sin(declinatn)+\
         cos(latitude)*cos(declinatn)*cos(hour_angle));
   } else {
      zenith=fn_acos(sin(latitude)*sin(declinatn)-\
         cos(latitude)*cos(declinatn)*cos(hour_angle));
   }

   # Calculate solar azimuth angle (radians)
   if(hour_angle>0){
      azimuth=(deg2rad*180)+fn_acos(-1*(sin(declinatn)-\
         cos(zenith)*sin(latitude))/\
	 (cos(latitude)*sin(zenith)));
   } else {
      azimuth=(deg2rad*180)-fn_acos(-1*(sin(declinatn)-\
         cos(zenith)*sin(latitude))/\
	 (cos(latitude)*sin(zenith)));			
   }
	
   # Calculate atmospheric air mass
   air_mass=(p_alt/p_sea)/cos(zenith);
}

{
   # Read in Easting and Northing of current cell from DEM
   E=$1;
   N=$2;
	
   # Initialise min. and max. Easting and Northing of DEM
   if(NR==1){min_E=E; max_E=E; min_N=N; max_N=N}

   # Determine min. and max. Eastings and Northings of DEM
   if(E<min_E){min_E=E} 
   if(E>max_E){max_E=E}
   if(N<min_N){min_N=N}
   if(N>max_N){max_N=N}

   # Read elevation data into array (dem)
   dem[E,N]=$3;
}

END{
   # Pass across DEM by Easting
   for(this_E=min_E+size;this_E<max_E;this_E+=size){
      # Pass up through DEM by Northing
      for(this_N=min_N+size;this_N<max_N;this_N+=size){

         # Calculate Zevenbergen and Thorne's parameters
         grad_EW=(dem[this_E-size,this_N]- \
                   dem[this_E+size,this_N])/(2*size);
         grad_NS=(-dem[this_E,this_N-size]+ \
                  dem[this_E,this_N+size])/(2*size);
			
         # Calculate the gradient (radians)
         gradient=deg2rad*(360/(2*PI))*(grad_NS*grad_NS +\
	          grad_EW*grad_EW)**0.5;			

         # Calculate the aspect (radians)
         aspect=PI+(atan2(-grad_EW,grad_NS));

         # Calculate angle of incidence of solar radiation
         # for the inclined surface
         cos_zeta=(cos(gradient)*\
              cos(zenith))+(sin(gradient)*\
              sin(zenith)*cos(azimuth-aspect));
         
         # Calculate the direct solar irradiance
         I_direct=(E_0)*(tau**air_mass)*cos_zeta;
         if(I_direct<0){I_direct=0}
	 
         # Print out the Easting, Northing and direct solar
         # irradiance for this cell
         printf("%6d %6d %6.1f\n", this_E, this_N, 
            I_direct) > "efyrnwy.dir";
	 
         # Calculate the diffuse solar irradiance
         sky_view=0.5*(1+cos(gradient));
         I_diffuse=sky_view*0.3*(1-(tau**air_mass))*\
            (E_0)*cos(zenith);
         if(I_diffuse<0){I_diffuse=0}
	 
         # Print out the Easting, Northing and diffuse solar
         # irradiance for this cell
         printf("%6d %6d %6.1f\n", this_E, this_N, 
            I_diffuse) > "efyrnwy.dif";
	 
         # Calculate global solar irradiance on surface
         I_global=I_direct+I_diffuse;
         if(I_global<0){I_global=0}
	 
         # Print out the Easting, Northing and diffuse solar
         # irradiance for this cell
         printf("%6d %6d %6.1f\n", this_E, this_N, 
            I_global) > "efyrnwy.tot";

      }
   }
}

function fn_abs(x){
   if(x<0){return -1*x} else {return x}
}
 
function fn_acos(x){
   if(x*x<=1){
      return 1.570796 - atan2(x/sqrt(1-x*x),1);
   } else {
      return 0;
   }
}
