gawk '{print}' rain98le.dat
gawk '{print $4 $5 $6 $7, $9/10.0}' rain98le.dat
gawk -f selcols.awk rain98le.dat
gawk -f selcols2.awk rain98le.dat
gawk -f selcols3.awk rain98le.dat
gawk -f selcols4.awk rain98le.dat
gawk -f selcols4.awk rain98le.dat > rain98le.out
gawk -f selcols5.awk rain98le.dat > le98rain.dat
