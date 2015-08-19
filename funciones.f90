real (kind=8) function fs(rig,N,sigma)
!Funcion que calcula el camino libre
  implicit none
  real(kind=8),intent(in):: N
  real (kind=8)::rig,sigma,fs
 fs=-log(rig)/(N*sigma) !El factor 1D2 viene de corregir N (1/m^3)
  
  return
end function fs


real (kind=8) function funcsigmaPE(gama,alfaZ,b0,b1,b2,Pi,faZ)
!Funcion que calcula sección eficaz Efecto Fotoeléctrico
  implicit none
  real (kind=8)::Pi,gama,alfaZ,b0,b1,b2,faZ
  funcsigmaPE=9.9932D-29*((alfaZ)**4)*(faZ/gama)*(b0+b1/gama+b2/gama**2) 
  return
end function funcsigmaPE

real (kind=8) function funcsigmaKN(Pi,gama)
!Funcion que calcula sección eficaz Efecto Compton
  implicit none
  real (kind=8)::Pi,gama
  funcsigmaKN=4.9966D-29*(((1.0D0+gama)/gama**2)*(2.0D0*(1.0D0+gama)/(1.0D0+gama*2.0D0) &
               -log(1.0D0+2.0D0*gama)/gama) &
               +log(1.0D0+2.0D0*gama)/(2.0D0*gama)-(1.0D0+3.0D0*gama)/(1.0D0+2.0D0*gama)**2)
  return
end function funcsigmaKN
