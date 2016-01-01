! (c) Carlos A. Gimenez
! licensed under the GNU General Public License V3
module functions

  use constants
  
  implicit none
!  public :: fs, funcsigmaPE, funcsigmaKN
!  public :: rig, N, sigma, gama, alfaZ, b0, b1, b2, Pi, faZ
!  real(kind=8) :: rig, N, sigma, gama, alfaZ, b0, b1, b2, Pi, faZ
contains

!*********************************************************************************
! Put references to these equations (!)

real(kind=8) function fs(rig,N,sigma)
!Funcion que calcula el camino libre
  real(kind=8),intent(in):: N
  real (kind=8)::rig,sigma
 fs=-log(rig)/(N*sigma) !El factor 1D2 viene de corregir N (1/m^3)
end function fs

real(kind=8) function funcsigmaPE(gama,alfaZ,b0,b1,b2,faZ)
!Funcion que calcula sección eficaz Efecto Fotoeléctrico
  real (kind=8):: gama,alfaZ,b0,b1,b2,faZ
  funcsigmaPE=9.9932D-29*((alfaZ)**4)*(faZ/gama)*(b0+b1/gama+b2/gama**2) 
end function funcsigmaPE

real(kind=8) function funcsigmaKN(gama)
!Funcion que calcula sección eficaz Efecto Compton
  real (kind=8):: gama
  funcsigmaKN=4.9966D-29*(((1.0D0+gama)/gama**2)*(2.0D0*(1.0D0+gama)/(1.0D0+gama*2.0D0) &
               -log(1.0D0+2.0D0*gama)/gama) &
               +log(1.0D0+2.0D0*gama)/(2.0D0*gama)-(1.0D0+3.0D0*gama)/(1.0D0+2.0D0*gama)**2)
end function funcsigmaKN

!*********************************************************************************

! Classical stoping power equation
! ================================
! Ref: Eq. 5.18, Pag. 119 [1] (see ref. in README.md file)
! z: atomic number
! n: density of particles
! m: mass of particle
! v: velocity of particles
! frec: frecuency of orbital 
real(dp) function classtopwr(z,n,m,v,frec)
  integer :: z,n,m,v,frec
  classtopwr=(4*((k0*z*(ech**2))**2)*n)/(m*(v**2))*log((m*v**2)/(hp*frec))
end function classtopwr


end module functions
