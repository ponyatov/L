set xdata time
set timefmt '"%Y-%m-%d %H:%M:%S"'
set format x "%d/%H"
plot 'weather.log' u 1:2 t '' w boxes 
pause -1
plot 'weather.log' u 1:3 t '' w boxes 
pause -1
