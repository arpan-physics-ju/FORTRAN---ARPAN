set term png
set title "Heat Conduction in a Rod"
unset xtics
unset ytics          
unset colorbox       
set pm3d map  
set palette defined (50 "blue", 300 "gold", 500 "light-coral", 700 "red")
set cbrange [0:900]
set xrange [-0.5:3.5]
set yrange [-8:8]  
do for [i=1:500] {
    set output sprintf('frame_%03d.png', i)
    splot sprintf('file_%03d.txt',i) using 1:2:3 with image notitle
}
