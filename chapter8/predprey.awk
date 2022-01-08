# A simple model of predator-prey interaction based
# on the Lotka-Volterra equations (see Equations 8.31 and 
# 8.32), solved using fourth-order Runge-Kutta numerical 
# integration techniques.
#
# Usage: gawk -f predprey.awk -v dt=value [ > outputFile ]
		
BEGIN{
   prey=20.0;       # Population density, prey (N_1)
   pred=20.0;       # Population density, predator (N_2)
   death=0.6;       # Death rate, predator species (d)
   p_coeff=0.1;     # Coefficient of predation (a)
   p_effic=0.5;     # Predator efficiency (b)
   growth_rate=0.9; # Growth rate, prey species (r)
   time_stop=60;    # Time at which simulation should stop (t)
   time=0;          # Current time

   while(time<=time_stop){
      print time, prey, pred;

      time+=dt;		
      
      # Prey species (Eq. 8.31), predator species (Eq. 8.32)
      k1_prey=(growth_rate*prey)-(p_coeff*prey*pred);
      k1_pred=(p_effic*p_coeff*prey*pred)-(death*pred);     
      prey_1=prey+k1_prey*dt/2;
      pred_1=pred+k1_pred*dt/2;    
      k2_prey=(growth_rate*prey_1)-(p_coeff*prey_1*pred_1);
      k2_pred=(p_effic*p_coeff*prey1*pred_1)-(death*pred_1);   
      prey_2=prey+k2_prey*dt/2;
      pred_2=pred+k2_pred*dt/2;   
      k3_prey=(growth_rate*prey_2)-(p_coeff*prey_2*pred_2);
      k3_pred=(p_effic*p_coeff*prey_2*pred_2)-(death*pred_2);    
      prey_3=prey+k3_prey*dt;
      pred_3=pred+k3_pred*dt;    
      k4_prey=(growth_rate*prey_3)-(p_coeff*prey_3*pred_3);
      k4_pred=(p_effic*p_coeff*prey_3*pred_3)-(death*pred_3);
      
      # Calculate revised populations
      prey+=(1/6)*(k1_prey+2*k2_prey+2*k3_prey+k4_prey)*dt;
      pred+=(1/6)*(k1_pred+2*k2_pred+2*k3_pred+k4_pred)*dt;	
   }
}
