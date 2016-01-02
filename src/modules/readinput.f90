module readinput
!================================================================================!
! Read input file
!================================================================================!

  implicit none

    character(8)  :: kindparticle, kindofwork

contains

  subroutine readinput_mod
  implicit none

! Internal variables
! chdum: dummy variable for references in INPUT file.
! headtitle: just the title of the input.

  integer :: iunit, ier
  character(8)  :: chdum

  iunit = 60
  ! open file
  open(iunit,file='INPUT.inp',status='old',form='formatted',access='sequential',iostat=ier)

  if(ier /= 0)then
    write(*,*) 'Reading input error: ERROR while opening INPUT.INP file'
    stop
  endif

  rewind iunit

! Principal reading
  read(iunit,*) chdum

! Read kind of work
! =================
  read(iunit,*) kindofwork

  if(kindofwork.eq.'**STOPPW') then
! Stopping power options
! ======================
    read(iunit,*) chdum
    ! Kind of particle (e,p)
    read(iunit,*) kindparticle

  elseif(kindofwork.eq.'**OPRAD') then
      write(*,*) 'nothing to do...'
  endif

  ! close file
  close(iunit,status='keep')
  end subroutine readinput_mod
end module readinput
