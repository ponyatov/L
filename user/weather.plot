set terminal png size 360,120 font ",10"
set xdata time
set timefmt '"%Y-%m-%d %H:%M:%S"'
set format x "%H"
set grid
set output "../share/weather/T.png"
plot 'weather.log' u 1:2 t 'FTSE' w l lw 3 lc 1
set output "../share/weather/H.png"
plot 'weather.log' u 1:3 t 'Nikkey' w l lw 3 lc 2
