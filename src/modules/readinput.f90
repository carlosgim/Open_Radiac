module readinput
!================================================================================!
! Read input file
!================================================================================!

  implicit none

    integer :: z, iunit, ier, orblvl
    real(kind=8) :: density, massnumber
    character(len=50) :: kindofwork
    character(8)  :: kindparticle,optionwork

contains

  subroutine readinput_mod
  implicit none

! Internal variables
! chdum: dummy variable for references in INPUT file.
! headtitle: just the title of the input.

  integer :: iunit, ier
  character(8)  :: chdum, headtitle

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

! Principal reading
  read(iunit,*) headtitle

! Read kind of work
! =================
  read(iunit,*) kindofwork

  if(kindofwork.eq.'**STOPPW') then
! Stopping power options
! ======================
    read(iunit,*) chdum
    ! Kind of particle (e,p)
    read(iunit,*) kindparticle
    ! Option work .CLASS or .REL
    read(iunit,*) optionwork
    read(iunit,*) chdum
    read(iunit,*) chdum
    read(iunit,*) z
    read(iunit,*) chdum
    read(iunit,*) massnumber
    read(iunit,*) chdum 
    read(iunit,*) density
    read(iunit,*) chdum 
    read(iunit,*) orblvl

  elseif(kindofwork.eq.'**OPRAD') then
      write(*,*) 'nothing to do...'
  endif


  ! close file
  close(iunit,status='keep')
  end subroutine readinput_mod
end module readinput
