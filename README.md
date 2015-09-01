# AMcalc #

Programa amcalc Version 1.0 19/08/2015

Algoritmo simple para el estudio de rayos gama en medios materiales


## The directory structure ##

    CMakeLists.txt
    README.md
    bin/
    cmake/
        Modules/
            FindOpenMP_Fortran.cmake
            SetCompileFlag.cmake
            SetFortranFlags.cmake
            SetParallelizationLibrary.cmake
            SetUpLAPACK.cmake
    distclean.cmake
    lib/
    src/
        main/
            CMakeLists.txt
            amcalc.f90
            constants.f90
        modules/
            CMakeLists.txt
            functions.f90


## Notas de uso ##

- Que hace
- Bla bla

## Como adquirir la ultima version ##

$ git clone https://github.com/carlosgim/..


## Requisitos ##
===========

- gfortran
- Python 2.7
- cmake

### Como ejecutarlo ###

$ ./ramc

## Contacto ##

e-mail: scire1905@gmail.com

## Source cmake temp ##
The Fortran Template was taken from: https://github.com/SethMMorton/cmake_fortran_template
            
