gawk -f rk4.awk -v delta_t=0.5 > rk4_05.dat
gawk -f rk4.awk -v delta_t=0.1 > rk4_01.dat
gawk -f rk4.awk -v delta_t=0.01 > rk4_001.dat
gawk -f rk4.awk -v delta_t=0.001 > rk4_0001.dat
