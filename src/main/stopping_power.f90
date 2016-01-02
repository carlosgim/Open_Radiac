! (c) Carlos A. Gimenez
! licensed under the GNU General Public License V3
subroutine stopping_power

  use functions
  use constants
  use readinput
  use convert_unit

implicit none

integer :: i, z, ier
real(dp) :: n, partmass, velocity, beta, kineticenergy, meanI
real(dp) :: density, massnumber

100 format(A,x,f10.5)
101 format(A,x,1pe11.4)
102 format(f10.2,5x,1pe11.4)

open(90,file='cgimsoft.out',status='REPLACE',form='formatted',access='sequential',iostat=ier)

call readinput_mod

! Choose the kind of particle and set the mass
!=============================================

if(kindparticle.eq.'p') then
  partmass = pmass
elseif(kindparticle.eq.'e') then
  partmass = emass
endif

! Parameters of the medium
! ========================
! For whater we have:
massnumber = 18.0
density = 1.0
z = 10
n = partdensity(z,massnumber,density)
! Mean energy excitation from eq. 5.28 see ref [1] (see README.md file)
meanI= exp(0.2D0*log(Iavg(1))+0.8D0*log(Iavg(8)))

! Stopping Power
! ==============
write(90,*) 'INPUT Parameters'
write(90,*) '================'
write(90,*) 'Kind of particle:',' ', kindparticle
write(90,*) ''
write(90,*) 'OUTPUT Parameters'
write(90,*) '================='
write(90,101) 'Check partdensity variable [part m^-3]', n
write(90,101) 'Mean Excitation Energy [eV]', meanI
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
  write(90,102) kineticenergy, jtomev(relatstopwr(1,n,beta,meanI))/100

end do KineticEnergyloop

stop

end subroutine stopping_power
     
  
