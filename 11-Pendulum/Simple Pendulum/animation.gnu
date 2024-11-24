set term pngcairo size 800,600
set xrange [-0.8:0.8]
set yrange [-1.3:0]
unset tics
do for [i=1:1000] {
    set output sprintf('frame_%05d.png', i)
    set title "Simple Pendulum"
    
    plot sprintf('file1_%05d.dat', i) using 2:3 with points pointtype 22 pointsize 3 title "Bob",\
    sprintf('file2_%05d.dat', i) using 2:3 with lines lt rgb "red" title "String"
}

