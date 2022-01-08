gawk -f discrete.awk -v pop_init=100 -v lambda=0.95 -v period=50 > ex8-1a.dat
gawk -f discrete.awk -v pop_init=100 -v lambda=0.90 -v period=50 > ex8-1b.dat
gawk -f discrete.awk -v pop_init=100 -v lambda=0.85 -v period=50 > ex8-1c.dat
