# Reads digital elevation data stored in the form 
# of triplets (Easting, Northing, elevation) into
# a 2D GAWK array.
#
# Usage: gawk -f readarr.awk input_file
#
# Variables:
# ----------
# E         Easting
# N         Northing
# elevation Array in which DEM data are stored
 
{
	E=$1;               # Read in Easting
	N=$2;               # Read in Northing
		
	elevation[E,N]=$3;  # Read elevation data into array
}
