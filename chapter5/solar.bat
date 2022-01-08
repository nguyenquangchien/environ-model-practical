gawk -f selradt.awk radt98le.dat > radt98le.out
gawk -f solarrad.awk > solarrad.out
gawk -f solarrad.awk -v DOY=2
gawk -f solarrd2.awk > solarrd2.out
