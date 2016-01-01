! (c) Carlos A. Gimenez
! licensed under the GNU General Public License V3
! include 'oprad.f90'
program main

!================================================================================!
! Interface program
!================================================================================!
!
!   This module was develop by: Carlos A. Gimenez
!
!                                  Natural and Exact Science Faculty
!                                  Northeastern University of Argentina,
!                                  Corrientes, Argentina
!
! 
!   01 of jan 2016
!
!================================================================================!


implicit none
 integer :: i
! character :: openrad

write(*,*) '**********************************************'
write(*,*) 'Please choose what program do you want to run:'
write(*,*) ' '
write(*,*) '1: OpenRadiac'
write(*,*) '2: Stopping Power'
write(*,*) '3: burn in hell'
read(*,*) i
write(*,*) '**********************************************'
write(*,*) ' '

if (i.eq.1) then
 call openradiac    
elseif(i.eq.2) then
 write(*,*) 'Running Stopping Power Program'
 write(*,*) '=============================='
 call stopping_power
 write(*,*) 'May the soft be with you!'
elseif(i.eq.3) then
 write(*,*) 'Get of here!'
endif


  stop
end program main
     
  
