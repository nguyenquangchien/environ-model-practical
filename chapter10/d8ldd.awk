# Implementation of the D8 ("eight point pour") algorithm. 
# Derives local drainage direction (LDD) from a DEM (see
# [Burrough and McDonnell 1998]). Prints out coordinates of 
# each cell, the relative coordinates to the neighboring 
# cell in the direction of steepest downhill descent, plus 
# the elevations of these two cells.
#
# Usage: gawk -f d8ldd.awk -v size=value input [> output]
#
# Variables:
# ----------
# size       DEM cell size (meters)
# min_E      western-most Easting in DEM (meters)
# max_E      eastern-most Easting in DEM (meters)
# min_N      northern-most Northing in DEM (meters)
# min_N      southern-most Northing in DEM (meters)
# this_E     Easting of current cell (meters)
# this_N     Northing of current cell (meters)
# offset_E   Offset (Easting) from current cell (meters)
# offset_N   Offset (Northing) from current cell (meters)
# steep_E    Offset (Easting) to neighboring cell with 
#            steepest gradient (meters)
# steep_N    Offset (Northing) to neighboring cell with
#            steepest gradient (meters)
# gradient   Gradient between the current cell and one of
#            its eight immediate neighbors (degrees)
# steepest   Steepest gradient in neighborhood (degrees)
  
{
   # Read in Easting and Northing of current cell from DEM
   E=$1;
   N=$2;
	
   # Initialize min. and max. Easting and Northing of DEM
   if(NR==1){min_E=E; max_E=E; min_N=N; max_N=N}

   # Determine min. and max. Eastings and Northings of DEM
   if(E<min_E){min_E=E} 
   if(E>max_E){max_E=E}
   if(N<min_N){min_N=N}
   if(N>max_N){max_N=N}

   # Read elevation data into array (DEM)
   dem[E,N]=$3;
}

END{
   # Pass across DEM by Easting
   for(this_E=min_E+size;this_E<max_E;this_E+=size){
      # Pass up through DEM by Northing
      for(this_N=min_N+size;this_N<max_N;this_N+=size){

         # Initialize steep downhill descent
         steepest=-999;
         # Loop through eight neighboring cells, by Easting
         for(offset_E= -size;offset_E<=size;offset_E+=size){
            # ...and now loop by Northing	 
            for(offset_N= -size;offset_N<=size;
               offset_N+=size){

               # Ignore center cell, from which flow occurs
               if(!((offset_E==0) && (offset_N==0))){		
                  gradient=dem[this_E,this_N]-\
		           dem[this_E+offset_E,this_N+offset_N];
                  gradient/=sqrt((offset_E*offset_E)+\
		            (offset_N*offset_N));
                  if(gradient>steepest){
                     # Steepest downhill gradient detected.
                     # Record gradient and direction.
                     steepest=gradient;
                     steep_E=offset_E;
                     steep_N=offset_N;
                  }           # End of inner 'if' block
               }              # End of outer 'if' block
	       
            }                 # End of inner 'for' loop
         }                    # End of outer 'for' loop

         # Print coordinates of cell from which flow
         # occurs and relative coordinates of cell into
         # which flow occurs, plus their elevations.
         printf("%6i %6i %6i %6i %6.1f %6.1f\n",\
            this_E, this_N, steep_E, steep_N, \
            dem[this_E,this_N], \
            dem[this_E+steep_E,this_N+steep_N]);
		 
      }                    # End Northing 'for' loop
   }                       # End Easting 'for loop  
}                          # End 'END' block
