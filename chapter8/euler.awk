# Continuous-time model of density-dependent (constrained)
# population growth, based on the Verhulst (logistic)
# equation (see Eq. 22), solved using Euler's method of
# numerical integration.
#
# Usage: gawk -f euler.awk -v dt=value [ > output_file ]
#
# Variables:
# ----------
# pop          population at time step
# growth_rate  instantaneous (intrinsic) growth rate
# carry_cap    carrying capacity
# time         current time
# stop_time    time at which simulation should stop
# dt           integration time step (1/steps)

BEGIN{
	pop=10.0;
	growth_rate=0.5;
	carry_cap=1000;
	time=0;
	stop_time=10;

	while(time<=stop_time){
		printf("%.1f\t%.3f\n", time, pop);
		
		# Numerical integration using Euler's method	
		time+=dt;
		delta_pop=growth_rate*pop*(1-(pop/carry_cap))*dt;
		pop+=delta_pop;	
	}
}
