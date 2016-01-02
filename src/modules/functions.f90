! (c) Carlos A. Gimenez
! licensed under the GNU General Public License V3
module functions

  use constants
  
  implicit none

contains

!*********************************************************************************
! OPRAD CODE
!*********************************************************************************

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
! STOPPING POWER
!*********************************************************************************

! Classical stopping power equation
! ================================
! Ref: Eq. 5.18, Pag. 119 [1] (see ref. in README.md file)
! z: atomic number
! n: density of particles
! m: mass of particle
! v: velocity of particles
! frec: frecuency of orbital 
real(dp) function classtopwr(z,n,v,frec)
  integer :: z
  real(dp) :: n, frec, v
  classtopwr=(4.0*pi*((k0*z*(ech**2))**2)*n)/(emass*(v**2))*log((emass*v**2)/(hp*frec))
end function classtopwr

! Frecuency of the orbital
! ========================
! Ref: Eq. 5.20, Pag. 120 [1] (see ref. in README.md file)
! z: atomic number
! orblvl: orbital level 
! here we combine the two equations 2.8 and 2.9 from [1].

real(dp) function orbfrec(z,orblvl)
  integer :: z,orblvl
  orbfrec = (2.19D6*z/orblvl)/(2*pi*5.29D-11*(orblvl)**2/z)
end function orbfrec
! ------------------------------------------------------------------------------------------

! Relativistic stopping power equation
! ====================================
! Ref: Eq. 5.23, Pag. 120 [1] (see ref. in README.md file)
! z: atomic number of particle
! n: density of particles
! m: mass of particle
! v: velocity of particles
! frec: frecuency of orbital 
real(dp) function relatstopwr(z,n,beta,Iavg)
  integer :: z
  real(dp) :: n, beta, Iavg
  relatstopwr=4.0*pi*n*(k0*z*(ech**2))**2/(emass*cvalue**2)*(log((2*emass*(cvalue*beta)**2)/(Iavg*(1-beta**2)))-beta**2)
end function relatstopwr

! Mean excitation energy
! ======================
! Ref: Eq. 5.24, Pag. 121 [1] (see ref. in README.md file)
! z: atomic number
! Exressed in eV
real(dp) function Iavg(z)
  integer :: z,orblvl
  if(z.eq.1) then
  Iavg = 19.0
  elseif(z.ge.2.and.z.le.13) then
  Iavg = 11.2+11.7*z
  elseif(z.gt.13) then
  Iavg = 52.8+8.71*z
  endif
end function Iavg



!*********************************************************************************
! medium parameters
! =================

real(dp) function partdensity(z,atmass,density)
  ! z: atomic number
  ! atmass: atomic mass
  ! density: density in g/cm^3
  integer :: z
  real(dp) :: atmass, density
  partdensity = density/atmass*6.022D23*Z*1.0D6
end function partdensity

end module functions
