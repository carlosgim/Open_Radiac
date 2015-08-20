#-------------------------------------------------------------------------------
#Plantilla:Diagramas eps               	                 Autor:Carlos A. Gimenez
#-------------------------------------------------------------------------------
#			Salida del Archivo
#-------------------------------------------------------------------------------
set out "seccioneficaz_log.eps"

set term post eps enhanced color solid

set size 0.8,0.8
#-------------------------------------------------------------------------------
#                  	Rotulos y Escalas de ejes
#-------------------------------------------------------------------------------
set title 'Hidrogeno'
set yl "{/Symbol s} [barn]"
set xl "E [MeV]"
set xr[0.01:1]
set logscale x
set yr[1E-9:10]
set logscale y
#-------------------------------------------------------------------------------
#			Caracteristicas Especiales
#-------------------------------------------------------------------------------
#	Introdusco una flecha 
#set arrow from 0.6,0.04 to 0.98,0.004
#	Se pone un titulo en algun lugar
#set label "(a)" at 0.58,0.046
#	el label de las curvas...
#set key 1.0,0.01
#	Muestra la grilla en x
#set grid xtics
#	Muestra la grilla en y
#set grid ytics

#set style data linespoints
#-------------------------------------------------------------------------------
#			Archivos a graficar
#-------------------------------------------------------------------------------
plot "seccion.dat" using 1:2 t"{/Symbol s}_{PE}"  w l lw 2 lt 3, \
"seccion.dat" using 1:3 t"{/Symbol s}_{KN}" w l lw 2 lt 1,\
"xcom.dat" using 1:3 t"{/Symbol s}_{PE}-XCOM" w l lw 2 lt 2,\
"xcom.dat" using 1:2 t"{/Symbol s}_{EC}-XCOM" w l lw 5 lt 9,\
"xcom.dat" using 1:4 t"{/Symbol s}_{T}-XCOM" w l lw 2 lt 7
     
#-------------------------------------------------------------------------------
set out
#-------------------------------------------------------------------------------
#				FIN
#-------------------------------------------------------------------------------
