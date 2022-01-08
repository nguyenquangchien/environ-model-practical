# Continuous-time model of density-dependent (constrained)
# population growth, based on the Verhulst (logistic)
# equation (see Eq. |\emph{\ref{Eq: Logistic formula - density after time t}}|).
#
# Usage: gawk -f cntlogst.awk -v pop_init=value \
#             -v growth_rate=value -v carry_cap=value \
#             -v period=value [ > output_file ]
#
# Variables:
# ----------
# pop_init     initial population
# pop_now      current population
# growth_rate  instantaneous (intrinsic) growth rate
# carry_cap    carrying capacity
# period       period of time over which growth is modelled

BEGIN{
	for(time=0;time<=period;++time){
		pop_now=carry_cap/(1+((carry_cap-pop_init)/pop_init)* \
			exp(-growth_rate*time));
		print time, pop_now;
	}
}
