reset
set style data lines
set key top left box
set xlabel "Solar luminosity, L"

set ylabel "Globally averaged temperature, T_global/degC"
plot 'daisy4x.dat'  t "5 daisy species", \
     'daisy3.dat' t "3 daisy species", \
     'daisy2.dat' t "2 daisy species", \
     'nolife.dat' t "0 daisy species"
pause -1
