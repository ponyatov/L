set terminal png size 320,100 font ",10"
set xdata time
set timefmt '"%Y-%m-%d %H:%M:%S"'
set format x "%H"
set output "../share/T.png"
plot 'weather.log' u 1:2 t '' w l lw 3 lc 1
set output "../share/H.png"
plot 'weather.log' u 1:3 t '' w l lw 3 lc 2
