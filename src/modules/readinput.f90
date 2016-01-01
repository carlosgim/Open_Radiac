module readinput
!================================================================================!
! Read input file
!================================================================================!

  implicit none

!  type :: stopping_power_code
    integer :: z, iunit, ier
    integer :: velocity
    character(len=50) :: title
!  end type stopping_power_code

!type( stopping_power_code), public :: var

  ! Some global parameter

  ! Internal variables
  ! headtitle: just the title of the input.
  ! chdum: dummy variable for references in INPUT file.
  character(8)  :: headtitle, chdum

contains

  subroutine readeig_mod
  implicit none
  
  integer :: iunit, ier
!  integer :: velocity
  !------------------------------------------------------------------------------!
  !                       Initialize global variables                            !
  !------------------------------------------------------------------------------!
  iunit = 60
  ! open file
  open(iunit,file='INPUT.inp',status='old',form='formatted',access='sequential',iostat=ier)

  if(ier /= 0)then
    write(*,*) 'Reading input error: ERROR while opening INPUT.INP file'
    stop
  endif

  rewind iunit

  ! dcbgen.h
  read(iunit,*) headtitle
  read(iunit,*) z
  read(iunit,*) velocity
  write(*,*) 'readinput z',z

  ! close file
  close(iunit,status='keep')
  end subroutine readeig_mod
end module readinput
