# Continuous-time model of density-dependent (constrained)
# population growth, based on the Verhulst (logistic)
# equation (see Eq. 22), solved using fourth-order
# Runge-Kutta numerical integration.
#
# Usage: gawk -f rk4.awk -v dt=value [ > output_file ]
#
# Variables:
# ----------
# pop          population at time step
# growth_rate  instantaneous (intrinsic) growth rate
# carry_cap    carrying capacity
# time         current time
# stop_time    time at which simulation should stop
# dt           integration step size

BEGIN{
	pop=10.0;
	carry_cap=1000;
	growth_rate=0.5;
	time=0;
	stop_time=10;
	
	while(time<=stop_time){
		printf("%f\t%f\n", time, pop);		

		# Fourth-order Runge-Kutta method 
		#(after Harris and Stocker, 1998)		
		k1=growth_rate*pop*(1-(pop/carry_cap));
		pop_1=pop+k1*dt/2.0;
		k2=growth_rate*pop_1*(1-(pop_1/carry_cap));
		pop_2=pop+k2*dt/2.0;
		k3=growth_rate*pop_2*(1-(pop_2/carry_cap));
		pop_3=pop+k3*dt;
		k4=growth_rate*pop_3*(1-(pop_3/carry_cap));
		pop+=(1.0/6.0)*(k1+2.0*k2+2.0*k3+k4)*dt;
		time+=dt;
	}
}
