set term 
set output "Demo.png"
unset xtics
unset ytics         
unset colorbox       
set palette defined (27 "blue", 1000 "red")
set pm3d map
set xrange [-0.5:2.0]
set yrange [-8:8]
splot 'file_010.txt' using 1:2:3 with image

