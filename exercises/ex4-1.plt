# Create a standard x-y plot
unset key
set xlabel "Wind direction (degrees relative to north)"
set ylabel "Relative frequency"
plot 'wind98le.dir' w i lw 2
pause -1 "Press the return key to continue"
# Create a polar plot
set angles degrees      # Angles measured in degrees
set polar               # Produce a polar plot
set grid polar 15.0     # Mark grid at 15 degree intervals
unset border            # Turn off normal borders
set xtics axis          # Plot the xtics along the x-axis
set ytics axis          # Plot the ytics along the y=axis
set xrange [-0.30:0.30]
set yrange [-0.30:0.30]
set size square         # Make the output square
plot 'wind98le.dir' u (90-$1):($2) w i lw 2
