! (c) Carlos A. Gimenez
! licensed under the GNU General Public License V3
module convert_unit

  use constants
  
  implicit none

contains

!*********************************************************************************
! Put references to these equations (!)

real(dp) function mevtoj(mev)
! Convert Mev to Joul
  real(dp), intent(in):: mev
  mevtoj = 1.6021773e-13*mev
end function mevtoj

real(dp) function jtomev(j)
! Convert Mev to Joul
  real(dp), intent(in):: j
  jtomev = 6241506479960.0*j
end function jtomev

end module convert_unit
