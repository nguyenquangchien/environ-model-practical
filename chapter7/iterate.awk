# Program to calculate the spectral reflectance of a 
# plant canopy based on a simple two-stream model
# (upward and downward fluxes) for a user-specified 
# number of leaf layers above a soil substrate. The 
# program requires selected information to be provided 
# via the command line:
#
# Usage: gawk -f iterate.awk -v  R_Leaf=value \
#             -v T_Leaf=value -v R_Soil=value \
#             -v layers=value [ > outFile ]
#
# Variables:
# R_Leaf      Spectral reflectance of each leaf layer
# T_Leaf      Spectral transmittance of each leaf layer
# R_Soil      Spectral transmittance of the soil substrate
# I_Down[z]   Flux traveling downards from layer z
# I_Up[z]     Flux traveling upwards from layer z
# layers      Number of leaf layers in canopy
# iteration   Number of iterations performed

BEGIN {
   # Set the total incident solar radiation
   I_Down[0]=1;
	
   # Outer loop performs iterations
   for (iteration=1;iteration<=20;iteration++){
	
      # Inner loop deals with each leaf layer in turn
      for (z=1; z<=layers; z++){
         I_Up[z]=(I_Down[z-1]*R_Leaf)+(I_Up[z+1]*T_Leaf);
         I_Down[z]=(I_Up[z+1]*R_Leaf)+(I_Down[z-1]*T_Leaf);
      }
		
      # ...and then the soil substrate
      I_Up[layers+1]=I_Down[layers]*R_Soil;
      
   }
	
   # Finally, print out the number of leaf layers (LAI) and
   # the spectral reflectance of the canopy as a whole
   printf("%-3i %5.4f\n", layers, I_Up[1]);
	
}
