! (c) Carlos A. Gimenez
! licensed under the GNU General Public License V3
subroutine stopping_power

  use functions
  use constants
  use readinput

implicit none

integer,dimension(100):: conteo
integer :: i

open(90,file='cgimsoft.out',status='REPLACE',form='formatted',access='sequential',iostat=ier)
100 format(A,x,f10.5)
101 format(A,x,1pe11.4)
i = 1
write(90,*) 'Parameters'
write(90,*) '=========='
write(90,100) 'pi:', pi
write(90,101) 'ech:', ech
write(90,101) 'hp:', hp
write(90,101) 'emass:', emass
write(90,101) 'pmass:', pmass
write(90,101) 'nmass:', nmass
write(90,101) 'cvalue:', cvalue
write(90,101) 'avnum:', avnum
write(90,101) 'k0:', k0
write(90,*) ''
write(90,*) 'INPUT Parameters'
write(90,*) '=========='
write(90,*) 'Velocity of particle:', velocity
write(90,*) 'Atomic Number:', z
call readeig_mod

write(90,101) 'classtopwr', classtopwr(i,i,i,i,i)

  stop

end subroutine stopping_power
     
  
