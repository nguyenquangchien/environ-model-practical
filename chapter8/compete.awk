# Simple model of population growth with inter-specific
# competition described by the Lokta-Volterra equations 
# (Eqs. 4 and 5), solved using Euler's method of
# numerical integration.
#
# Usage: gawk -f compete.awk params.dat [ > outputFile ]
#
# Variables
# ------------
# pop_1, pop_2 Initial population density, species 1 and 2
# carry_1      Carrying capacity, species 1
# carry_2      Carrying capacity, species 2
# alpha, beta  Competition coefficients, species 1 and 2
# growth_1     Growth rate, species 1	
# growth_2     Growth rate, species 2
# time         Current time
# stop_time    Time period after which simulation should stop
# dt           Time step for numerical integration

(NR==1){pop_1=$2;}
(NR==2){pop_2=$2;}
(NR==3){carry_1=$2;}
(NR==4){carry_2=$2;}
(NR==5){alpha=$2;}
(NR==6){beta=$2;}
(NR==7){growth_1=$2;}
(NR==8){growth_2=$2;}
(NR==9){stop_time=$2;}
(NR==10){dt=$2;}
		
END{
   time=0;	
   while(time<=stop_time){
      print time, pop_1, pop_2;
      # Increment time by dt
      time+=dt;
      # Calculate change in population species 1 (Eq. 4)
      delta_pop_1=dt*growth_1*pop_1* \
         ((carry_1-pop_1-(alpha*pop_2))/carry_1);
      # Calculate change in population species 2 (Eq. 5)
      delta_pop_2=dt*growth_2*pop_2* \
         ((carry_2-pop_2-(beta*pop_1))/carry_2);
      # Calculate new population sizes species 1 and 2
      pop_1+=delta_pop_1;
      pop_2+=delta_pop_2;
   }
}
