set terminal png size 360,120 font ",10" x000000 xffffff
set xdata time
set timefmt '"%Y-%m-%d %H:%M:%S"'
set format x "%H"
set datafile missing "?"
#set grid lt 1 lc rgb '#888888'
unset grid
unset border
set output "/tmp/weather/T.png"
set ytics 3
plot 'weather.dat' u 1:2 t '' w l lw 5 lc rgb '#44FF44', 0 t '' w l lw 1 lc 3
set output "/tmp/weather/H.png"
set ytics 20
plot 'weather.dat' u 1:3 t '' w l lw 5 lc rgb '#FF4444', \
'weather.dat' u 1:5 t '' w p pt 9 ps 1.5 lc rgb "#0000FF", \
'weather.dat' u 1:6 t '' w p pt 3 ps 1.5 lc rgb "#FFFF00"
set output "/tmp/weather/P.png"
set ytics 5
plot 'weather.dat' u 1:4 t '' w l lw 5 lc rgb '#4444FF', 1013 t '' w l lw 1 lc 2
