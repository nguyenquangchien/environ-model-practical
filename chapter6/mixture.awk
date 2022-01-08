# Simple model of solar radiation interaction with a mixed
# soil and vegetation surface. The program calculates the 
# average spectral reflectance of a surface covered by the 
# specified areal fractions of soil and vegetation (leaves).
#
# Usage: gawk -f mixture.awk -v rho_leaf=value \
#		-v rho_soil=value [ > output_file ]
#
# Variables:
# area_leaf		Fractional area covered by leaves
# rho_leaf		Leaf spectral reflectance
# rho_soil		Soil spectral reflectance
# rho_surface	Average spectral reflectance of surface

BEGIN{
	for(area_leaf=0;area_leaf<=1;area_leaf+=0.1){
		rho_surface=(area_leaf*rho_leaf)+ \
			((1-area_leaf)*rho_soil);
		print area_leaf, rho_surface;
	}
}
