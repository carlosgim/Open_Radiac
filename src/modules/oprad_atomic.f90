module oprad_atomic
!================================================================================!
! Initializacion of all variables for atomic
!================================================================================!
!
!   This module was develop by: Francisco Pasian
!
!                                  Natural and Exact Science Faculty
!                                  Northeastern University of Argentina,
!                                  Corrientes, Argentina
!
! 
!   10 of sept 2015
!
!================================================================================!



  implicit none

  public  :: oprad_atomic_print_test


  type :: oprad_variables
    integer :: ntest
    character(len=50) :: title
  end type oprad_variables

contains

  subroutine oprad_atomic_print_test
!
  !==============================================================================!
  !           Initialize module of Atomic Running                             !
  !==============================================================================!

!  ntest=21
  write(*,*) 'ntest'
  end subroutine oprad_atomic_print_test


end module oprad_atomic
