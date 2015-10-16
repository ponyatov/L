set terminal png size 360,120 font ",10" x000000 xffffff
set xdata time
set timefmt '"%Y-%m-%d %H:%M:%S"'
set format x "%H"
#set grid lt 1 lc rgb '#888888'
unset grid
unset border
set output "/tmp/weather/T.png"
set ytics 3
plot 'weather.dat' u 1:2 t '' w l lw 5 lc rgb '#44FF44'
set output "/tmp/weather/H.png"
set ytics 10
plot 'weather.dat' u 1:3 t '' w l lw 5 lc rgb '#FF4444'
set output "/tmp/weather/P.png"
set ytics 5
plot 'weather.dat' u 1:4 t '' w l lw 5 lc rgb '#4444FF'
