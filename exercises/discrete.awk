# Discrete model of unconstrained (density-independent)  
# population growth (see Eq. 8.10).
#
# Usage: gawk -f discrete.awk -v pop_init=value \
#             -v lambda=value -v period=value \	
#             [ > outputFile ]
#
# Variables:
# ----------
# pop_init  initial population
# lambda    discrete (finite) rate of population growth
# period    period (time steps) over which growth modeled

BEGIN{
   for(time_step=0;time_step<=period;++time_step){
      print time_step, pop_init*(lambda**time_step);
   }
}
