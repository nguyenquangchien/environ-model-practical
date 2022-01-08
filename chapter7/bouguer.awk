# Program to calculate the extinction of incident solar
# radiation as a function if the number of leaf layers
# traversed into a vegetation canopy, based on a simple
# two-stream model (upward and downward fluxes).
#
# Usage: gawk -f bouguer.awk -v  R_Leaf=value \
#             -v T_Leaf=value -v R_Soil=value \
#             -v layers=value -v threshold=value \
#             [ > outFile ]
#
# Variables:
# R_Leaf       Spectral reflectance of each leaf layer
# T_Leaf       Spectral transmittance of each leaf layer
# R_Soil       Spectral transmittance of the soil substrate
# I_Down[z]    Flux traveling downards from layer z
# I_Up[z]      Flux traveling upwards from layer z
# I_Up_prev    Flux traveling upward from the top leaf-
#              layer during the previous iteration
# layers       Number of leaf layers in canopy
# iteration    Number of iterations performed thus far
# threshold    Reflectance threshold to terminate iterations

BEGIN {
   # Set the total incident solar radiation
   I_Down[0]=1;
   iteration=0;
   # Outer do-while loop controls number of iterations 
   do{
      I_Up_prev=I_Up[1];
      # Inner loop deals with each of the leaf layers in turn
      for (z=1; z<=layers; ++z){
         I_Up[z]=(I_Down[z-1]*R_Leaf)+(I_Up[z+1]*T_Leaf);
         I_Down[z]=(I_Up[z+1]*R_Leaf)+(I_Down[z-1]*T_Leaf);
      } 	
      # ...and then the soil substrate
      I_Up[layers+1]=I_Down[layers]*R_Soil;
      ++iteration;
   } while((I_Up[1]-I_Up_prev)>threshold)
   # Print out the fraction of incident solar radiation
   # remaining at different depths (z) within the canopy.	
   for(z=0; z<=layers; ++z){
      printf("%3i %5.4f\n", z, I_Down[z]);
   } 
}
