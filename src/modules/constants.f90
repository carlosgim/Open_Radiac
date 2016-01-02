module constants

    Implicit None

!   Handles
!   =======
    integer, parameter :: stdin  = 5
    integer, parameter :: stdout = 6
    integer, parameter :: stderr = 0
    integer, parameter :: dp = selected_real_kind(15,307)

!   Parameters and physics constants [MKS]
!   ======================================

!   Constants
!   =========

!   pi: Pi number.
    real(dp), parameter :: pi = acos(-1.0_dp)
!   hp: Planck's constant [J s].
    real(dp), parameter :: hp = 6.6261e-34_dp
!   cvalue: velocity of light in vacuum [m/s].
    real(dp), parameter :: cvalue = 2.997925e8_dp
!   avnum: Avogadro's number [mole^-1]
    real(dp), parameter :: avnum = 6.0221e23_dp

!   Particles
!   =========

!   ech: electron charge [C].
    real(dp), parameter :: ech = 1.6022e-19_dp
!   emass: electron mass [kg].
    real(dp), parameter :: emass = 9.1094e-31_dp
!   pmass: proton mass [kg].
    real(dp), parameter :: pmass = 1.6726e-27_dp
!   nmass: neutron mass [kg].
    real(dp), parameter :: nmass = 1.6749e-27_dp

!   Electromagnetic Theory
!   ======================

!   k0: K constant related with electric permitivity in [N m^2 C^-2].
    real(dp), parameter :: k0 = 8.98755e9_dp

end module constants
