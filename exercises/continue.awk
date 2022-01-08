# Continuous model of unconstrained (density-independent)
# population growth (see Eq.8.16).
#
# Usage: gawk -f continue.awk -v pop_init=value \
#             -v growth_rate=value -v period=value \
#             [ > outputFile ]
#
# Variables:
# ----------
# pop_init     initial population
# growth_rate  instantaneous (intrinsic) growth rate
# period       period of time over which growth is modelled

BEGIN{
   for(time=0;time<=period;++time){
      print time, pop_init*exp(growth_rate*time);
   }
}
