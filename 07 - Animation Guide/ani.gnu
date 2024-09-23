set terminal pngcairo size 800,600
set xrange [0:16]
set yrange [0:1000]
do for [i=1:200] {
    set output sprintf('frame_%03d.png', i)
    set title sprintf("Frame: %d", i)
    plot sprintf('file_%03d.txt',i) u 1:2 w l lw 10 lt rgb "red"  title "Temp"
}
