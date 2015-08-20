#-------------------------------------------------------------------------------
#Plantilla:Diagramas eps               	                 Autor:Carlos A. Gimenez
#-------------------------------------------------------------------------------
#			Salida del Archivo
#-------------------------------------------------------------------------------
set out "lnvsdx.eps"

set term post eps enhanced color solid

set size 0.8,0.8
#-------------------------------------------------------------------------------
#                  	Rotulos y Escalas de ejes
#-------------------------------------------------------------------------------
set title 'Hidrogeno'
set yl "-ln(N/N_0) (a.u.)"
set xl "Espesor del material [m]"
set xr[0:0.01]
#set yr[0.01:1]
#-------------------------------------------------------------------------------
#			Caracteristicas Especiales
#-------------------------------------------------------------------------------
#	Introdusco una flecha 
#set arrow from 0.6,0.04 to 0.98,0.004
#	Se pone un titulo en algun lugar
set label "Varianza=3.73252e-09, b=1e-30, a=0.893936" at 0.002,0.001
#	el label de las curvas...
set key 0.002,0.008
#	Muestra la grilla en x
#set grid xtics
#	Muestra la grilla en y
#set grid ytics

set style data linespoints
#-------------------------------------------------------------------------------
#			Archivos a graficar
#-------------------------------------------------------------------------------
plot "lnvsdx.dat" using 1:2 t""  w lp lw 2 lt 1
#-------------------------------------------------------------------------------
set out

set term X
#-------------------------------------------------------------------------------
#				FIN
#-------------------------------------------------------------------------------