! (c) Carlos A. Gimenez
! licensed under the GNU General Public License V3
!include 'oprad.f90'
program main

implicit none
 integer :: i
! character :: openrad

write(*,*) "Init Program"
write(*,*) "Please choose what program do you want to run:"
write(*,*) "1: OpenRadiac"
write(*,*) "2: burninhell"
read(*,*) i

if (i.eq.1) then
 call openradiac    
elseif(i.eq.2) then
! call burninhell
endif

  stop
end program main
     
  
