! (c) Carlos A. Gimenez
! licensed under the GNU General Public License V3
subroutine stopping_power

  use functions
  use constants
  use readinput

implicit none

integer,dimension(100):: conteo
integer :: i

i = 1
write(*,*) 'Test variables'

write(*,*) 'pi:', pi
write(*,*) 'ech:', ech
write(*,*) 'hp:', hp
write(*,*) 'emass:', emass
write(*,*) 'pmass:', pmass
write(*,*) 'nmass:', nmass
write(*,*) 'cvalue:', cvalue
write(*,*) 'avnum:', avnum
write(*,*) 'k0:', k0

call readeig_mod

write(*,*) z, headtitle, velocity


write(*,*) 'Please set the INPUT.inp file'



write(*,*) 'classtopwr', classtopwr(i,i,i,i,i)

  stop

end subroutine stopping_power
     
  
