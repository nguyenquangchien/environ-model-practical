reset
set style data lines
set key top left box
set xlabel "Solar luminosity, L"
set ylabel "Globally averaged temperature, T_global/degC"
plot 'ex9-3_03.dat' t "a_gray=0.3", \
     'ex9-3_04.dat' t "a_gray=0.4", \
     'ex9-3_05.dat' t "a_gray=0.5", \
     'ex9-3_06.dat' t "a_gray=0.6", \
     'ex9-3_07.dat' t "a_gray=0.7"
pause -1

set key top right box
set ylabel "Fractional area of black daisies, a_black"
plot 'ex9-3_03.dat' u 1:3 t "a_gray=0.3", \
     'ex9-3_04.dat' u 1:3 t "a_gray=0.4", \
     'ex9-3_05.dat' u 1:3 t "a_gray=0.5", \
     'ex9-3_06.dat' u 1:3 t "a_gray=0.6", \
     'ex9-3_07.dat' u 1:3 t "a_gray=0.7"
pause -1

set key top left box
set ylabel "Fractional area of white daisies, a_white"
plot 'ex9-3_03.dat' u 1:4 t "a_gray=0.3", \
     'ex9-3_04.dat' u 1:4 t "a_gray=0.4", \
     'ex9-3_05.dat' u 1:4 t "a_gray=0.5", \
     'ex9-3_06.dat' u 1:4 t "a_gray=0.6", \
     'ex9-3_07.dat' u 1:4 t "a_gray=0.7"
pause -1
