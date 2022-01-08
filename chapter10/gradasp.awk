# Takes a 2D DEM and for each cell determines the local 
# gradient and aspect using the method of Zevenbergen 
# and Thorne (1987). Prints out two files, each 
# containing the coordinates of the cell concerned 
# and either (i) its gradient or (ii) its aspect.
#
# Usage: gawk -f gradasp.awk -v size=value input_file 
#             [> output_file]
#
# Variables:
# ----------
# min_E      eastern-most Easting in DEM
# max_E      western-most Easting in DEM
# min_N      southern-most Northing in DEM
# min_N      northern-most Northing in DEM
# this_E     Easting of current cell
# this_N     Northing of current cell
# size       DEM cell size (metres)
# gradNS     Gradient of current cell measured North-South
# gradEW     Gradient of current cell measured East-West
# gradient   Gradient of current cell
# aspect     Aspect of current cell
# elevation  2D array storing the DEM
# rad2deg    Conversion factor - radians to degrees
 
BEGIN{
	PI=3.14159263359;
	rad2deg=360.0/(2*PI);
}

{
	E=$1;                  # Reading in Easting
	N=$2;                  # Reading in Northing
	
	# Initialize minimum and maximum Easting and Northing 
	# of the DEM
	if(NR==1){min_E=E; max_E=E; min_N=N; max_N=N}
	
	if(E<min_E){min_E=E}   # Determine minimum and
	if(E>max_E){max_E=E}   # maximum Eastings and
	if(N<min_N){min_N=N}   # Northings (i.e., limits)
	if(N>max_N){max_N=N}   # of DEM
	
	elevation[E,N]=$3;     # Read elevation data into array
}

END{
	# Pass across DEM by Easting
	for(this_E=min_E+size; this_E<max_E; this_E+=size){
	
		# Pass up through DEM by Northing
		for(this_N=min_N+size; this_N<max_N; this_N+=size){
		
			# Calculate Zevenbergen and Thorne's (1987) parameters
			gradEW=(elevation[this_E-size,this_N]- \
			        elevation[this_E+size,this_N])/(2*size);
			gradNS=(elevation[this_E,this_N+size]- \
			        elevation[this_E,this_N-size])/(2*size);
			
			# Calculate the gradient (degrees)
			gradient[this_E,this_N]=rad2deg*\
			        (gradNS*gradNS + gradEW*gradEW)**0.5;
			# Print this value out to a file
			printf("%6i %6i %5.2f\n", this_E, this_N, 
				gradient[this_E,this_N]) > "gradient.dem";
			
			# Calculate the aspect (degrees)
			aspect=180+rad2deg*atan2(-gradEW,gradNS);
			# Print this value out to a file
			printf("%6i %6i %3i\n", this_E, this_N, 
					aspect) > "aspect.dem";
					
		}
		
	}
	
}
