! (c) Carlos A. Gimenez
! licensed under the GNU General Public License V3
subroutine stopping_power

  use functions
  use constants
  use readinput
  use convert_unit

implicit none

integer :: i
real(dp) :: frec, n, partmass, velocity, beta

open(90,file='cgimsoft.out',status='REPLACE',form='formatted',access='sequential',iostat=ier)
100 format(A,x,f10.5)
101 format(A,x,1pe11.4)
i = 1
write(90,*) 'Parameters'
write(90,*) '=========='
write(90,100) 'pi:', pi
write(90,101) 'ech [C]:', ech
write(90,101) 'Plank Constant:', hp
write(90,101) 'emass:', emass
write(90,101) 'pmass:', pmass
write(90,101) 'nmass:', nmass
write(90,101) 'cvalue [m s^-1]:', cvalue
write(90,101) 'avnum:', avnum
write(90,101) 'k0:', k0
write(90,*) ''
write(90,*) 'INPUT Parameters'
write(90,*) '================'
write(90,*) 'Kind of particle:',' ', kindparticle
write(90,100) 'Kinetic energy [MeV]:', kineticenergy
write(90,*) 'Atomic number of target:', z
write(90,100) 'Mass number:', massnumber
write(90,100) 'Density [g cm^{-3}]:', density
write(90,*) 'Orbital level:', orblvl



! Choose the kind of particle and set the mass
!=============================================

if(kindparticle.eq.'p') then
partmass = pmass
elseif(kindparticle.eq.'e') then
partmass = emass
endif

! Using the expresion: V=(2T/M)^{1/2}, just take from kinetic energy definition
! ==============================================================================

velocity = sqrt(2.0*mevtoj(kineticenergy)/partmass)

! Calculate the frecuency orbital
! ===============================

frec = orbfrec(z,orblvl)

! Calculate density of particles in medium
! ========================================

n = partdensity(z,massnumber,density)

write(90,*) ''
write(90,*) 'OUTPUT Parameters'
write(90,*) '================='
write(90,101) 'Check frecuency variable', frec
write(90,101) 'Check partdensity variable [part m^-3]', n
write(90,101) 'Check velocity variable [m s^-1]', velocity

call readinput_mod

! Print Classic or Relativistic Stopping Power
! ============================================
if(optionwork.eq.'.CLASS') then

write(90,101) 'Classic Stopping Power [MeV cm^-1]', jtomev(classtopwr(1,n,velocity,frec))/100

elseif(optionwork.eq.'.REL') then

beta = velocity/cvalue
write(90,101) 'Beta parameter v/c', beta
write(90,101) 'Mean Excitation Energy', Iavg(z)
write(90,101) 'Particle Mass', partmass
write(90,101) '////////////////////////////////////////////////////'
write(90,101) 'Relativistic Stopping Power [MeV cm^-1]', jtomev(relatstopwr(1,n,beta,Iavg(z)))/100
endif

stop

end subroutine stopping_power
     
  
