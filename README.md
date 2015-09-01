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


### distclean.cmake ###

This is a CMake script that will remove all files and folder that are created after running `make`.  You can run this code in one of two ways:

* Execute `cmake -P distclean.cmake`. (The `-P` option to `cmake` will execute a CMake script)
* Execute `make distclean` after your Makefile has been generated.

You shouldn't need to edit this file.

## Configuring the build ##

It is usually preferred that you do an out-of-source build.  To do this, create a `build/` directory at the top level of your project and build there.  

    $ mkdir build
    $ cd build
    $ cmake ..
    $ make
    
When you do this, temporary CMake files will not be created in your `src/` directory.  

As written, this template will allow you to specify one of three different sets of compiler flags.  The default is RELEASE.  You can change this using to TESTING or DEBUG using

    $ cmake .. -DCMAKE_BUILD_TYPE=DEBUG
    
or

    $ cmake .. -DCMAKE_BUILD_TYPE=TESTING
                
