# Program to calculate the spectral reflectance of a 
# vegetation canopy modelled as two plane-parallel layers
# of leaves above a soil substrate.
#
# Usage: gawk -f 3layers.awk -v rho_leaf=value \
#             -v tau_leaf=value -v rho_soil=value \
#             [ > output_file ]
#
# Variables:
# area_leaf    Fractional area of leaves in each leaf layer
# LAI          Leaf Area Index
# rho_leaf     Leaf spectral reflectance
# tau_leaf     Leaf spectral transmittance
# rho_soil     Soil spectral reflectance
# rho_canopy   Canopy spectral reflectance
# gap          Fractional area of gaps in each leaf layer

BEGIN {
	for(area_leaf=0;area_leaf<=1;area_leaf+=0.1){
		# Initialize variables		
		LAI=2*area_leaf;
		gap=(1-area_leaf);
		# Calculate and print total canopy reflectance
		rho_canopy=area_leaf*rho_leaf + (gap*gap*rho_soil) + \
			(gap*area_leaf*rho_leaf) + \
			area_leaf*tau_leaf*area_leaf*rho_leaf*tau_leaf + \
			area_leaf*tau_leaf*area_leaf*rho_leaf*rho_leaf*\
				rho_leaf*tau_leaf + \
			2*(area_leaf*tau_leaf*gap*rho_soil*tau_leaf) + \
			2*(gap*area_leaf*tau_leaf*rho_soil*rho_leaf*\
				rho_soil*tau_leaf) + \
			area_leaf*tau_leaf*area_leaf*tau_leaf*rho_soil* \
				tau_leaf*tau_leaf;		
		print LAI, rho_canopy;
	}
}
