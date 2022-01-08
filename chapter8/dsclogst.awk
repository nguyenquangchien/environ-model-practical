# Discrete-time model of density-dependent (constrained)
# population growth, based on the Verhulst (logistic)
# equation (see Eq. 22).
#
# Usage: gawk -f dsclogst.awk -v pop=value \
#             -v growth_rate=value -v carry_cap=value \
#             -v steps=value [ > output_file ]
#
# Variables:
# ----------
# pop          population at time step
# growth_rate  instantaneous (intrinsic) growth rate
# carry_cap    carrying capacity
# steps        total number of time steps

BEGIN{
	for(time_step=0;time_step<=steps;++time_step){
		print time_step, pop;
		pop=pop*exp(growth_rate*(1-pop/carry_cap));
	}
}
