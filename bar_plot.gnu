set term pngcairo enhanced color
set output 'bar_plot.png'
set title 'Bar Plot'
set ylabel 'Values'
set style data histograms
set xtics rotate by -45
set boxwidth 0.8 relative
set style fill solid
set style histogram cluster gap 1
set key off
plot '-' using 2:xtic(1) lc rgb 'royalblue' title 'Data'
A 15.0
B 20.0
C 15.0
D 30.0
e
