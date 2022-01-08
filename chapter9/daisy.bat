gawk -f daisy1.awk -v luminosity=1.0 > daisy1.dat
gawk -f daisy2.awk > daisy2.dat
gawk -f nolife.awk > nolife.dat
gawk -f daisy3.awk > daisy3.dat
gawk -f daisy4.awk > daisy4.dat
gawk -f daisyvar.awk -f daisy5.awk -f daisyfns.awk > daisy5.dat
