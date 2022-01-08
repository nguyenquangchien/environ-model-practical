# Simple model of light interaction with a two-layer 
# plant canopy (i.e., a leaf layer suspended above a
# soil substrate).
#
# Version 1.
#
# Usage: gawk -f twolayer.awk -v rho_leaf=value \
#             -v tau_leaf=value -v rho_soil=value \
#            [ > output_file ]
#
# Variables:
# area_leaf  Fractional area covered by leaves
# rho_leaf   Leaf spectral reflectance
# tau_leaf   Leaf spectral transmittance
# rho_soil   Soil spectral reflectance
# rho_canopy Canopy spectral reflectance
# gap        Fractional area of gaps in leaf layer

BEGIN{
   for(area_leaf=0;area_leaf<=1;area_leaf+=0.1){	
      gap=1-area_leaf;
      rho_canopy=area_leaf*rho_leaf + (gap*rho_soil) + \
         (area_leaf*tau_leaf*rho_soil*tau_leaf);		
      print area_leaf, rho_canopy;			
   }
}
