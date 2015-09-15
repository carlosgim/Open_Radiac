! (c) Carlos A. Gimenez
! licensed under the GNU General Public License V3
module oprad_functions
  
  implicit none
  public :: fs, funcsigmaPE, funcsigmaKN
!  public :: rig, N, sigma, gama, alfaZ, b0, b1, b2, Pi, faZ
!  real(kind=8) :: rig, N, sigma, gama, alfaZ, b0, b1, b2, Pi, faZ
contains

real(kind=8) function fs(rig,N,sigma)
!Funcion que calcula el camino libre
  real(kind=8),intent(in):: N
  real (kind=8)::rig,sigma
 fs=-log(rig)/(N*sigma) !El factor 1D2 viene de corregir N (1/m^3)
end function fs

real(kind=8) function funcsigmaPE(gama,alfaZ,b0,b1,b2,Pi,faZ)
!Funcion que calcula sección eficaz Efecto Fotoeléctrico
  real (kind=8)::Pi,gama,alfaZ,b0,b1,b2,faZ
  funcsigmaPE=9.9932D-29*((alfaZ)**4)*(faZ/gama)*(b0+b1/gama+b2/gama**2) 
end function funcsigmaPE

real(kind=8) function funcsigmaKN(Pi,gama)
!Funcion que calcula sección eficaz Efecto Compton
  real (kind=8)::Pi,gama
  funcsigmaKN=4.9966D-29*(((1.0D0+gama)/gama**2)*(2.0D0*(1.0D0+gama)/(1.0D0+gama*2.0D0) &
               -log(1.0D0+2.0D0*gama)/gama) &
               +log(1.0D0+2.0D0*gama)/(2.0D0*gama)-(1.0D0+3.0D0*gama)/(1.0D0+2.0D0*gama)**2)
end function funcsigmaKN

end module oprad_functions
