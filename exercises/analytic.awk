# Exact analytical solution to the simple, two-layer (leaf 
# + soil substrate) model of light interaction with a plant
# canopy, for the special case in which the leaf layer
# completely covers the soil substrate. Accounts for 
# infinite-order multiple scattering.
#
# Usage: gawk -f analytic.awk -v R_Leaf=value \
#         -v T_Leaf=value -v R_Soil=value [ > output_file ]
#
# Variables:
# R_Leaf    Leaf spectral reflectance
# T_Leaf    Leaf spectral transmittance
# R_Soil    Soil spectral reflectance
# R_Canopy  Total canopy spectral reflectance

BEGIN{
   R_Canopy=R_Leaf+(T_Leaf*T_Leaf*R_Soil) \
      /(1-(R_Leaf*R_Soil));
   print R_Canopy;
}
