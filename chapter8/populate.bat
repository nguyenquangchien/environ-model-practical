gawk -f discrete.awk -v pop_init=10 -v lambda=1.05 -v period=50 > discr105.dat
gawk -f discrete.awk -v pop_init=10 -v lambda=1.06 -v period=50 > discr106.dat
gawk -f discrete.awk -v pop_init=10 -v lambda=1.07 -v period=50 > discr107.dat
gawk -f continue.awk -v pop_init=10 -v growth_rate=0.05 -v period=50 > cont005.dat
gawk -f continue.awk -v pop_init=10 -v growth_rate=0.06 -v period=50 > cont006.dat
gawk -f continue.awk -v pop_init=10 -v growth_rate=0.07 -v period=50 > cont007.dat
gawk -f cntlogst.awk -v pop_init=10 -v growth_rate=0.05 -v carry_cap=1000 -v period=200 > c_log005.dat
gawk -f cntlogst.awk -v pop_init=10 -v growth_rate=0.06 -v carry_cap=1000 -v period=200 > c_log006.dat
gawk -f cntlogst.awk -v pop_init=10 -v growth_rate=0.07 -v carry_cap=1000 -v period=200 > c_log007.dat
gawk -f dsclogst.awk -v pop=10 -v growth_rate=0.05 -v carry_cap=1000 -v steps=200 > d_log005.dat
gawk -f dsclogst.awk -v pop=10 -v growth_rate=0.06 -v carry_cap=1000 -v steps=200 > d_log006.dat
gawk -f dsclogst.awk -v pop=10 -v growth_rate=0.07 -v carry_cap=1000 -v steps=200 > d_log007.dat
gawk -f euler.awk -v dt=1.0 > euler1.dat
gawk -f euler.awk -v dt=0.5 > euler05.dat
gawk -f euler.awk -v dt=0.1 > euler01.dat
gawk -f rk4.awk -v dt=0.1 > rk4.dat
gawk -f compete.awk params1.dat > compete1.dat
gawk -f compete.awk params2.dat > compete2.dat
gawk -f predprey.awk -v dt=0.01 > predprey.dat
