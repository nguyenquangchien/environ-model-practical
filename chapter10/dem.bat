gawk -f gradasp.awk -v size=100 efyrnwy.dem
gawk -f demirrad.awk -v size=100 -v latitude=52.756 -v DOY=172 -v hour_angle=0 efyrnwy.dem
gawk -f d8ldd.awk -v size=100 efyrnwy.dem > efyrnwy.ld8
gawk -f d8arrows.awk -v size=100 efyrnwy.dem > efyrnwy.arr
