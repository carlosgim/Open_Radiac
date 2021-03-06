! (c) Carlos A. Gimenez
! licensed under the GNU General Public License V3
module functions

  use constants
  use convert_unit 
  implicit none

contains

!*********************************************************************************
! OPRAD CODE
!*********************************************************************************

real(kind=8) function fs(rig,N,sigma)
!Funcion que calcula el camino libre
  real(kind=8),intent(in):: N
  real (kind=8)::rig,sigma
 fs=-log(rig)/(N*sigma) !El factor 1D1 viene de corregir N (1/m^3)
end function fs

real(kind=8) function funcsigmaPE(gama,alfaZ,b0,b1,b2,faZ)
!Funcion que calcula sección eficaz Efecto Fotoeléctrico
  real (kind=8):: gama,alfaZ,b0,b1,b2,faZ
  funcsigmaPE=9.9932D-29*((alfaZ)**4)*(faZ/gama)*(b0+b1/gama+b2/gama**2) 
end function funcsigmaPE

real (kind=8) function fsigmaPE(Z,E1)
	implicit none
  real (kind=8) :: Z,E1	
if (Z.eq.6.) then
!Carbono
fsigmaPE= 0.0000112051*(E1**(-3.2827936727))
elseif (Z.eq.13.) then
!Aluminio  
fsigmaPE= 0.0005759269*(E1**(-3.2342414732))
elseif (Z.eq.14.) then
!Silicio
fsigmaPE= 0.0008348546*(E1**(-3.1394675925))
elseif (Z.eq.32.) then
!Germanio
fsigmaPE= 0.0619747762*(E1**(-2.7882544211))
elseif (Z.eq.50.) then
!Estaño
fsigmaPE= 0.6422055768*(E1**(-2.4732484278))
elseif (Z.eq.82.) then
!Plomo
fsigmaPE= 6.8480302727*(E1**(-2.0400166499))
end if
	return
end function fsigmaPE

real(kind=8) function funcsigmaKN(gama)
!Funcion que calcula sección eficaz Efecto Compton
  real (kind=8):: gama
  funcsigmaKN=4.9966D-29*(((1.0D0+gama)/gama**2)*(2.0D0*(1.0D0+gama)/(1.0D0+gama*2.0D0) &
               -log(1.0D0+2.0D0*gama)/gama) &
               +log(1.0D0+2.0D0*gama)/(2.0D0*gama)-(1.0D0+3.0D0*gama)/(1.0D0+2.0D0*gama)**2)
end function funcsigmaKN

!*********************************************************************************
! Relativistic stopping power equation 
!*********************************************************************************
! z: atomic number of particle
! n: density of particles
! m: mass of particle
! v: velocity of particles
! the 1.0D6 factor is because we express in eV the argument of log
! the 100 factor is because we work in cm

! Protons and heavy particles
! ===========================
! Ref: Eq. 5.23, Pag. 120 [1] (see ref. in README.md file)
real(dp) function stopwrprot(z,n,beta,Iavg)
  integer :: z
  real(dp) :: A, Fbeta, n, beta, Iavg
 ! A: Correspond to coefficient with [MeV cm^-1] units.
  A = jtomev(4.0*pi*n*(k0*z*(ech**2.0))**2.0/(emass*cvalue**2.0))/100
 Fbeta = (log(1.0D6*(jtomev(2.0*emass*cvalue**2.0))*beta**2/(1.0-beta**2))-beta**2)
  stopwrprot=(A/beta**2)*(Fbeta-log(Iavg))
end function stopwrprot

! Electrons
! =========
! Ref: Eq. 6.5, Pag. 140 [1] (see ref. in README.md file)
real(dp) function stopwrelec(n,beta,Iavg,kineticenergy)
  real(dp) :: A, Gbeta, Fbeta, n, beta, Iavg, tau, kineticenergy

 ! A: Correspond to coefficient with [MeV cm^-1] units.
 ! tau: correspond to the relation between kinetic energy and the 
 ! mass rest of electron 0.511

  tau = kineticenergy/0.511
  A = jtomev(4.0*pi*n*(k0*(ech**2.0))**2.0/(emass*cvalue**2.0))/100

  Fbeta = (1.0-beta**2.0)/2.0*(1.0+tau**2.0/8.0-(2.0*tau+1.0)*log(2.0))

  Gbeta = log(3.61D5*tau*sqrt(tau+2.0))+Fbeta

  stopwrelec=(A/beta**2)*(Gbeta-log(Iavg))

end function stopwrelec


!*********************************************************************************
! medium parameters
!*********************************************************************************

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


! Particles density [part m^-3]
! =============================

real(dp) function partdensity(z,atmass,density)
  ! z: atomic number
  ! atmass: atomic mass
  ! density: density in g/cm^3
  integer :: z
  real(dp) :: atmass, density
  partdensity = density/atmass*6.022D23*Z*1.0D6
end function partdensity

end module functions
