# bar library
SET(BAR_src ${SRCBAR}/functions.f90)
#SET(BAR_src ${SRCBAR}/oprad_molecule.f90)
ADD_LIBRARY(${BARLIB} STATIC ${BAR_src})
