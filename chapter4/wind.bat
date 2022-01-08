gawk -f meanwspd.awk wind98le.dat
gawk -f meanmaxw.awk wind98le.dat
gawk -f windfreq.awk wind98le.dat > windfreq.out
gawk -f windfrq2.awk wind98le.dat > windfrq2.out
gawk -f wpower.awk wind98le.dat > wind98le.pwr
