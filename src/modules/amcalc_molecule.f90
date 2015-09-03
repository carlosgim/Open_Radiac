module amcalc_molecule
!================================================================================!
! Initializacion of all variables for the qed_nmr module
!================================================================================!

  implicit none

  public  :: amcalc_molecule_print_test


  type :: amcalc_variables
    integer :: ntest
    character(len=50) :: title
  end type amcalc_variables

contains

  subroutine amcalc_molecule_print_test

  !==============================================================================!
  !           Initialize module of Molecules Running                             !
  !==============================================================================!

!  ntest=21
  write(*,*) 'ntest'
  end subroutine amcalc_molecule_print_test


end module amcalc_molecule
