#-------------------------------------------------------------------------------
#Plantilla:Diagramas eps               	                 Autor:Carlos A. Gimenez
#-------------------------------------------------------------------------------
#			Salida del Archivo
#-------------------------------------------------------------------------------
set out "atenuacion_H.eps"

set term post eps enhanced color solid

set size 1.,1.
#-------------------------------------------------------------------------------
#                  	Rotulos y Escalas de ejes
#-------------------------------------------------------------------------------
set title 'Hidrogeno'
set yl "{/Symbol m}/{/Symbol r} [cm^2/g]"
set xl "E [MeV]"
set xr[0.01:1]
set logscale x
set yr[0.01:1]
set logscale y
#-------------------------------------------------------------------------------
#			Caracteristicas Especiales
#-------------------------------------------------------------------------------
#	Introdusco una flecha 
#set arrow from 0.6,0.04 to 0.98,0.004
#	Se pone un titulo en algun lugar
#set label "(a)" at 0.58,0.046
#	el label de las curvas...
#set key 0.25,0.325
#	Muestra la grilla en x
#set grid xtics
#	Muestra la grilla en y
#set grid ytics

#set style data linespoints
#-------------------------------------------------------------------------------
#			Archivos a graficar
#-------------------------------------------------------------------------------
plot "xcom.dat" using 1:4 t"XCOM"  w l lw 2 lt 1,\
"Atenuacion.dat" using 2:1 t"Calc"  w l lw 2 lt 3
#-------------------------------------------------------------------------------
set out

#-------------------------------------------------------------------------------
#				FIN
#-------------------------------------------------------------------------------
