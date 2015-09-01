set out "Histograma_energia.eps"

set term post eps enhanced color solid

set size 1,1

#set title ''

set yl "Conteo (u.a.)"
set xl "E [MeV]"

set xr[0.01:1]
#set yr[0:2]

#set grid xtics
#set grid ytics


#set boxwidth 0.2 absolute
#set style fill   solid 1.00 border -1
#set style histogram clustered gap 1 title  offset character 0, 0, 0 font "Arial,1"
#set datafile missing '-'
#set style data histograms
set style data linespoint
#set xtics border in scale 0.1,0.05 nomirror rotate by -45  offset character 0, 0, 0 

#plot 'Conteo.dat' using 1:2 w lp t"" 
plot 'Conteo.dat' using 1:2 w l lw 2 lt 3 t"" 


set out


