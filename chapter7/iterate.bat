gawk -f analytic.awk -v R_Leaf=0.475 -v T_Leaf=0.475 -v R_Soil=0.125
gawk -f analytic.awk -v R_Leaf=0.04 -v T_Leaf=0.04 -v R_Soil=0.08
gawk -f iterate.awk -v R_Leaf=0.475 -v T_Leaf=0.475 -v R_Soil=0.125 -v layers=3 > layers.nir
gawk -f iterate.awk -v R_Leaf=0.04 -v T_Leaf=0.04 -v R_Soil=0.08 -v layers=3 > layers.red
gawk -f iterate.awk -v R_Leaf=0.475 -v T_Leaf=0.475 -v R_Soil=0.125 -v layers=4 >> layers.nir
gawk -f iterate2.awk -v R_Leaf=0.475 -v T_Leaf=0.475 -v R_Soil=0.125 -v layers=10 > iterate2.nir
gawk -f iterate2.awk -v R_Leaf=0.04 -v T_Leaf=0.04 -v R_Soil=0.08 -v layers=10 > iterate2.red
gawk -f iterate3.awk -v R_Leaf=0.475 -v T_Leaf=0.475 -v R_Soil=0.125 -v layers=10 -v threshold=0.01 > iterate3.nir
gawk -f iterate3.awk -v R_Leaf=0.04 -v T_Leaf=0.04 -v R_Soil=0.08 -v layers=10 -v threshold=0.01 > iterate3.red
gawk -f bouguer.awk -v R_Leaf=0.04 -v T_Leaf=0.04 -v R_Soil=0.08 -v layers=10 -v threshold=0.01 > bouguer.red

gawk -f iterate.awk -v R_Leaf=0.475 -v T_Leaf=0.475 -v R_Soil=0.125 -v layers=0 > layers.nir
gawk -f iterate.awk -v R_Leaf=0.475 -v T_Leaf=0.475 -v R_Soil=0.125 -v layers=1 >> layers.nir
gawk -f iterate.awk -v R_Leaf=0.475 -v T_Leaf=0.475 -v R_Soil=0.125 -v layers=2 >> layers.nir
gawk -f iterate.awk -v R_Leaf=0.475 -v T_Leaf=0.475 -v R_Soil=0.125 -v layers=3 >> layers.nir
gawk -f iterate.awk -v R_Leaf=0.475 -v T_Leaf=0.475 -v R_Soil=0.125 -v layers=4 >> layers.nir
gawk -f iterate.awk -v R_Leaf=0.475 -v T_Leaf=0.475 -v R_Soil=0.125 -v layers=5 >> layers.nir
gawk -f iterate.awk -v R_Leaf=0.475 -v T_Leaf=0.475 -v R_Soil=0.125 -v layers=6 >> layers.nir
gawk -f iterate.awk -v R_Leaf=0.475 -v T_Leaf=0.475 -v R_Soil=0.125 -v layers=7 >> layers.nir
gawk -f iterate.awk -v R_Leaf=0.475 -v T_Leaf=0.475 -v R_Soil=0.125 -v layers=8 >> layers.nir
gawk -f iterate.awk -v R_Leaf=0.475 -v T_Leaf=0.475 -v R_Soil=0.125 -v layers=9 >> layers.nir
gawk -f iterate.awk -v R_Leaf=0.475 -v T_Leaf=0.475 -v R_Soil=0.125 -v layers=10 >> layers.nir

gawk -f iterate.awk -v R_Leaf=0.04 -v T_Leaf=0.04 -v R_Soil=0.08 -v layers=0 > layers.red
gawk -f iterate.awk -v R_Leaf=0.04 -v T_Leaf=0.04 -v R_Soil=0.08 -v layers=1 >> layers.red
gawk -f iterate.awk -v R_Leaf=0.04 -v T_Leaf=0.04 -v R_Soil=0.08 -v layers=2 >> layers.red
gawk -f iterate.awk -v R_Leaf=0.04 -v T_Leaf=0.04 -v R_Soil=0.08 -v layers=3 >> layers.red
gawk -f iterate.awk -v R_Leaf=0.04 -v T_Leaf=0.04 -v R_Soil=0.08 -v layers=4 >> layers.red
gawk -f iterate.awk -v R_Leaf=0.04 -v T_Leaf=0.04 -v R_Soil=0.08 -v layers=5 >> layers.red
gawk -f iterate.awk -v R_Leaf=0.04 -v T_Leaf=0.04 -v R_Soil=0.08 -v layers=6 >> layers.red
gawk -f iterate.awk -v R_Leaf=0.04 -v T_Leaf=0.04 -v R_Soil=0.08 -v layers=7 >> layers.red
gawk -f iterate.awk -v R_Leaf=0.04 -v T_Leaf=0.04 -v R_Soil=0.08 -v layers=8 >> layers.red
gawk -f iterate.awk -v R_Leaf=0.04 -v T_Leaf=0.04 -v R_Soil=0.08 -v layers=9 >> layers.red
gawk -f iterate.awk -v R_Leaf=0.04 -v T_Leaf=0.04 -v R_Soil=0.08 -v layers=10 >> layers.red

gawk -f iterate2.awk -v R_Leaf=0.475 -v T_Leaf=0.475 -v R_Soil=0.125 -v layers=10 -v threshold=0.01 > iterate2.nir
gawk -f iterate2.awk -v R_Leaf=0.04 -v T_Leaf=0.04 -v R_Soil=0.08 -v layers=10 -v threshold=0.01 > iterate2.red
