# bar library
SET(BAR_src ${SRCBAR}/oprad_functions.f90
             ${SRCBAR}/oprad_molecule.f90
)
ADD_LIBRARY(${BARLIB} STATIC ${BAR_src})
