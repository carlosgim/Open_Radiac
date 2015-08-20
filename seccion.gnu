#-------------------------------------------------------------------------------
#Plantilla:Diagramas eps               	                 Autor:Carlos A. Gimenez
#-------------------------------------------------------------------------------
#			Salida del Archivo
#-------------------------------------------------------------------------------
set out "seccioneficaz.eps"

set term post eps enhanced color solid

set size 0.8,0.8
#-------------------------------------------------------------------------------
#                  	Rotulos y Escalas de ejes
#-------------------------------------------------------------------------------
set title 'Secciones eficaces en funcion de la energia de incidencia'
set yl "{/Symbol s} [barn]"
set xl "E [MeV]"
set xr[0.01:1.]
#set logscale x
set yr[-0.01:0.7]
#set logscale y
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
plot "seccion.dat" using 1:2 t"{/Symbol s}_{PE}"  w l lw 2 lt 3,\
"seccion.dat" using 1:3 t"{/Symbol s}_{KN}" w l lw 2 lt 1
     
#-------------------------------------------------------------------------------
set out

#-------------------------------------------------------------------------------
#				FIN
#-------------------------------------------------------------------------------
