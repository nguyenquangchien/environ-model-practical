reset
set xlabel "Measurement number"
set ylabel "Temperature, degrees Celsius"
set key top right box 
set yrange [-5:30]
plot 'le98temp.dat' u 1:3 t "Maximum temperature", \
     'le98temp.dat' u 1:4 t "Minimum temperature"
