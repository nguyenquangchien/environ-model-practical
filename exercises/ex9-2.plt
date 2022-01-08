reset
set key top left Left box
set xlabel "Solar luminosity, L"
set style data lines

set ylabel "Globally averaged temperature, T/deg C"
plot 'ex9-2blk.dat' u 1:2 t "Black daisies only", \
     'ex9-2wht.dat' u 1:2 t "White daisies only", \
     'daisy2.dat' u 1:2 t "Black and white daisies"
pause -1

set yrange [0:0.8]
set ylabel "Fractional area covered, a"
plot 'ex9-2blk.dat' u 1:3 t "Black daisies only", \
     'ex9-2wht.dat' u 1:3 t "White daisies only"
pause -1

