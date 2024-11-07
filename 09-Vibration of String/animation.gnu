set terminal pngcairo size 800,600
set xrange [0:1]
set yrange [-2:2]
do for [i=1:999] {
    set output sprintf('frame_%03d.png', i)
    set title sprintf("Vibration of a String")
    plot sprintf('file_%03d.dat',i) u 1:2 w l lw 1 lt rgb "red"  title "String"
}
