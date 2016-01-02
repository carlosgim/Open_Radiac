! (c) Carlos A. Gimenez
! licensed under the GNU General Public License V3
subroutine stopping_power

  use functions
  use constants
  use readinput
  use convert_unit

implicit none

integer :: i
real(dp) :: frec, n, partmass, velocity, beta, kineticenergy

100 format(A,x,f10.5)
101 format(A,x,1pe11.4)
102 format(f10.2,5x,1pe11.4)

open(90,file='cgimsoft.out',status='REPLACE',form='formatted',access='sequential',iostat=ier)


! Choose the kind of particle and set the mass
!=============================================

if(kindparticle.eq.'p') then
  partmass = pmass
elseif(kindparticle.eq.'e') then
  partmass = emass
endif



! Calculate density of particles in medium
! ========================================

n = partdensity(z,massnumber,density)

call readinput_mod

! Classic Stopping Power
! ======================

if(optionwork.eq.'.CLASS') then
write(90,*) 'INPUT Parameters'
write(90,*) '================'
write(90,*) 'Kind of particle:',' ', kindparticle
write(90,*) 'Atomic number of target:', z
write(90,100) 'Atomic mass:', massnumber
write(90,100) 'Density [g cm^{-3}]:', density
write(90,*) 'Orbital level:', orblvl
! Calculate the frecuency orbital
frec = orbfrec(z,orblvl)

write(90,*) ''
write(90,*) 'OUTPUT Parameters'
write(90,*) '================='
write(90,101) 'Check frecuency variable', frec
write(90,101) 'Check partdensity variable [part m^-3]', n
write(90,101) 'Check velocity variable [m s^-1]', velocity
write(90,*) ''
write(90,101) '************************************************'
write(90,101) '           Classic Stopping Power          '
write(90,101) '************************************************'
write(90,101) ''
write(90,101) 'Energy [MeV]   SP[MeV cm^-1]'
do i=1,100,1
  kineticenergy = 1.0*i
! Using the expresion: V=(2T/M)^{1/2}, just take from kinetic energy definition
velocity = sqrt(2.0*mevtoj(kineticenergy)/partmass)
write(90,102) kineticenergy, jtomev(classtopwr(1,n,velocity,frec))/100
end do 

! Classic Stopping Power
! ======================
elseif(optionwork.eq.'.REL') then
write(90,*) 'INPUT Parameters'
write(90,*) '================'
write(90,*) 'Kind of particle:',' ', kindparticle
write(90,*) 'Atomic number of target:', z
write(90,100) 'Mass number:', massnumber
write(90,100) 'Density [g cm^{-3}]:', density
write(90,*) ''
write(90,*) 'OUTPUT Parameters'
write(90,*) '================='
write(90,101) 'Check frecuency variable', frec
write(90,101) 'Check partdensity variable [part m^-3]', n
write(90,101) 'Check velocity variable [m s^-1]', velocity
write(90,101) 'Beta parameter v/c', beta
write(90,101) 'Mean Excitation Energy [eV]', Iavg(z)
! We need convert eV to MeV and then transform.
write(90,101) 'Mean Excitation Energy [J]', mevtoj(Iavg(z)/1.0D6)
write(90,101) 'Particle Mass', partmass
write(90,101) ''
write(90,101) ''
write(90,101) '************************************************'
write(90,101) '           Relativistic Stopping Power          '
write(90,101) '************************************************'
write(90,101) ''
write(90,101) 'Energy [MeV]   SP[MeV cm^-1]'

KineticEnergyloop: do i=1,100,1
  kineticenergy = 1.0*i
  velocity = sqrt(2.0*mevtoj(kineticenergy)/partmass)
  beta = velocity/cvalue
  write(90,102) kineticenergy, jtomev(relatstopwr(1,n,beta,mevtoj(Iavg(z)/1.0D6)))/100

end do KineticEnergyloop

endif

stop

end subroutine stopping_power
     
  
