set terminal png size 360,120 font ",10" x000000 xffffff
set xdata time
set timefmt '"%Y-%m-%d %H:%M:%S"'
set format x "%H"
set grid
set output "../share/weather/T.png"
plot 'weather.log' u 1:2 t '' w l lw 5 lc 1 rgb 'FF0000'
set output "../share/weather/H.png"
plot 'weather.log' u 1:3 t '' w l lw 5 lc 2 rgb '00FF00'
