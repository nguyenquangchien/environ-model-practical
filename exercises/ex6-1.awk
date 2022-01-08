# Simple model of solar radiation interaction with a mixed
# soil, vegetation and snow surface. The program calculates 
# spectral reflectance of a surface covered by specified
# areal fractions of soil, vegetation (leaves) and snow
#
# Usage: gawk -f mixture.awk -v rho_leaf=value \
#             -v rho_soil=value -v rho_snow \
#             [ > output_file ]
#
# Variables:
# area_leaf		Fractional area covered by leaves
# rho_leaf		Leaf spectral reflectance
# rho_soil		Soil spectral reflectance
# rho_surface	Average spectral reflectance of surface

BEGIN{
   for(area_leaf=0;area_leaf<=1;area_leaf+=0.1){
      for(area_snow=0;area_snow<=1-area_leaf;area_snow+=0.1){
         area_soil=1-(area_leaf+area_snow);
         rho_surface=(area_leaf*rho_leaf)+ \
            area_snow*rho_snow + \
            (area_soil*rho_soil);
            printf("%3.1f %3.1f %3.1f %4.2f\n", \
	       area_leaf, area_snow, area_soil, rho_surface);
      }
   }
}
