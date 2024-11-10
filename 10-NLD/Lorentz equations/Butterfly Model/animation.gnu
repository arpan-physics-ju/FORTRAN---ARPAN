set term pngcairo size 800,600
set xrange [-25:25]
set yrange [-30:30]

do for [i=3000:10000] {
    set output sprintf('/home/arpan/Programming/FORTRAN/10-NLD/Lorentz equations/Butterfly Model/DataFile/frame_%05d.png', i)
    set title "The Butterfly Effect"
    
    plot sprintf('file_%05d.dat', i) using 2:3 with lines lt rgb "red" title "Trajectory", \
         sprintf('point_%05d.dat', i) using 2:3 with points pointtype 22 pointsize 3 title "Position"
}

