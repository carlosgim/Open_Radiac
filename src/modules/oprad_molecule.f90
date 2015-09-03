module oprad_molecule
!================================================================================!
! Initializacion of all variables for the qed_nmr module
!================================================================================!

  implicit none

  public  :: oprad_molecule_print_test


  type :: oprad_variables
    integer :: ntest
    character(len=50) :: title
  end type oprad_variables

contains

  subroutine oprad_molecule_print_test

  !==============================================================================!
  !           Initialize module of Molecules Running                             !
  !==============================================================================!

!  ntest=21
  write(*,*) 'ntest'
  end subroutine oprad_molecule_print_test


end module oprad_molecule
