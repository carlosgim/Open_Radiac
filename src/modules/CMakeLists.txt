# bar library
SET(BAR_src ${SRCBAR}/functions.f90
             ${SRCBAR}/oprad_molecule.f90
             ${SRCBAR}/oprad_atomic.f90
             ${SRCBAR}/constants.f90
             ${SRCBAR}/readinput.f90
)
ADD_LIBRARY(${BARLIB} STATIC ${BAR_src})
